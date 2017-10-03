<?php
/**
 * Created by PhpStorm.
 * User: Valentin.PITTET
 * Date: 05.09.2017
 * Time: 14:00
 */

$titre ='Plateforme échanges fiches techniques - Accueil';

// Tampon de flux stocké en mémoire
ob_start();
?>

    <header>
        <h2>Plateforme d'échanges de fiches techniques</h2>
    </header>

    <p>
        Ce site est réservé pour la classe de 3ème de l'EPM. Il permet aux élèves de trouver :
        <!--Attention, dans main.css, une entrée a été créée pour avoir des "bullets" -->
    <ul class="accueil">
        <li>des idées de présentation</li>
        <li>des idées de recettes</li>
        <li>des informations sur les produits, plus particulièrement les produits locaux et de saison</li>
        <li>des informations sur des thèmes culinaires</li>
    </ul>

    Veuillez vous <a href="index.php?action=login">connecter</a>  pour avoir accès au site à l'aide du menu "login".
    </p>


<?php

$contenu = ob_get_clean();
require "gabarit.php";
