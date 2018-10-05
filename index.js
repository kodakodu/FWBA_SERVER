const express = require ('express');
const mysql = require('mysql');
const cors = require('cors');

const port = 5000;
const app = express();

var connexion = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: "",
    database: "fwba_server"
})

const PROJETS_QUERY = 'SELECT * FROM projets';


connexion.connect(function(err){
    if(err) {
        console.error(err);
        return;    
    }
    console.log("Connected!");
    connexion.query(PROJETS_QUERY, function (err, res){
        if(err) throw err;
        console.log(res);
    });

    // connexion.query(POSTES_QUERY, function (err, res){
    //     if(err) throw err;
    //     console.log(res);
    // });
});

app.get('/api/projets', (req,res) => {
    // const projets = [
    //     {id: 1, projet_id: 1, title: 'Projet 1', type: 'scrum'},
    //     {id: 2, projet_id: 1, title: 'Projet 2', type: 'cyclev'},
    //     {id: 3, projet_id: 1, title: 'Projet 3', type: 'scrum'}
    // ];
    // res.json(projets);


    connexion.query(PROJETS_QUERY, function (err, rows){
        if(err) throw err;
        console.log(rows);
        res.send(rows);
    });
});

app.listen(port, () => console.log(`Server started on ${port}`));