<?php
/**
 * Created by PhpStorm.
 * User: Valentin.PITTET
 * Date: 05.09.2017
 * Time: 13:58
 */


require "modele/modele.php";


// Affichage de la page d'accueil
function accueil()
{
    require "vue/vue_accueil.php";
}


function contenu_pedagogique()
{
    require "Vue/vue_contenu_pedagogique.php";
}
function photo()
{

    require "vue/vue_photo.php";
}

function corbeille()
{
    if (isset($_POST) && !empty($_POST['id'])) {
        $resultats = getTypeCorbeille();
        $resultatsRec = getCorbeille($_POST['id']);
        require  "vue/vue_corbeille.php";
    } else {
        $resultats = getTypeCorbeille();
        require  "vue/vue_corbeille.php";
    }

}

function login()
{
    //Affichage de la page de login

         if(isset($_POST) && !empty($_POST['login']) && !empty($_POST['pwd']))
         {
             extract($_POST); //Appel de la fonction qui vérifie si le login existe dans la BD et retourne le mot de passe
             //définie dans le modèle
             $pwdFromBD= getPwdFromLogin($login); //on récupère bien un mot de passe
             if (isset($pwdFromBD) && !empty($pwdFromBD))
             {
                 if (password_verify($pwd, $pwdFromBD))
                 {
                     //on peut accéder au site. Attention ni la vue ni la fonction ci-dessous n'existe pas encore
                     //$resultats = getTypeRecette();
                     require "vue/vue_photo.php";
                 } else {
                     $msg_err= 'Le mot de passe est incorrect';
                     require "vue/vue_login.php"; }
             }
             else { $msg_err= 'Aucun utilisateur avec ce login n\'est défini pour cette application.';
                require "vue/vue_login.php";
             }
         } else {
             require "vue/vue_login.php";
         }

 }

function ouvrirFichierRecettes($fichier) {

    if (file_exists($fichier)) {
        ouvrirFichier($fichier);
    } else {
        echo "aucun fichier n'existe pour la recette demandée";
    }
}

function ouvrirFichier($file) {

    header('Content-Description: File Transfer');
    header('Content-Type: application/octet-stream');
    header('Content-Disposition: attachment; filename="'.basename($file).'"');
    header('Expires: 0');
    header('Cache-Control: must-revalidate');
    header('Pragma: public');
    header('Content-Length: ' . filesize($file));
    readfile($file);
}

