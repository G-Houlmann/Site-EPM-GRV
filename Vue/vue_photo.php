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

?>

    <header>
        <h2>Photo </h2>
    </header>


    <form method="post" action="index.php?action=rechercher_photo">
        <div>
            <label>Choix du thème</label>
        </div>
        <div>
            <select name="" required>
                <option idAnnee=""></option>
            </select>
        </div>
    </form>

<?php

$contenu = ob_get_clean();
require "gabarit.php";
?>