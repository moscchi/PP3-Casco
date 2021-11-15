//Este archivo va a almacenar todas las rutas principales de nuestra app
const express = require('express');

//En esta linea voy a recurrir a la funcion router de express que me devuelve un objeto
const router = express.Router();

router.get('/', (req, res) => {
    res.send('Natural message Server is up!');
})


//exporto el objeto router
module.exports = router;