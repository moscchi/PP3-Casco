module.exports = {
    //por cada ruta vamos a procesar datos
    isLoggedIn(req, res, next){
        if(req.isAuthenticated()){
            return next();
        }
        return res.redirect('/signin');
    },

    isLoggedAdmin(req, res, next){
        if(req.isAuthenticated() && req.user.rol === 'admin'){
            return next();
        }
        return res.redirect('/signin');
    }
}