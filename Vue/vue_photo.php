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
    $t2 = "2 ème année";
?>

    <header>
        <h2>Photo <?php echo $t2?></h2>
    </header>
    <table>
        <?php

        ?>
    </table>

    <img src="/Photos%20Grand%20Chef/Foie-gras.jpg">

<?php

$contenu = ob_get_clean();
require "gabarit.php";
?>