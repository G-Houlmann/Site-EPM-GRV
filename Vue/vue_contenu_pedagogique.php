<?php
/**
 * Created by PhpStorm.
 * User: Gildas.HOULMANN
 * Date: 26.09.2017
 * Time: 14:05
 */

$titre ='Contenu pédagogique';

// Tampon de flux stocké en mémoire
ob_start();

?>

<header>
    <h2>Contenu pédagogique</h2>
</header>





<?php

$contenu = ob_get_clean();
require "gabarit.php";
?>
