const express = require('express');
const router = express.Router();
const passport = require('passport');
const { isLoggedIn} = require('../lib/auth');


router.get('/signup', (req, res) => {
    res.render('auth/signup')
});

router.post('/signup', passport.authenticate('local.signup', {
        successRedirect: '/profile',
        failureRedirect: '/signup',
        failureFlash: true
    })
    
);


router.get('/signin', (req, res) => {
    res.render('auth/signin')
})

router.post('/signin', (req, res, next) => { //Lo hacemos distinto a signup pq para despues poder validarlo
    passport.authenticate('local.signin', {
        successRedirect: '/profile',
        failureRedirect: '/signin',
        failureFlash: true
    }) (req, res, next)
})
router.get('/profile', isLoggedIn, (req, res) => {
    if(req.user.rol === 'admin'){
        res.render('profileAdmin')
    } else{
    res.render('profile');
    }
})

router.get('/links/profile', isLoggedIn, (req, res) => {
    if(req.user.rol === 'admin'){
        res.render('profileAdmin')
    } else{
    res.render('profile');
    }
})

router.get('/logout', (req, res) => {
    req.logOut();
    res.redirect('/signin');
})
module.exports = router;