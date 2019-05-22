-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT NOT NULL,
  `Patient_Name` VARCHAR(45) NOT NULL,
  `Patient_Syndrome` VARCHAR(200) NOT NULL,
  `gender` ENUM("M", "F") NOT NULL,
  `age_diagnosis` INT NOT NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`syndrome` (
  `idsyndrome` INT NOT NULL,
  `syndrome_name` VARCHAR(45) NOT NULL,
  `syndrome_description` TEXT(200) NOT NULL,
  PRIMARY KEY (`idsyndrome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gene` (
  `idgene` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `start` INT NOT NULL,
  `end` INT NOT NULL,
  `chromosome` VARCHAR(2) NOT NULL,
  `description` TEXT(200) NULL,
  `idsyndrome` INT NOT NULL,
  PRIMARY KEY (`idgene`),
  INDEX `fk_gene_1_idx` (`idsyndrome` ASC) VISIBLE,
  CONSTRAINT `fk_gene_1`
    FOREIGN KEY (`idsyndrome`)
    REFERENCES `mydb`.`syndrome` (`idsyndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patient_gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patient_gene` (
  `idpatient_gene` INT NOT NULL,
  `idPatient` INT NOT NULL,
  `idgene` INT NOT NULL,
  PRIMARY KEY (`idpatient_gene`),
  INDEX `fk_patient_gene_1_idx` (`idPatient` ASC) VISIBLE,
  INDEX `fk_patient_gene_2_idx` (`idgene` ASC) VISIBLE,
  CONSTRAINT `fk_patient_gene_1`
    FOREIGN KEY (`idPatient`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_gene_2`
    FOREIGN KEY (`idgene`)
    REFERENCES `mydb`.`gene` (`idgene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
