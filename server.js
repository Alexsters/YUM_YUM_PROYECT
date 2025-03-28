const express =  require('express');
const mysql = require('mysql');
const myconn = require('express-myconnection');

const routes = require('./routes.js')


const app = express();
app.set('port', process.env.PORT || 3000);
const dbOptions = {

    host : 'localhost',
    user : 'root',
    password : '',
    port : 3306,
    database : 'yum_yum_db_proyect'

}

//MIDDLEWARES-----------------------------------------------------

app.use(myconn(mysql, dbOptions, 'single'))
app.use(express.json())

//RUTAS ----------------------------------------------------------

app.get('/', (req, res) => {
    res.send('Hello World!');
});
app.use('/api', routes);


//SERVER RUNNING -------------------------------------------------

app.listen(app.get('port'), () => {
    console.log('Server is running on port', app.get('port'));
});