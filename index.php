<?php

require  'controleur/controleur.php';

try
{
    if (isset($_GET['action']))
    {
        $action = $_GET['action'];

        switch ($action)
        {
            case 'welcome' :
                accueil(); //appel de la fonction dans le controleur
                break;
            case 'photo' :
                photo(); //appel de la fonction dans le controleur
                break;

            case 'login' :
                login(); //appel de la fonction dans le controleur
                break;


            case 'contenu_pedagogique':
                contenu_pedagogique();
                break;

            case 'film':
                film();
                break;


            case 'corbeille' :
                corbeille(); //appel de la fonction dans le controleur
                break;
            default :
                throw new Exception("action non valide");

        }
    }
    else
        accueil();  // Si aucune action n’est envoyée dans l’URL

}
catch (Exception $e)
{
    echo($e->getMessage());
}


