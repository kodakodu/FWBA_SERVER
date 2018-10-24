const PROJETS_ALL_QUERY = 'SELECT * FROM projets';
const PROJETS_CV_QUERY = 'SELECT * FROM projets WHERE type="cyclev"';
const PROJETS_S_QUERY = 'SELECT * FROM projets WHERE type="scrum"';
const PROJETS_ADD_QUERY = 'INSERT INTO projets (titre,description,type) VALUES ("Nom projet","Projet ajouté","cylev")';
const PERSONNES_QUERY = 'SELECT * FROM personnes';
const LIVRABLES_TEMP_QUERY = 'SELECT * FROM livrables WHERE livrable_type_r=1';
const LIVRABLES_DOC_QUERY = 'SELECT * FROM livrables WHERE livrable_type_r=2';
const LIVRABLES_ALL_QUERY = 'SELECT * FROM livrables';