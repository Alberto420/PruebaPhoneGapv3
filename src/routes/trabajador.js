const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/add', (req, res) => {
    res.render('trabajador/add');
});

router.post('/add', async (req, res) => {
    const { nombre, rut, edad, fecha_ingr, fecha_egr, salario, area_trabajo
     } = req.body;
    const newtrab = {
        
        nombre,
        rut,
        edad,
        fecha_ingr,
        fecha_egr,
        salario,
        area_trabajo,
        
    };
    await pool.query('INSERT INTO trabajador set ?', [newtrab]);
    req.flash('success', 'Trabajador agregado');
    res.redirect('/trabajador');
});

router.get('/', isLoggedIn, async (req, res) => {
    const trabajador = await pool.query('SELECT * FROM trabajador');
    res.render('trabajador/list', { trabajador });
});

router.get('/delete/:ID', async (req, res) => {
    const { ID } = req.params;
    await pool.query('DELETE FROM trabajador WHERE ID = ?', [ID]);
    req.flash('success', 'Trabajador Eliminado Correctamente');
    res.redirect('/trabajador');
    
});

router.get('/edit/:ID', async (req, res) => {
    const { ID } = req.params;
    const trabajador = await pool.query('SELECT * FROM trabajador WHERE ID = ?', [ID]);
    console.log(trabajador);
    res.render('trabajador/edit', {trabajador: trabajador[0]});
});

router.post('/edit/:ID', async (req, res) => {
    const { ID } = req.params;
    const { nombre, rut, edad, fecha_ingr,fecha_egr,salario,area_trabajo} = req.body; 
    const newtrabajador = {
        nombre,
        rut,
        edad,
        fecha_ingr,
        fecha_egr,
        salario,
        area_trabajo
    };
    await pool.query('UPDATE trabajador set ? WHERE ID = ?', [newtrabajador, ID]);
    req.flash('success', 'Trabajador actualizado');
    res.redirect('/trabajador');
});

module.exports = router;