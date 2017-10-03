SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `MLD_EPM` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `MLD_EPM` ;

-- -----------------------------------------------------
-- Table `MLD_EPM`.`Login`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD_EPM`.`Login` (
  `idLogin` INT NOT NULL,
  `login` VARCHAR(45) NOT NULL ,
  `motDePasse` VARCHAR(60) NOT NULL ,
  `acces` VARCHAR(12) NOT NULL ,
  PRIMARY KEY (`idLogin`) )
ENGINE = INNODB;


--
-- Contenu de la table `Login`
--

INSERT INTO `Login` (`idLogin`, `login`, `motDePasse`, `acces`) VALUES
(1, 'EPM3', '$2y$10$pKRfhiUk8KjLActXYNXIP.Eq8KlZISNe47ejATL0tBu9gwoIpWY1u', 0),
(2, 'prof', '$2y$10$pKRfhiUk8KjLActXYNXIP.Eq8KlZISNe47ejATL0tBu9gwoIpWY1u', 1);

-- -----------------------------------------------------
-- Table `MLD_EPM`.`Type_De_Recette`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD_EPM`.`Type_De_Recette` (
  `idType_De_Recette` INT NOT NULL ,
  `nom` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idType_De_Recette`) )
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `MLD_EPM`.`Repertoire_Principal`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD_EPM`.`Repertoire_Principal` (
  `idRepertoire_Principal` INT NOT NULL ,
  `chemin` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idRepertoire_Principal`) )
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `MLD_EPM`.`Chemin_Donnees`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD_EPM`.`Chemin_Donnees` (
  `idChemin_Donnees` INT NOT NULL ,
  `type` VARCHAR(45) NOT NULL ,
  `path` VARCHAR(60) NOT NULL ,
  `FkRepertoire_Principal` INT NOT NULL ,
  PRIMARY KEY (`idChemin_Donnees`) ,
  INDEX `fk_Chemin_Donnees_Repertoire_Principal1_idx` (`FkRepertoire_Principal` ASC) ,
  CONSTRAINT `fk_Chemin_Donnees_Repertoire_Principal1`
    FOREIGN KEY (`FkRepertoire_Principal` )
    REFERENCES `MLD_EPM`.`Repertoire_Principal` (`idRepertoire_Principal` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `MLD_EPM`.`Recette`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD_EPM`.`Recette` (
  `idRecette` INT NOT NULL AUTO_INCREMENT ,
  `nom` VARCHAR(45) NOT NULL ,
  `FkType_De_Recette` INT NOT NULL ,
  `FkChemin_Donnees` INT NOT NULL ,
  PRIMARY KEY (`idRecette`) ,
  INDEX `fk_Recette_Type_De_Recette1_idx` (`FkType_De_Recette` ASC) ,
  INDEX `fk_Recette_Chemin_Donnees1_idx` (`FkChemin_Donnees` ASC) ,
  CONSTRAINT `fk_Recette_Type_De_Recette1`
    FOREIGN KEY (`FkType_De_Recette` )
    REFERENCES `MLD_EPM`.`Type_De_Recette` (`idType_De_Recette` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Recette_Chemin_Donnees1`
    FOREIGN KEY (`FkChemin_Donnees` )
    REFERENCES `MLD_EPM`.`Chemin_Donnees` (`idChemin_Donnees` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `MLD_EPM`.`Ingredient`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD_EPM`.`Ingredient` (
  `idIngredients` INT NOT NULL AUTO_INCREMENT ,
  `nom` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idIngredients`) )
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `MLD_EPM`.`Ingredient_Dans_Recette`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD_EPM`.`Ingredient_Dans_Recette` (
  `FkIngredient` INT NOT NULL ,
  `FkRecette` INT NOT NULL ,
  INDEX `fk_Ingrédients_has_Recette_Recette1_idx` (`FkRecette` ASC) ,
  INDEX `fk_Ingrédients_has_Recette_Ingrédients_idx` (`FkIngredient` ASC) ,
  CONSTRAINT `fk_Ingrédients_has_Recette_Ingrédients`
    FOREIGN KEY (`FkIngredient` )
    REFERENCES `MLD_EPM`.`Ingredient` (`idIngredients` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingrédients_has_Recette_Recette1`
    FOREIGN KEY (`FkRecette` )
    REFERENCES `MLD_EPM`.`Recette` (`idRecette` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `MLD_EPM`.`Document_Enseignant`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD_EPM`.`Document_Enseignant` (
  `idDocumentsEnseignants` INT NOT NULL AUTO_INCREMENT ,
  `nom` VARCHAR(45) NOT NULL ,
  `FkChemin_Donnees` INT NOT NULL ,
  PRIMARY KEY (`idDocumentsEnseignants`) ,
  INDEX `fk_DocumentEnseignant_Chemin_Donnees1_idx` (`FkChemin_Donnees` ASC) ,
  CONSTRAINT `fk_DocumentEnseignant_Chemin_Donnees1`
    FOREIGN KEY (`FkChemin_Donnees` )
    REFERENCES `MLD_EPM`.`Chemin_Donnees` (`idChemin_Donnees` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `MLD_EPM`.`Type_Contenu_Pedagogique`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD_EPM`.`Type_Contenu_Pedagogique` (
  `idType_Contenu_Pedagogique` INT NOT NULL ,
  `nom` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idType_Contenu_Pedagogique`) )
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `MLD_EPM`.`Contenu_Pedagogique`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD_EPM`.`Contenu_Pedagogique` (
  `idContenu_Pédagogique` INT NOT NULL AUTO_INCREMENT ,
  `annee` INT NULL ,
  `FkChemin_Donnees` INT NOT NULL ,
  `nom` VARCHAR(45) NOT NULL ,
  `FkType_Contenu_Pedagogique` INT NOT NULL ,
  PRIMARY KEY (`idContenu_Pédagogique`) ,
  INDEX `fk_Contenu_Pédagogique_Chemin_Donnees1_idx` (`FkChemin_Donnees` ASC) ,
  INDEX `fk_Contenu_Pedagogique_Type_Contenu_Pedagogique1_idx` (`FkType_Contenu_Pedagogique` ASC) ,
  CONSTRAINT `fk_Contenu_Pédagogique_Chemin_Donnees1`
    FOREIGN KEY (`FkChemin_Donnees` )
    REFERENCES `MLD_EPM`.`Chemin_Donnees` (`idChemin_Donnees` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contenu_Pedagogique_Type_Contenu_Pedagogique1`
    FOREIGN KEY (`FkType_Contenu_Pedagogique` )
    REFERENCES `MLD_EPM`.`Type_Contenu_Pedagogique` (`idType_Contenu_Pedagogique` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `MLD_EPM`.`Type_Photo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD_EPM`.`Type_Photo` (
  `idType_Photo` INT NOT NULL ,
  `nom` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idType_Photo`) )
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `MLD_EPM`.`Photo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD_EPM`.`Photo` (
  `idPhotos` INT NOT NULL AUTO_INCREMENT ,
  `nom` VARCHAR(45) NOT NULL ,
  `FkCheminDonnees` INT NOT NULL ,
  `FkType_Photo` INT NOT NULL ,
  PRIMARY KEY (`idPhotos`) ,
  INDEX `fk_Photo_Chemin_Donnees1_idx` (`FkCheminDonnees` ASC) ,
  INDEX `fk_Photo_Type_Photo1_idx` (`FkType_Photo` ASC) ,
  CONSTRAINT `fk_Photo_Chemin_Donnees1`
    FOREIGN KEY (`FkCheminDonnees` )
    REFERENCES `MLD_EPM`.`Chemin_Donnees` (`idChemin_Donnees` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Photo_Type_Photo1`
    FOREIGN KEY (`FkType_Photo` )
    REFERENCES `MLD_EPM`.`Type_Photo` (`idType_Photo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `MLD_EPM`.`Film`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD_EPM`.`Film` (
  `idFilm` INT NOT NULL AUTO_INCREMENT ,
  `annee` INT NULL ,
  `nom` VARCHAR(45) NOT NULL ,
  `FkChemin_Donnees` INT NOT NULL ,
  PRIMARY KEY (`idFilm`) ,
  INDEX `fk_Film_Chemin_Donnees1_idx` (`FkChemin_Donnees` ASC) ,
  CONSTRAINT `fk_Film_Chemin_Donnees1`
    FOREIGN KEY (`FkChemin_Donnees` )
    REFERENCES `MLD_EPM`.`Chemin_Donnees` (`idChemin_Donnees` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `MLD_EPM`.`Fichier_Corbeille`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD_EPM`.`Fichier_Corbeille` (
  `idFichierCorbeille` INT NOT NULL AUTO_INCREMENT ,
  `nom` VARCHAR(45) NOT NULL ,
  `FkChemin_Donnees` INT NOT NULL ,
  PRIMARY KEY (`idFichierCorbeille`) ,
  INDEX `fk_FichierCorbeille_Chemin_Donnees1_idx` (`FkChemin_Donnees` ASC) ,
  CONSTRAINT `fk_FichierCorbeille_Chemin_Donnees1`
    FOREIGN KEY (`FkChemin_Donnees` )
    REFERENCES `MLD_EPM`.`Chemin_Donnees` (`idChemin_Donnees` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = INNODB;

USE `MLD_EPM` ;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
