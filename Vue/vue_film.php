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

        .titre
        {
            margin-bottom: 5px;
        }

        .barre
        {
            width: 70%;
            height: 40px;
            border-radius: 5px;
            margin-bottom:20px
        }

        #video
        {
            margin-top: 50px;
        }

    </style>
</head>

<header>
    <h1>FILM</h1>
</header>

<body>

    <form method="post" action="index.php?action=afficher_film">

    <h2 class="titre">Titre du film</h2>
    <input class="barre" />

    <h2 class="titre">Année</h2>
    <select name="annee" required onchange="updated(this)" class="barre">
        <option value=""></option>
        <?php
        foreach ($annee as $resultat) :
            //attention case sensitive!!!
            ?>
        <option value="<?= $resultat['nom']; ?>"> <?php echo $resultat['nom']; ?></option>
        <?php endforeach ?>
    </select>

    <h2 class="titre">Type de film</h2>
    <select name="type" required onchange="updated(this)" class="barre">
        <option value=""></option>
        <?php
        foreach ($type as $resultat) :
            //attention case sensitive!!!
            ?>
        <option value="<?= $resultat['nom']; ?>"> <?php echo $resultat['nom']; ?></option>
        <?php endforeach ?>
    </select>


        <td align="right">
            <input type="submit" value="Rechercher"> </td>
        <td>
            <input type="reset" value="Réinitialliser"> </td>

    </form>

        $video = $resultat['lienYouTube'];

        <iframe width="560" height="315" src=" . $video . " frameborder="0" allowfullscreen id="video"></iframe>
</body>

<?php

$contenu = ob_get_clean();
require "gabarit.php";