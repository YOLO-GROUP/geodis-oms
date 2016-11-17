-- MySQL Script generated by MySQL Workbench
-- 11/17/16 09:39:28
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema geodis-oms
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `geodis-oms` ;

-- -----------------------------------------------------
-- Schema geodis-oms
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `geodis-oms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `geodis-oms` ;

-- -----------------------------------------------------
-- Table `geodis-oms`.`connector`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `geodis-oms`.`connector` ;

CREATE TABLE IF NOT EXISTS `geodis-oms`.`connector` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ip_address` VARCHAR(45) NULL,
  `database_name` VARCHAR(45) NULL,
  `project_id` VARCHAR(45) NULL,
  `project_name` VARCHAR(45) NULL,
  `connector_id` VARCHAR(45) NULL,
  `field1` VARCHAR(45) NULL,
  `field2` VARCHAR(45) NULL,
  `field3` VARCHAR(45) NULL,
  `field4` INT NULL,
  `field5` INT NULL,
  `is_active` TINYINT(1) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `geodis-oms`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `geodis-oms`.`customer` ;

CREATE TABLE IF NOT EXISTS `geodis-oms`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `storer_code` VARCHAR(45) NOT NULL,
  `customer_code` VARCHAR(255) NOT NULL,
  `company_name1` VARCHAR(255) NULL,
  `address1` VARCHAR(255) NULL,
  `country1` VARCHAR(255) NULL,
  `region_code1` VARCHAR(255) NULL,
  `contact_first_name1` VARCHAR(255) NULL,
  `contact_last_name1` VARCHAR(255) NULL,
  `contact_phone1` VARCHAR(255) NULL,
  `user_field1` VARCHAR(255) NULL,
  `user_field2` VARCHAR(255) NULL,
  `user_field3` VARCHAR(255) NULL,
  `user_field4` VARCHAR(255) NULL,
  `user_field5` VARCHAR(255) NULL,
  `user_field6` VARCHAR(45) NULL,
  `user_field7` VARCHAR(45) NULL,
  `user_field8` VARCHAR(45) NULL,
  `user_field9` VARCHAR(45) NULL,
  `user_field10` VARCHAR(45) NULL,
  `user_field11` INT ZEROFILL NULL,
  `user_field12` INT ZEROFILL NULL,
  `is_active` TINYINT(1) NULL,
  `connector_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_customer_connector1_idx` (`connector_id` ASC),
  CONSTRAINT `fk_customer_connector1`
    FOREIGN KEY (`connector_id`)
    REFERENCES `geodis-oms`.`connector` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Customer';


-- -----------------------------------------------------
-- Table `geodis-oms`.`sale_order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `geodis-oms`.`sale_order` ;

CREATE TABLE IF NOT EXISTS `geodis-oms`.`sale_order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sale_order_no` VARCHAR(45) NOT NULL,
  `storer_code` VARCHAR(45) NOT NULL,
  `expected_delivery_date` DATETIME NOT NULL,
  `order_type` VARCHAR(45) NOT NULL,
  `fulfilment_type` VARCHAR(45) NOT NULL,
  `recipient_code` VARCHAR(45) NOT NULL,
  `rec_address1` VARCHAR(45) NOT NULL,
  `rec_address2` VARCHAR(45) NOT NULL,
  `rec_address3` VARCHAR(45) NULL,
  `rec_address4` VARCHAR(45) NULL,
  `rec_country` VARCHAR(45) NULL,
  `user_field1` VARCHAR(45) NULL,
  `user_field2` VARCHAR(45) NULL,
  `user_field3` VARCHAR(45) NULL,
  `user_field4` VARCHAR(45) NULL,
  `user_field5` VARCHAR(45) NULL,
  `user_field6` VARCHAR(45) NULL,
  `user_field7` VARCHAR(45) NULL,
  `user_field8` VARCHAR(45) NULL,
  `user_field9` VARCHAR(45) NULL,
  `user_field10` VARCHAR(45) NULL,
  `user_field11` INT NULL,
  `user_field12` INT NULL,
  `rec_zip` VARCHAR(45) NULL,
  `rec_contact` VARCHAR(45) NULL,
  `rec_remark` VARCHAR(45) NULL,
  `rec_name` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  `connector_id` INT NOT NULL,
  `last_updated_by` INT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sale_order_connector1_idx` (`connector_id` ASC),
  CONSTRAINT `fk_sale_order_connector1`
    FOREIGN KEY (`connector_id`)
    REFERENCES `geodis-oms`.`connector` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geodis-oms`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `geodis-oms`.`users` ;

CREATE TABLE IF NOT EXISTS `geodis-oms`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NULL,
  `expiry_date` DATE NULL,
  `full_name` VARCHAR(255) NULL,
  `remember_token` VARCHAR(255) NULL,
  `status` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `geodis-oms`.`sale_order_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `geodis-oms`.`sale_order_detail` ;

CREATE TABLE IF NOT EXISTS `geodis-oms`.`sale_order_detail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `seq_no` INT NOT NULL,
  `item` VARCHAR(45) NULL,
  `sale_order_id` INT NOT NULL,
  `order_qty` DECIMAL(16,4) NULL,
  `delivery_qty` DECIMAL(16,4) NULL,
  `user_field1` VARCHAR(45) NULL,
  `user_field2` VARCHAR(45) NULL,
  `user_field3` VARCHAR(45) NULL,
  `lot_no` VARCHAR(45) NULL,
  `serial_no` VARCHAR(45) NULL,
  `attribute1` VARCHAR(45) NULL,
  `attribute2` VARCHAR(45) NULL,
  `attribute3` VARCHAR(45) NULL,
  `attribute4` INT NULL,
  `attribute5` INT NULL,
  `batch_no` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sale_order_detail_sale_order1_idx` (`sale_order_id` ASC),
  CONSTRAINT `fk_sale_order_detail_sale_order1`
    FOREIGN KEY (`sale_order_id`)
    REFERENCES `geodis-oms`.`sale_order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geodis-oms`.`report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `geodis-oms`.`report` ;

CREATE TABLE IF NOT EXISTS `geodis-oms`.`report` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `report_name` VARCHAR(45) NULL,
  `query` VARCHAR(1000) NULL,
  `field1` VARCHAR(45) NULL,
  `field2` VARCHAR(45) NULL,
  `field3` VARCHAR(45) NULL,
  `field4` INT NULL,
  `field5` INT NULL,
  `is_active` TINYINT(1) NULL,
  `connector_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_report_connector1_idx` (`connector_id` ASC),
  CONSTRAINT `fk_report_connector1`
    FOREIGN KEY (`connector_id`)
    REFERENCES `geodis-oms`.`connector` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `geodis-oms`.`inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `geodis-oms`.`inventory` ;

CREATE TABLE IF NOT EXISTS `geodis-oms`.`inventory` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `connector_id` INT NOT NULL,
  `item` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `category` VARCHAR(45) NULL,
  `size` VARCHAR(45) NULL,
  `weight` VARCHAR(45) NULL,
  `color` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `brand` VARCHAR(45) NULL,
  `available_qty` DECIMAL(16,4) NULL,
  `on_hold_qty` DECIMAL(16,4) NULL,
  `on_receipt_qty` DECIMAL(16,4) NULL,
  `damaged_qty` DECIMAL(16,4) NULL,
  `user_field1` VARCHAR(45) NULL,
  `user_field2` VARCHAR(45) NULL,
  `user_field3` VARCHAR(45) NULL,
  `user_field4` VARCHAR(45) NULL,
  `user_field5` VARCHAR(45) NULL,
  `batch_no` VARCHAR(45) NULL,
  `lot_no` VARCHAR(45) NULL,
  `serial_no` VARCHAR(45) NULL,
  `attribute1` VARCHAR(45) NULL,
  `attribute2` VARCHAR(45) NULL,
  `attribute3` VARCHAR(45) NULL,
  `attribute4` INT NULL,
  `attribute5` INT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_inventory_connector1_idx` (`connector_id` ASC),
  CONSTRAINT `fk_inventory_connector1`
    FOREIGN KEY (`connector_id`)
    REFERENCES `geodis-oms`.`connector` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `geodis-oms`.`user_connector_relation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `geodis-oms`.`user_connector_relation` ;

CREATE TABLE IF NOT EXISTS `geodis-oms`.`user_connector_relation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `connector_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_connector_relation_connector1_idx` (`connector_id` ASC),
  INDEX `fk_user_connector_relation_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_connector_relation_connector1`
    FOREIGN KEY (`connector_id`)
    REFERENCES `geodis-oms`.`connector` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_connector_relation_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `geodis-oms`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `geodis-oms`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `geodis-oms`.`role` ;

CREATE TABLE IF NOT EXISTS `geodis-oms`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(15) NOT NULL,
  `description` VARCHAR(1000) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `geodis-oms`.`user_role_relation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `geodis-oms`.`user_role_relation` ;

CREATE TABLE IF NOT EXISTS `geodis-oms`.`user_role_relation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_role_relation_user1_idx` (`user_id` ASC),
  INDEX `fk_user_role_relation_role1_idx` (`role_id` ASC),
  CONSTRAINT `fk_user_role_relation_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `geodis-oms`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_role_relation_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `geodis-oms`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
