<?php
/**
 * Created by PhpStorm.
 * User: Raphael.SCHNEITER
 * Date: 26.09.2017
 * Time: 09:17
 */
    $titre ='Plateforme échanges fiches techniques - Photo';
    // Tampon de flux stocké en mémoire
    ob_start();
    $t2 = "1 ère année";
?>

    <header>
        <h2>Photo <?php echo $t2?></h2>
    </header>

    <img src="/Photos%20Grand%20Chef/Foie-gras.jpg">
    <img src="/Photos%20Grand%20Chef/IMG-20160528-WA0001.jpg">
    <img src="/Photos%20Grand%20Chef/IMG_0243.JPG">

<?php

$contenu = ob_get_clean();
require "gabarit.php";
?>