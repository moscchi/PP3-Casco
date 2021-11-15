const transporter = require('../mailer');
const express = require('express');
const pool = require('../database');
const router = express.Router();
const { isLoggedIn, isLoggedAdmin } = require('../lib/auth');
//Consumimos la conexion a la bd.
const db = require('../database');

//Aca redireccionamos cuando el sv reciba del navegador una ruta add
router.get('/mainPage', (req, res) => {
    res.render('links/mainPage');
})

router.get('/chatbot', (req, res) => {
    res.render('links/chatbot');
})


router.get('/ayudaContacto', (req, res) => {
    res.render('links/ayudaContacto');
})

router.get('/chatbot', (req, res) => {
    res.render('links/chatbot')
})

//Tenemos la ruta del formulario para invitado (no registrado)
router.get('/addDeInvitado', (req, res) => {
    res.render('links/addDeInvitado')
})

router.post('/addDeInvitado', async (req, res) => {
    const { title, nombre, apellido, email, tipo, comentario, status } = req.body;
    const mensajeNuevo = {
        title,
        nombre,
        apellido,
        email,
        tipo,
        comentario,
        status: 0
    };
    await pool.query('INSERT INTO mensaje_invitado set ?', [mensajeNuevo]);
    req.flash('success', 'Mensaje enviado correctamente.'); //No hace falta importar flash porque al ya ser declarado en app.use (siendo un middleware), req ya puede utilizarlo
    res.redirect('/links/mainPage');
})
//Tenemos la ruta del formulario para usuario registrado.
router.get('/addDeUsuario', isLoggedIn, (req, res) => {
    res.render('links/addDeUsuario')
})
//falta agregar usuario al constante
router.post('/addDeUsuario', isLoggedIn, async (req, res) => {
    const [{id: user_id}] = await pool.query('SELECT id FROM users WHERE username = ?', [req.user.username]);
    const { title, tipo, comentario } = req.body;
    const mensajeUsuario = {
        title,
        tipo,
        comentario,
        user_id,
        status: 0
    };
    await pool.query('INSERT INTO mensaje_usuario set ?', [mensajeUsuario])
    res.redirect('profile');
})

router.get('/usuarioMensajes', isLoggedAdmin, async (req, res) => {
    const mensajesUsuario = await pool.query('SELECT * FROM mensaje_usuario, users WHERE mensaje_usuario.user_id = users.id');
    res.render('links/mensajesUsList', {mensajesUsuario});
})

//Pagina para que el admin vea mensajes de invitados
router.get('/invitadoMensaje', isLoggedAdmin, async (req, res) => {
    const mensajeInvitado = await pool.query('SELECT * FROM mensaje_invitado')
    res.render('links/mensajesInvList', {mensajeInvitado});
})
//Pagina para que el usuario vea sus mensajes
router.get('/mensajesDeUs', isLoggedIn, async (req, res) => {
    const mensajesDeUs = await pool.query('SELECT * FROM mensaje_usuario WHERE user_id = ?', [req.user.id])
    res.render('links/mensajesDeUs', {mensajesDeUs});
})

router.get('/deleteInvitado/:idmensaje_invitado', async (req, res) =>{
    const { idmensaje_invitado } = req.params;
    await pool.query('DELETE FROM mensaje_invitado WHERE idmensaje_invitado = ?', [idmensaje_invitado]);
    req.flash('success', 'Mensaje eliminado satisfactoriamente.')
    res.redirect('/links/invitadoMensaje');
});

router.get('/responderInvitado/:idmensaje_invitado', async (req, res) => {
    const { idmensaje_invitado } = req.params;
    const msjInvitado = await pool.query('SELECT * FROM mensaje_invitado WHERE idmensaje_invitado = ?', [idmensaje_invitado]);
    res.render('links/responderInvitado', {msjInvitado: msjInvitado[0]});
})

router.post('/responderInvitado/:idmensaje_invitado', async (req, res) => {
    const { idmensaje_invitado } = req.params;
    await pool.query(`UPDATE mensaje_invitado set status = '1' where idmensaje_invitado = ?`, [idmensaje_invitado]);
    req.flash('success', 'Mensaje respondido con éxito.')
    res.redirect('/links/invitadoMensaje');
})

router.get('/responderUsuario/:id_mensaje', async (req, res) => {
    const { id_mensaje} = req.params;
    const msjUsuario = await pool.query('SELECT * FROM mensaje_usuario WHERE id_mensaje = ?', [id_mensaje]);
    res.render('links/responderUsuario', {msjUsuario: msjUsuario[0]});
})

router.post('/responderUsuario/:id_mensaje', async (req, res) => {
    const { id_mensaje } = req.params;
    await pool.query(`UPDATE mensaje_usuario set status = '1' where id_mensaje = ?`, [id_mensaje]);
    req.flash('success', 'Mensaje respondido con éxito.')
    res.redirect('/links/mensajesDeUs');
})

router.get('/ayudaContacto', (req, res) => {
    res.render('links/ayudaContacto')
})

module.exports = router;