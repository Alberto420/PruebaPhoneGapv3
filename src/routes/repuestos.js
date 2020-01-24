const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/add', (req, res) => {
    res.render('repuestos/add');
});

router.post('/add', async (req, res) => {
    const { nombre, tipo, categoria, marca,stock, precio_costo,precio_venta
     } = req.body;
    const newtrab = {
        
        nombre,
        tipo,
        categoria,
        marca,
        stock,
        precio_costo,
        precio_venta
        
    };
    await pool.query('INSERT INTO repuestos set ?', [newtrab]);
    req.flash('success', 'Repuesto agregado');
    res.redirect('/repuestos');
});

router.get('/', isLoggedIn, async (req, res) => {
    const repuestos = await pool.query('SELECT * FROM repuestos');
    res.render('repuestos/list', { repuestos });
});

router.get('/delete/:ID', async (req, res) => {
    const { ID } = req.params;
    await pool.query('DELETE FROM repuestos WHERE ID = ?', [ID]);
    req.flash('success', 'Repuesto Eliminado Correctamente');
    res.redirect('/repuestos');
    
});

router.get('/edit/:ID', async (req, res) => {
    const { ID } = req.params;
    const repuestos = await pool.query('SELECT * FROM repuestos WHERE ID = ?', [ID]);
    console.log(repuestos);
    res.render('repuestos/edit', {repuestos: repuestos[0]});
});

router.post('/edit/:ID', async (req, res) => {
    const { ID } = req.params;
    const { nombre, tipo, categoria, marca,stock, precio_costo,precio_venta
    } = req.body; 
    const newRepu = {
        nombre,
        tipo,
        categoria,
        marca,
        stock,
        precio_costo,
        precio_venta
    };
    await pool.query('UPDATE repuestos set ? WHERE ID = ?', [newRepu, ID]);
    req.flash('success', 'Repuesto actualizado');
    res.redirect('/repuestos');
});

module.exports = router;