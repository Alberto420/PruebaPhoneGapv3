const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const pool = require('../database');
const helpers = require('./helpers');

// //LOGIN
// passport.use('local.signin', new LocalStrategy({
//   usernameField: 'nombre',
//   passwordField: 'password',
//   passReqToCallback: true
// }, async (req, nombre, password, done) => {
//   console.log(req.body);
//   const rows = await pool.query('SELECT * FROM usuarios WHERE nombre = ?', [nombre]);

//   if (rows.length > 0) {
//     const user = rows[0];
//     const validPassword = await helpers.matchPassword(password, user.password);
//     if (validPassword) {
//       done(null, user, req.flash('success', 'Bienvenido ' + user.nom));
//     } else {
//       done(null, false, req.flash('message', 'Password Incorrecto'));
//     }
//   } 
//   else {
//     return done(null, false, req.flash('message', 'El usuario no existe, intentalo otra vez.'));
//   }
// }));

//REGISTRO
passport.use('local.signin', new LocalStrategy({
  //campos para recibir datos
  usernameField: 'nombre',
  passwordField: 'password',
  passReqToCallback: true
}, async (req, nombre, password, done) => {

  const { rut } = req.body;
  const newUser = {
    nombre,
    rut,
    password
  };
  newUser.password = await helpers.encryptPassword(password);
  // Saving in the Database
  const result = await pool.query('INSERT INTO usuarios SET ? ', newUser);
  newUser.id = result.insertId;
  return done(null, newUser);
}));

passport.serializeUser((user, done) => {
  done(null, user.id);
});

passport.deserializeUser(async (id, done) => {
  const rows = await pool.query('SELECT * FROM usuarios WHERE ID = ?', [id]);
  done(null, rows[0]);
});

