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
-- Table `mydb`.`majors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`majors` (
  `major_id` INT NOT NULL AUTO_INCREMENT,
  `major_name` VARCHAR(45) NULL,
  PRIMARY KEY (`major_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`student_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`student_info` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `student_first_name` VARCHAR(45) NULL,
  `student_last_name` VARCHAR(45) NULL,
  `student_address` VARCHAR(45) NULL,
  `student_email` VARCHAR(45) NULL,
  `major_id` INT NULL,
  PRIMARY KEY (`student_id`),
  INDEX `major_id_idx` (`major_id` ASC) VISIBLE,
  CONSTRAINT `major_id`
    FOREIGN KEY (`major_id`)
    REFERENCES `mydb`.`majors` (`major_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`course_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`course_list` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(45) NULL,
  PRIMARY KEY (`course_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`enrollment` (
  `student_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `semester` INT NOT NULL,
  INDEX `course_id_idx` (`course_id` ASC) VISIBLE,
  PRIMARY KEY (`student_id`, `course_id`),
  CONSTRAINT `student_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `mydb`.`student_info` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `mydb`.`course_list` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
