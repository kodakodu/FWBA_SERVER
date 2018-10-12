const express = require ('express');
const mysql = require('mysql');
const cors = require('cors');

const port = 5000;
const app = express();

app.use(cors());

var connexion = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: "",
    database: "fwba_server"
})

const PROJETS_ALL_QUERY = 'SELECT * FROM projets';
const PROJETS_CV_QUERY = 'SELECT * FROM projets WHERE type="cyclev"';
const PROJETS_S_QUERY = 'SELECT * FROM projets WHERE type="scrum"';
const PROJETS_ADD_QUERY = 'INSERT INTO projets (titre,description,type) VALUES ("Nom projet","Projet ajouté","cylev")';
const PERSONNES_QUERY = 'SELECT * FROM personnes';
const LIVRABLES_TEMP_QUERY = 'SELECT * FROM livrables WHERE livrable_type_r=1';
const LIVRABLES_DOC_QUERY = 'SELECT * FROM livrables WHERE livrable_type_r=2';
const LIVRABLES_ALL_QUERY = 'SELECT * FROM livrables';


connexion.connect(function(err){
    if(err) {
        console.error(err);
        return;    
    }
    console.log("Connected!");
    connexion.query(PROJETS_ALL_QUERY, function (err, res){
        if(err) throw err;
        console.log(res);
    });    
});



/////////////////////////////
/////Tous les projets////////
/////////////////////////////

app.get('/api/all_projects', (req,res) => {
    // const projets = [
    //     {id: 1, projet_id: 1, title: 'Projet 1', type: 'scrum'},
    //     {id: 2, projet_id: 1, title: 'Projet 2', type: 'cyclev'},
    //     {id: 3, projet_id: 1, title: 'Projet 3', type: 'scrum'}
    // ];
    // res.json(projets);


    connexion.query(PROJETS_ALL_QUERY, function (err, rows){
        if(err) throw err;
        console.log(rows);
        res.send(rows);
    });
});

///////////////////////////////
/////Les projets cyclev////////
///////////////////////////////

app.get('/api/cyclev_projects', (req,res) => {
    connexion.query(PROJETS_CV_QUERY, function (err, rows){
        if(err) throw err;
        console.log(rows);
        res.send(rows);
    });
});

//////////////////////////////
/////Les projets scrum////////
//////////////////////////////

app.get('/api/scrum_projects', (req,res) => {
    connexion.query(PROJETS_S_QUERY, function (err, rows){
        if(err) throw err;
        console.log(rows);
        res.send(rows);
    });
});

/////////////////////////
/////Ajout projet////////
/////////////////////////

app.get('/api/add_project', (req,res) => {
    connexion.query(PROJETS_ADD_QUERY, function (err, rows){
        if(err) throw err;
        console.log("Projet ajouté!");
        res.send(rows);
    });
});



/////////////////////////////////
/////Toutes les personnes////////
/////////////////////////////////

app.get('/api/persons', (req,res) => {

    connexion.query(PERSONNES_QUERY, function (err, rows){
        if(err) throw err;
        console.log(rows);
        res.send(rows);
    });
});

///////////////////////////////
/////Tous les livrables////////
///////////////////////////////

app.get('/api/all_livrables', (req,res) => {

    connexion.query(LIVRABLES_ALL_QUERY, function (err, rows){
        if(err) throw err;
        console.log(rows);
        res.send(rows);
    });
});

/////////////////////////////////////////
/////Tous les livrables documents////////
/////////////////////////////////////////

app.get('/api/doc_livrables', (req,res) => {

    connexion.query(LIVRABLES_DOC_QUERY, function (err, rows){
        if(err) throw err;
        console.log(rows);
        res.send(rows);
    });
});

/////////////////////////////////////////
/////Tous les livrables templates////////
/////////////////////////////////////////

app.get('/api/temp_livrables', (req,res) => {

    connexion.query(LIVRABLES_TEMP_QUERY, function (err, rows){
        if(err) throw err;
        console.log(rows);
        res.send(rows);
    });
});


app.get('/', function (req, res) {
    //res.sendFile(__dirname + '/html/index.html');
    res.send("Erreur");
   });

app.listen(port, () => console.log(`Server started on ${port}`)); 