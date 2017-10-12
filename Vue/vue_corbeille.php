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

    <form method="post" action="index.php?action=corbeille">
        <div>
            <label>Type de fichier</label>
        </div>
        <div>
            <select name="id" required>
                <?php
                    foreach ($resultats as $resultat) :
                ?>
                    <option value="<?= $resultat['idChemin_Donnees']; ?>"> <?php echo $resultat['type']; ?> </option>
                <?php endforeach ?>
            </select>
        </div>
        <div>
            <input type="submit" name="search" value="Chercher">
            <input type="reset" value="Réinitialiser">
        </div>
    </form>
    <?php
    if (isset($_POST['search'])){

        echo '<br>';
        echo '<table>';
        echo '<tr>';
        echo '<th align="left"><strong>Titre des documents</strong></th>';
        echo '</tr>';

        foreach ($resultatsRec as $resultat) {

            //attention case sensitive!!!
            echo '<tr>';
            echo '<td>';
            echo '<a href="index.php?action=ouvrir_recette&fichier=' . $resultat['chemin_complet'] . '">' . $resultat['nom'] . '</a>' ;
            echo '</td>';
            echo '</tr>';
        }
        echo '</table>';

    }
    ?>
<?php

$contenu = ob_get_clean();
require "gabarit.php";