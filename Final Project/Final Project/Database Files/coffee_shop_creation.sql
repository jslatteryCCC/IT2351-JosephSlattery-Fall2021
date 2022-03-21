-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema coffee_shop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema coffee_shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coffee_shop` DEFAULT CHARACTER SET utf8 ;
USE `coffee_shop` ;

-- -----------------------------------------------------
-- Table `coffee_shop`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coffee_shop`.`customers` (
  `cust_id` INT NOT NULL DEFAULT 0,
  `cust_name` VARCHAR(20) NULL DEFAULT NULL,
  `cust_address` VARCHAR(45) NULL DEFAULT NULL,
  `cust_city` VARCHAR(45) NULL,
  `cust_state` VARCHAR(2) NULL,
  `cust_contact_name` VARCHAR(45) NULL,
  `cust_email` VARCHAR(45) NULL,
  `cust_phone` VARCHAR(12) NULL,
  PRIMARY KEY (`cust_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coffee_shop`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coffee_shop`.`orders` (
  `order_id` INT NOT NULL,
  `cust_id` INT NULL,
  `order_date` DATETIME NULL,
  `filled_date` DATETIME NULL,
  `order_subtotal` DECIMAL(10,2) NULL,
  `order_tax` DECIMAL(10,2) NULL,
  `order_total` DECIMAL(10,2) NULL,
  `card_number` VARCHAR(16) NULL,
  `card_expire` VARCHAR(4) NULL,
  PRIMARY KEY (`order_id`),
  INDEX `customer_id_idx` (`cust_id` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`cust_id`)
    REFERENCES `coffee_shop`.`customers` (`cust_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coffee_shop`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coffee_shop`.`products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_category` INT NULL,
  `product_name` VARCHAR(45) NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coffee_shop`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coffee_shop`.`order_items` (
  `item_id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NULL,
  `order_id` INT NULL,
  `item_price` DECIMAL(10,2) NULL,
  `quantity` INT NULL,
  PRIMARY KEY (`item_id`),
  INDEX `product_id_idx` (`product_id` ASC) VISIBLE,
  INDEX `order_id_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `orders_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `coffee_shop`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `coffee_shop`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coffee_shop`.`vendors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coffee_shop`.`vendors` (
  `vendor_id` INT NOT NULL,
  `vendor_name` VARCHAR(45) NULL,
  `vendor_address` VARCHAR(45) NULL,
  `vendor_city` VARCHAR(45) NULL,
  `vendor_state` VARCHAR(45) NULL,
  `vendor_phone` VARCHAR(45) NULL,
  `vendor_email` VARCHAR(45) NULL,
  PRIMARY KEY (`vendor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coffee_shop`.`ingredients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coffee_shop`.`ingredients` (
  `ingredient_id` INT NOT NULL,
  `vendor_id` INT NULL,
  `ingredient_desc` VARCHAR(45) NULL,
  PRIMARY KEY (`ingredient_id`),
  INDEX `vendor_id_idx` (`vendor_id` ASC) VISIBLE,
  CONSTRAINT `vendor_id`
    FOREIGN KEY (`vendor_id`)
    REFERENCES `coffee_shop`.`vendors` (`vendor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coffee_shop`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coffee_shop`.`invoices` (
  `invoice_id` INT NOT NULL,
  `vendor_id` INT NULL,
  `invoice_total` DECIMAL(9,2) NULL,
  `invoice_due_date` DATE NULL,
  `invoice_payment` DECIMAL(9,2) NULL,
  `invoice_payment_date` DATE NULL,
  `invoice_terms` INT NULL,
  PRIMARY KEY (`invoice_id`),
  INDEX `vendor_id_idx` (`vendor_id` ASC) VISIBLE,
  CONSTRAINT `invoice_vendor_id`
    FOREIGN KEY (`vendor_id`)
    REFERENCES `coffee_shop`.`vendors` (`vendor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coffee_shop`.`product_ingredients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coffee_shop`.`product_ingredients` (
  `ingredient_id` INT NOT NULL,
  `product_category` INT NULL,
  PRIMARY KEY (`ingredient_id`),
  INDEX `product_id_idx` (`product_category` ASC) VISIBLE,
  CONSTRAINT `ingredient_id`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `coffee_shop`.`ingredients` (`ingredient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_category`)
    REFERENCES `coffee_shop`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
