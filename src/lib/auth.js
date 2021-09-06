module.exports = {
    //por cada ruta vamos a procesar datos
    isLoggedIn(req, res, next){
        if(req.isAuthenticated()){
            return next();
        }
        return res.redirect('/signin')
    }

}