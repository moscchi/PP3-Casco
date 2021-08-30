const express = require('express');
const pool = require('../database');

const router = express.Router();

//Consumimos la conexion a la bd.
const db = require('../database');

//Aca redireccionamos cuando el sv reciba del navegador una ruta add
router.get('/mainPage', (req, res) => {
    res.render('links/mainPage')
})

router.get('/ayudaContacto', (req, res) => {
    res.render('links/ayudaContacto')
})

//Tenemos la ruta del formulario para invitado (no registrado)
router.get('/addDeInvitado', (req, res) => {
    res.render('links/addDeInvitado')
})

router.post('/addDeInvitado', async (req, res) => {
    const { title, nombre, apellido, email, tipo, comentario } = req.body;
    const mensajeNuevo = {
        title,
        nombre,
        apellido,
        email,
        tipo,
        comentario
    };
    await pool.query('INSERT INTO mensaje_invitado set ?', [mensajeNuevo])
    res.redirect('/links/mainPage');
})
//Tenemos la ruta del formulario para usuario registrado.
router.get('/addDeUsuario', (req, res) => {
    res.render('links/addDeUsuario')
})
//falta agregar usuario al constante
router.post('/addDeUsuario', async (req, res) => {
    const { title, tipo, email, comentario, user_id } = req.body;
    const mensajeUsuario = {
        title,
        tipo,
        email,
        comentario,
        user_id
    };
    //await pool.query('INSERT INTO mensaje_usuario set ?', [mensajeUsuario])
    console.log(mensajeUsuario)
    res.send('received');
})

//Pagina para que usuario vea sus mensajes --VER ACA PAGINA USUARIO MENSAJES-- ver parte 1:20 del video
router.get('/usuarioMensaje', async (req, res) => {
    const mensajesUsuario = await pool.query('SELECT * FROM mensaje_usuario')
    console.log(mensajesUsuario)
    res.render('links/mensajesUsList', {mensajesUsuario});
})
// Falta agregar logica para que pueda entrar solo el administrador aca... y que pueda responder y eliminar mensajes
router.get('/invitadoMensaje', async (req, res) => {
    const mensajeInvitado = await pool.query('SELECT * FROM mensaje_invitado')
    res.render('links/mensajesInvList', {mensajeInvitado});
})

router.get('/deleteInvitado/:idmensaje_invitado', async (req, res) =>{
    const { idmensaje_invitado } = req.params;
    await pool.query('DELETE FROM mensaje_invitado WHERE idmensaje_invitado = ?', [idmensaje_invitado]);
    res.redirect('/links/invitadoMensaje');
});

router.get('/responderInvitado/:idmensaje_invitado', async (req, res) => {
    const { idmensaje_invitado } = req.params;
    const msjInvitado = await pool.query('SELECT * FROM mensaje_invitado WHERE idmensaje_invitado = ?', [idmensaje_invitado]);
    console.log(msjInvitado)
    res.render('links/responderInvitado', {msjInvitado: msjInvitado[0]});

})
module.exports = router;