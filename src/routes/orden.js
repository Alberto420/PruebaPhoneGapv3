const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/add', (req, res) => {
    res.render('orden/add');
});

router.post('/add', async (req, res) => {
    const { fecha_inicio, fecha_entrega, detalle, estado, patente_cli, encargado
     } = req.body;
    const newAct = {
        fecha_inicio, 
        fecha_entrega, 
        detalle, 
        estado, 
        patente_cli, 
        encargado 
    };
    await pool.query('INSERT INTO actividad set ?', [newAct]);
    req.flash('success', 'Orden agregada');
    res.redirect('/orden');
});

router.get('/', isLoggedIn, async (req, res) => {
    const orden = await pool.query('SELECT * FROM actividad');
    res.render('orden/list', { orden });
});

router.get('/delete/:ID', async (req, res) => {
    const { ID } = req.params;
    await pool.query('DELETE FROM actividad WHERE ID = ?', [ID]);
    req.flash('success', 'Orden Eliminada Correctamente');
    res.redirect('/orden');
    
});

router.get('/edit/:ID', async (req, res) => {
    const { ID } = req.params;
    const orden = await pool.query('SELECT * FROM actividad WHERE ID = ?', [ID]);
    console.log(orden);
    res.render('orden/edit', {orden: orden[0]});
});

router.post('/edit/:ID', async (req, res) => {
    const { ID } = req.params;
    const { fecha_inicio, fecha_entrega, detalle, estado, patente_cli, encargado
    } = req.body; 
    const newActi = {
        fecha_inicio, 
        fecha_entrega, 
        detalle, 
        estado, 
        patente_cli, 
        encargado
    };
    await pool.query('UPDATE actividad set ? WHERE ID = ?', [newActi, ID]);
    req.flash('success', 'Orden actualizada');
    res.redirect('/orden');
});

module.exports = router;