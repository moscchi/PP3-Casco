const mysql = require('mysql');
const { database } = require('./keys');
const { promisify } = require('util');
const pool = mysql.createPool(database);
//Aca configuramos la conexion a la bd



//Obtenemos la conexion a la bd, sumado a una serie de validaciones de errores
pool.getConnection((err, connection) => {
    if(err){
        if(err.code === 'PROTOCOL_CONNECTION_LOST'){
            console.error('DATABASE CONNECTION WAS CLOSED');
        }
        if(err.code === 'ER_CON_COUNT_ERROR') {
            console.error('DATABASE MAS TO WAY CONNECTIONS');
        }
        if(err.code === 'ECONNREFUSED'){
            console.error('DATABASE CONNECTION WAS REFUSED')
        }
    }
    //Si llegamos aca es porque obtuvimos conexion
    if (connection) connection.release();
    console.log('DB is connected');
    return
})

//Convertimos en promesa las consultas a la bd
pool.query = promisify(pool.query);


//Exportamos la configuracion a la conexion de la bd, la consumimos en links.
module.exports = pool;