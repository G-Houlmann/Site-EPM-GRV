<?php
/**
 * Created by PhpStorm.
 * User: Valentin.PITTET
 * Date: 05.09.2017
 * Time: 14:00
 */

// connexion au serveur MySQL et à la BD
// sortie : $connexion
function getBD() {
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "mld_epm";
    //Connection à la BD project_groupe
    $connexion = new PDO('mysql:host='.$servername.';dbname='.$dbname.';charset=utf8', $username, $password);
    // permet d'avoir plus de détails sur les erreurs retournées
    $connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $connexion;

}

//Fonction : vérifie le login de l'utilisateur
//Sortie : résultat de la requête
function getPwdFromLogin($login)
{
    $connexion = getBD();
    $requete = "SELECT idLogin, motDePasse FROM login WHERE login='" . $login . "'";
    $resultats = $connexion->query($requete);
    if ($donnees = $resultats->fetch()) {
        return $donnees['motDePasse'];
    } else {
        return '';
    }
}

function getTypeCorbeille()
{
    $connexion = getBD();
    $requete = "SELECT SUBSTRING_INDEX(path,'/',-1) AS 'type', idChemin_Donnees FROM chemin_donnees WHERE path LIKE 'corbeille/%'";
    $resultats = $connexion->query($requete);
    return $resultats;
}

function getCorbeille($id)
{
    $connexion = getBD();
    $requete = "SELECT CONCAT(chemin, path, '/', nom) AS chemin_complet, nom FROM repertoire_principal INNER JOIN chemin_donnees ON idRepertoire_Principal=FkRepertoire_Principal  INNER JOIN fichier_corbeille ON idChemin_Donnees=FkChemin_Donnees WHERE FkChemin_Donnees =".$id;
    $resultats = $connexion->query($requete);
    return $resultats;
}

function getUrl()
{
    $connexion = getBD();
    $requete = "SELECT url From film ";
    $resultats = $connexion->query($requete);
    return $resultats;
}

function getAnneeFilm()
{
    $connexion = getBD();
    $requete = "SELECT nom From annee_film ";
    $resultats = $connexion->query($requete);
    return $resultats;
}

function getTypeFilm()
{
    $connexion = getBD();
    $requete = "SELECT nom From type_film ";
    $resultats = $connexion->query($requete);
    return $resultats;
}