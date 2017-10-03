<?php
/**
 * Created by PhpStorm.
 * User: Valentin.PITTET
 * Date: 05.09.2017
 * Time: 14:30
 */

$titre ='Plateforme échanges fiches techniques - Film';

// Tampon de flux stocké en mémoire
ob_start();

/*function getBD()
{
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "mld_epm";
    //Connection à la BD project_groupe
    $connexion = new PDO('mysql:host=' . $servername . ';dbname=' . $dbname . ';charset=utf8', $username, $password);
    // permet d'avoir plus de détails sur les erreurs retournées
    $connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $connexion;
}


   try {
        // On récupère tout le contenu de la table activites
        $sql = "SELECT idFilm, annee, nom FROM Film";
        $reponse = $bdd->query($sql);
    }*/

?>

<head>
    <style>

        .video
        {
            margin:auto;
            height:500px;
            width:900px;

            border-style: solid;
        }

        .description
        {
            margin:auto;
            margin-top:5px;
            height:60px;
            widht:900px;
            padding-left: 5px;

            border-style: hidden;
        }



    </style>
</head>

<header>
    <h1>FILM</h1>
</header>

<body>

    <div class="video"><embed src="C:\Users\Public\Videos\Sample Videos\Faune.wmv" width=900 height=500 loop="false" controller="true" /embed></div>
    <div class="description">

        <p>description...</p>

    </div>

</body>

<?php

$contenu = ob_get_clean();
require "gabarit.php";