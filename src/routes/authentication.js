const express = require('express');
const router = express.Router();
const passport = require('passport');
const pool = require('../database');
const { isLoggedIn, isNotloggedin } = require('../lib/auth');

// // SIGNUP
router.get('/signin', isNotloggedin, (req, res) => {
  res.render('auth/signup');
});

router.post('/signin', passport.authenticate('local.signin', {
  successRedirect: '/profile',
  failureRedirect: '/signin',
  failureFlash: true
} ));

router.get('/createuser', (req, res) => {
  res.render('auth/create');
});

router.post('/createuser', passport.authenticate('local.signin', {
  successRedirect: '/createuser',
  failureRedirect: '/signin',
  failureFlash: true
} ));


// //SignIN
// router.get('/signin', (req, res) => {
//   res.render('auth/signin');
// });

// router.post('/signin', (req, res, next) => {
//   req.check('nombre', 'Username is Required').notEmpty();
//   req.check('password', 'Password is Required').notEmpty();
//   const errors = req.validationErrors();
//   if (errors.length > 0) {
//     req.flash('message', errors[0].msg);
//     res.redirect('/signin');
//   }
//   passport.authenticate('local.signin', {
//     successRedirect: '/profile',
//     failureRedirect: '/signin',
//     failureFlash: true
//   })(req, res, next);
// });

router.get('/logout', (req, res) => {
  req.logOut();
  res.redirect('/');
});

router.get('/profile', isLoggedIn, (req, res) => {
  res.render('profile');
});

module.exports = router;
