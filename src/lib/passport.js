const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const pool = require('../database');
const helpers = require('../lib/helpers')

passport.use('local.signin', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'contraseña',
    passReqToCallback: true
}, async(req, username, contraseña, done) => {
    console.log(req.body)
    try {
        const rows = await pool.query('SELECT * FROM users WHERE username = ?', [username]);
        if (rows.length > 0){
            const user = rows[0];
            const contraValidada = await helpers.compararContraseñas(contraseña, user.contraseña);
            if (contraValidada){
                done(null, user, req.flash('success', 'Bienvenido ' + user.nombre + ' ' + user.apellido));
            } else {
                done(null, false, req.flash('message','Usuario o Contraseña incorrecto'));
            } 
        } else {
            return done(null, false, req.flash('message', 'Usuario o Contraseña incorrecto')); //Mando los dos mensajes iguales por protocolos de seguridad, donde a un posible atacante no le doy la info de contraseña incorrecta para que nos epa si el usuario esta bien o no.
        }
    } catch(e) {
        console.log(e);
    }
}));

passport.use('local.signup', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'contraseña',
    passReqToCallback: true
}, async (req, username, contraseña, done) => {
    try {
    const { nombre, apellido, email } = req.body;
    const newUser = {
        username,
        contraseña,
        nombre,
        apellido,
        email,
        rol: 'user'
    };
    newUser.contraseña = await helpers.encriptarContraseña(contraseña);
    const result = await pool.query('INSERT INTO users SET ?', [newUser]);
    newUser.id = result.insertId;
    return done(null, newUser);
    } catch(e){
        console.log(e);
    }
}));

passport.serializeUser((user, done) => {
    done(null, user.id);
})

passport.deserializeUser(async (id, done) => {
    try {
        const rows = await pool.query('SELECT * FROM users WHERE id = ?', [id]);
        done(null, rows[0]);
    } catch(e){
        console.log(e)
    }
})
