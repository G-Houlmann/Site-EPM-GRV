<?php
/**
 * Created by PhpStorm.
 * User: Raphael.SCHNEITER
 * Date: 26.09.2017
 * Time: 13:38
 */
$titre ='Plateforme échanges fiches techniques - Login';

// Tampon de flux stocké en mémoire
ob_start();
?>

    <header>
        <h2>Corbeille</h2>
    </header>

    <a href="/download/Les%20Asperges.pptx" download="Les Asperges.pptx">Télécharger le document</a>

<?php

$contenu = ob_get_clean();
require "gabarit.php";