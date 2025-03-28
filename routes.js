const express = require('express');
const connection = require('express-myconnection');
const routes = express.Router();


routes.get('/', (req, res) => {
    req.getConnection((err, conn) => {
        if (err) return res.send(err);

        conn.query('SELECT * FROM usuarios', (err, rows) => {
            if (err) return res.send(err);

            res.json(rows);
        });
    });
});

routes.post('/', (req, res) => {
    req.getConnection((err, conn) => {
        if (err) return res.send(err);

        conn.query('INSERT INTO usuarios (nombre1, nombre2, apellido1, apellido2, edad, email, nacionalidad) VALUES (?, ?, ?, ?, ?, ?, ?)',
    [req.body.nombre1, req.body.nombre2, req.body.apellido1, req.body.apellido2, req.body.edad, req.body.email, req.body.nacionalidad],
    (err, rows) => {
        if (err) return res.send(err);
        res.send('Usuario registrado exitosamente!');
    }
);

    });
});


module.exports = routes