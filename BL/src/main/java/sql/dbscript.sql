-- 05/9/2022 BEST create table 
CREATE TABLE billing.company ( company_id BIGINT(32) NOT NULL AUTO_INCREMENT , company_code VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
tax_number VARCHAR(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , company_en VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
company_th VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , industy VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
status VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , is_active VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
description VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , user_create VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
user_update VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , time_create TIMESTAMP NULL , time_update TIMESTAMP NULL , 
PRIMARY KEY (company_id)) ENGINE = InnoDB;

CREATE TABLE `billing`.`company_contact` ( `company_contact_id` BIGINT(32) NOT NULL AUTO_INCREMENT , 
`company_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `contact_name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`phone` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `reverse_phone` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`email` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `address` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`province` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `district` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`subdistinct` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `zip_code` VARCHAR(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`website` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `description` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`user_create` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `user_update` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`time_create` TIMESTAMP NULL , `time_update` TIMESTAMP NULL , PRIMARY KEY (`company_contact_id`)) ENGINE = InnoDB;

CREATE TABLE `billing`.`company_sales` ( `company_sales_id` BIGINT(32) NOT NULL AUTO_INCREMENT , 
`company_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `user_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`name_en` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `name_th` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`email` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `phone` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`description` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `user_create` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`user_update` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `time_create` TIMESTAMP NULL , `time_update` TIMESTAMP NULL ,
PRIMARY KEY (`company_sales_id`)) ENGINE = InnoDB;

CREATE TABLE `billing`.`company_payment` ( `company_payment_id` BIGINT(32) NOT NULL AUTO_INCREMENT , 
`company_contact_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
`transfer_type` VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
`bank` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `bank_type` VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`bank_number` VARCHAR(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `bank_branch` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`description` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `user_create` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`user_update` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `time_create` TIMESTAMP NULL , `time_update` TIMESTAMP NULL ,
PRIMARY KEY (`company_payment_id`)) ENGINE = InnoDB;

CREATE TABLE `billing`.`position` ( `position_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
`department_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `name` VARCHAR(64) NOT NULL , 
`prefix_id` VARCHAR(64) NULL , `description` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `user_create` VARCHAR(32) NULL ,
`user_update` VARCHAR(32) NULL , `time_create` TIMESTAMP NULL , `time_update` TIMESTAMP NULL , PRIMARY KEY (`position_id`)) ENGINE = InnoDB;

CREATE TABLE `billing`.`department` ( `department_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
`name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `prefix_id` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , 
`description` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `user_create` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`user_update` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `time_create` TIMESTAMP NULL , 
`time_update` TIMESTAMP NULL , PRIMARY KEY (`department_id`)) ENGINE = InnoDB;

