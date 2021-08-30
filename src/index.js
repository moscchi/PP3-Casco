const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path')
//Dividimos en secciones para tener mas orden

//Inicializaciones -> creo mi aplicacion en si
const app = express();

//settings -> pongo las configuraciones que necesita mi servidor (ejemplo puertos, etc)
//En esta linea le asignare un puerto a la app. Le digo que si existe un puerto en configuraciones (enviroments), lo utilize. Si no, que utilize el puerto 4000 
app.set('port', process.env.PORT || 4000);
//En esta linea le voy a dar la direccion de la carpeta views para usar posteriormente. __dirname es una constante de node que me devuelve la direccion de la carpeta que estoy utilizando. A esta dir le concateno la direccion de la carpeta views(como segundo parametro).
app.set('views', path.join(__dirname, 'views'))
//En esta linea voy a configurar el hbs (motor de plantilla) para que lo use nuestra app
app.engine('.hbs', exphbs({
    defaultLayout: 'main',//Esto significa que main sera la plantilla principal
    layoutsDir: path.join(app.get('views'), 'layouts'), //Aca le digo que busque en la carpeta de esas direcciones. La views declarada previamente y layouts.
    partialsDir: path.join(app.get('views'), 'partials'), //Idem con partials
    extname: '.hbs', //sirve para darle una extension a nuestros archivos handlebars.Lo configuraremos como .hbs
    helpers: require('./lib/handlebars')
}));
//Aca le decimos que use el motor definido arriba (el app.engine)
app.set('view engine', '.hbs');

//Middlewares -> Son las funciones que se utilizan cuando un usuario hace peticiones http
//Aca vamos a decirle a nuestra app que utilize mrogan. Le pasamos el parámetro dev para que veamos que peticiones le llega al servidor .
app.use(morgan('dev'));
//Aca declaramos la extencion deencoded para validar datos de los formularios que use la applicacion
app.use(express.urlencoded({extended: false}))
//Aclaramos que queremos enviar y recibir json's
app.use(express.json())


//Variables globales -> Acá van las variables que se usan en toda la app
app.use((req, res, next) => {
    next();
})


//Rutas -> aca definimos las url's del servidor
//Aca le decimos a la app que use del archivo index, el objeto router que configuramos allí previamente.
app.use(require('./routes/index'))
app.use(require('./routes/authentication'))
app.use('/links', require('./routes/links'))


//Archivos publicos -> es una carpeta donde va todo el codigo para que el navegador pueda acceder.
app.use(express.static(path.join(__dirname, 'public')))


//Arrancar el servidor
app.listen(app.get('port'), () => {
    console.log('Server en puerto ', app.get('port'));
})
