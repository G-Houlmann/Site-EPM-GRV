SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `MLD EPM` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `MLD EPM` ;

-- -----------------------------------------------------
-- Table `MLD EPM`.`Login`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD EPM`.`Login` (
  `idLogin` INT NOT NULL AUTO_INCREMENT ,
  `login` VARCHAR(45) NOT NULL ,
  `motDePasse` VARCHAR(60) NOT NULL ,
  `acces` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`idLogin`) )
ENGINE = InnoDB;

--
-- Contenu de la table `Login`
--

INSERT INTO `Login` (`idLogin`, `login`, `motDePasse`, `acces`) VALUES
(1, 'EPM3', '$2y$10$pKRfhiUk8KjLActXYNXIP.Eq8KlZISNe47ejATL0tBu9gwoIpWY1u', 0),
(2, 'prof', '$2y$10$pKRfhiUk8KjLActXYNXIP.Eq8KlZISNe47ejATL0tBu9gwoIpWY1u', 1);


-- -----------------------------------------------------
-- Table `MLD EPM`.`Type_De_Recette`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD EPM`.`Type_De_Recette` (
  `idType_De_Recette` INT NOT NULL ,
  `nom` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idType_De_Recette`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MLD EPM`.`Repertoire_Principal`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD EPM`.`Repertoire_Principal` (
  `idRepertoire_Principal` INT NOT NULL ,
  `chemin` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idRepertoire_Principal`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MLD EPM`.`Chemin_Donnees`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD EPM`.`Chemin_Donnees` (
  `idChemin_Donnees` INT NOT NULL ,
  `type` VARCHAR(45) NOT NULL ,
  `path` VARCHAR(60) NOT NULL ,
  `Repertoire_Principal_idRepertoire_Principal` INT NOT NULL ,
  PRIMARY KEY (`idChemin_Donnees`) ,
  INDEX `fk_Chemin_Donnees_Repertoire_Principal1_idx` (`Repertoire_Principal_idRepertoire_Principal` ASC) ,
  CONSTRAINT `fk_Chemin_Donnees_Repertoire_Principal1`
    FOREIGN KEY (`Repertoire_Principal_idRepertoire_Principal` )
    REFERENCES `MLD EPM`.`Repertoire_Principal` (`idRepertoire_Principal` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MLD EPM`.`Recette`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD EPM`.`Recette` (
  `idRecette` INT NOT NULL AUTO_INCREMENT ,
  `nom` VARCHAR(45) NOT NULL ,
  `Type_De_Recette_idType_De_Recette` INT NOT NULL ,
  `Chemin_Donnees_idChemin_Donnees` INT NOT NULL ,
  PRIMARY KEY (`idRecette`) ,
  INDEX `fk_Recette_Type_De_Recette1_idx` (`Type_De_Recette_idType_De_Recette` ASC) ,
  INDEX `fk_Recette_Chemin_Donnees1_idx` (`Chemin_Donnees_idChemin_Donnees` ASC) ,
  CONSTRAINT `fk_Recette_Type_De_Recette1`
    FOREIGN KEY (`Type_De_Recette_idType_De_Recette` )
    REFERENCES `MLD EPM`.`Type_De_Recette` (`idType_De_Recette` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Recette_Chemin_Donnees1`
    FOREIGN KEY (`Chemin_Donnees_idChemin_Donnees` )
    REFERENCES `MLD EPM`.`Chemin_Donnees` (`idChemin_Donnees` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MLD EPM`.`Ingredient`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD EPM`.`Ingredient` (
  `idIngredients` INT NOT NULL AUTO_INCREMENT ,
  `nom` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idIngredients`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MLD EPM`.`Ingredient_Dans_Recette`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD EPM`.`Ingredient_Dans_Recette` (
  `FkIngredient` INT NOT NULL ,
  `FkRecette` INT NOT NULL ,
  INDEX `fk_Ingrédients_has_Recette_Recette1_idx` (`FkRecette` ASC) ,
  INDEX `fk_Ingrédients_has_Recette_Ingrédients_idx` (`FkIngredient` ASC) ,
  CONSTRAINT `fk_Ingrédients_has_Recette_Ingrédients`
    FOREIGN KEY (`FkIngredient` )
    REFERENCES `MLD EPM`.`Ingredient` (`idIngredients` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingrédients_has_Recette_Recette1`
    FOREIGN KEY (`FkRecette` )
    REFERENCES `MLD EPM`.`Recette` (`idRecette` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MLD EPM`.`Document_Enseignant`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD EPM`.`Document_Enseignant` (
  `idDocumentsEnseignants` INT NOT NULL AUTO_INCREMENT ,
  `nom` VARCHAR(45) NOT NULL ,
  `Chemin_Donnees_idChemin_Donnees` INT NOT NULL ,
  PRIMARY KEY (`idDocumentsEnseignants`) ,
  INDEX `fk_DocumentEnseignant_Chemin_Donnees1_idx` (`Chemin_Donnees_idChemin_Donnees` ASC) ,
  CONSTRAINT `fk_DocumentEnseignant_Chemin_Donnees1`
    FOREIGN KEY (`Chemin_Donnees_idChemin_Donnees` )
    REFERENCES `MLD EPM`.`Chemin_Donnees` (`idChemin_Donnees` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MLD EPM`.`Type_Contenu_Pedagogique`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD EPM`.`Type_Contenu_Pedagogique` (
  `idType_Contenu_Pedagogique` INT NOT NULL ,
  `nom` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idType_Contenu_Pedagogique`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MLD EPM`.`Contenu_Pedagogique`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD EPM`.`Contenu_Pedagogique` (
  `idContenu_Pédagogique` INT NOT NULL AUTO_INCREMENT ,
  `annee` INT NULL ,
  `Chemin_Donnees_idChemin_Donnees` INT NOT NULL ,
  `nom` VARCHAR(45) NOT NULL ,
  `Type_Contenu_Pedagogique_idType_Contenu_Pedagogique` INT NOT NULL ,
  PRIMARY KEY (`idContenu_Pédagogique`) ,
  INDEX `fk_Contenu_Pédagogique_Chemin_Donnees1_idx` (`Chemin_Donnees_idChemin_Donnees` ASC) ,
  INDEX `fk_Contenu_Pedagogique_Type_Contenu_Pedagogique1_idx` (`Type_Contenu_Pedagogique_idType_Contenu_Pedagogique` ASC) ,
  CONSTRAINT `fk_Contenu_Pédagogique_Chemin_Donnees1`
    FOREIGN KEY (`Chemin_Donnees_idChemin_Donnees` )
    REFERENCES `MLD EPM`.`Chemin_Donnees` (`idChemin_Donnees` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contenu_Pedagogique_Type_Contenu_Pedagogique1`
    FOREIGN KEY (`Type_Contenu_Pedagogique_idType_Contenu_Pedagogique` )
    REFERENCES `MLD EPM`.`Type_Contenu_Pedagogique` (`idType_Contenu_Pedagogique` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MLD EPM`.`Type_Photo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD EPM`.`Type_Photo` (
  `idType_Photo` INT NOT NULL ,
  `nom` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idType_Photo`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MLD EPM`.`Photo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD EPM`.`Photo` (
  `idPhotos` INT NOT NULL AUTO_INCREMENT ,
  `nom` VARCHAR(45) NOT NULL ,
  `Chemin_Donnees_idChemin_Donnees` INT NOT NULL ,
  `Type_Photo_idType_Photo` INT NOT NULL ,
  PRIMARY KEY (`idPhotos`) ,
  INDEX `fk_Photo_Chemin_Donnees1_idx` (`Chemin_Donnees_idChemin_Donnees` ASC) ,
  INDEX `fk_Photo_Type_Photo1_idx` (`Type_Photo_idType_Photo` ASC) ,
  CONSTRAINT `fk_Photo_Chemin_Donnees1`
    FOREIGN KEY (`Chemin_Donnees_idChemin_Donnees` )
    REFERENCES `MLD EPM`.`Chemin_Donnees` (`idChemin_Donnees` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Photo_Type_Photo1`
    FOREIGN KEY (`Type_Photo_idType_Photo` )
    REFERENCES `MLD EPM`.`Type_Photo` (`idType_Photo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MLD EPM`.`Film`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MLD EPM`.`Film` (
  `idFilm` INT NOT NULL AUTO_INCREMENT ,
  `annee` INT NULL ,
  `nom` VARCHAR(45) NOT NULL ,
  `Chemin_Donnees_idChemin_Donnees` INT NOT NULL ,
  PRIMARY KEY (`idFilm`) ,
  INDEX `fk_Film_Chemin_Donnees1_idx` (`Chemin_Donnees_idChemin_Donnees` ASC) ,
  CONSTRAINT `fk_Film_Chemin_Donnees1`
    FOREIGN KEY (`Chemin_Donnees_idChemin_Donnees` )
    REFERENCES `MLD EPM`.`Chemin_Donnees` (`idChemin_Donnees` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `MLD EPM` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
