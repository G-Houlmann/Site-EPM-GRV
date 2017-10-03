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

function getPhotoGrandChef()
{
    $connexion = getBD();

    $requete = "SELECT repertoire_principal.chemin, chemin_donnees.path, photo.nom AS nomPhoto, type_photo.nom AS nomType
                FROM repertoire_principal INNER JOIN chemin_donnees ON idRepertoire_Principal = FkRepertoire_Principal INNER JOIN photo ON
                idChemin_Donnees = FkCheminDonnees INNER JOIN type_photo ON idType_photo = FkType_Photo
                WHERE type_photo.nom LIKE \"grand_chef\"";
    return $requete;
}