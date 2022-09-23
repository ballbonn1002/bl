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


-- 05/9/2022 Tan create table 

CREATE TABLE `billing`.`quotation` ( `quotation_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
`quotation_sale_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `company_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
`company_name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `address_1` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`province_1` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `district_1` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`sub-district_1` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `zip_code_1` VARCHAR(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`address_2` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `province_2` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`district_2` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `sub-district_2` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`zip_code_2` VARCHAR(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `address_check` VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`tax_number` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `email` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`phone` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `start_date` DATE NOT NULL , `end_date` DATE NOT NULL ,
`user_approved` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `approved_date` DATE NULL , `reason` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`description` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `sub_total` DECIMAL(10,2) NOT NULL , `discount` DECIMAL(10,2) NULL ,
`percent_discount` DECIMAL(4,2) NULL , `sum_price_discount` DECIMAL(10,2) NOT NULL , `tax_type` VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`percent_tax` DECIMAL(4,2) NULL , `tax` DECIMAL(10,2) NULL , `grand_total` DECIMAL(10,2) NOT NULL , `status` VARCHAR(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`user_create` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `user_update` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`time_create` TIMESTAMP NULL , `time_update` TIMESTAMP NULL , PRIMARY KEY (`quotation_id`)) ENGINE = InnoDB;

CREATE TABLE `billing`.`order` ( `order_id` BIGINT NOT NULL AUTO_INCREMENT , `quotation_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`name` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `description` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`quantity` INT NOT NULL , `unit_price` DECIMAL(10,2) NOT NULL , `total` DECIMAL(10,2) NOT NULL , `user_create` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`user_update` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `time_create` TIMESTAMP NULL , `time_update` TIMESTAMP NULL ,
PRIMARY KEY (`order_id`)) ENGINE = InnoDB;

CREATE TABLE `billing`.`quotation_sale` ( `quotation_sale_id` BIGINT NOT NULL AUTO_INCREMENT , `quotation_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`user_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `name_en` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`name_th` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `phone` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`email` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `description` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`user_create` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `user_update` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`time_create` TIMESTAMP NULL , `time_update` TIMESTAMP NULL , PRIMARY KEY (`quotation_sale_id`)) ENGINE = InnoDB;

CREATE TABLE `billing`.`user` ( `user_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`department_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `position_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`role_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `employee_id` VARCHAR(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`image` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `title_name_en` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`title_name_th` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `name_en` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`name_th` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `nickname_en` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`nickname_th` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `phone` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`email` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `address` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`province` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `district` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`sub_district` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `zip` VARCHAR(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`enable` VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `description` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`user_create` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `user_update` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`time_create` TIMESTAMP NULL , `time_update` TIMESTAMP NULL , PRIMARY KEY (`user_id`)) ENGINE = InnoDB;

CREATE TABLE `billing`.`status` ( `id` BIGINT NOT NULL AUTO_INCREMENT , `quotation_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`name` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `description` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`user_create` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `user_update` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`time_create` TIMESTAMP NULL , `time_update` TIMESTAMP NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

-- 09/9/2022 BEST Change name
ALTER TABLE `company` CHANGE `industy` `industry` VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;


-- 09/9/2022 Tan edit table 

ALTER TABLE `status` CHANGE `id` `status_id` BIGINT(20) NOT NULL AUTO_INCREMENT, CHANGE `quotation_id` `status_code` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
CHANGE `name` `status_name` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

ALTER TABLE `status` ADD `group` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `status_name`;

ALTER TABLE `quotation` ADD `contact_name` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `company_name`;

ALTER TABLE `quotation` ADD `phone_2` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `phone`;

-- 13/9/2022 BEST Add & edit table
CREATE TABLE `billing`.`company_address` ( `company_address_id` BIGINT(32) NOT NULL AUTO_INCREMENT , 
`company_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,`address_name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`address` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `province` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`district` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `subdistrict` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`zip_code` VARCHAR(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `description` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`user_create` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `user_update` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`time_create` TIMESTAMP NULL , `time_update` TIMESTAMP NULL , PRIMARY KEY (`company_address_id`)) ENGINE = InnoDB;

drop table company_contact;
CREATE TABLE `billing`.`company_contact` ( `company_contact_id` BIGINT(32) NOT NULL AUTO_INCREMENT , 
`company_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `contact_name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`position` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `phone` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`email` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `address_location` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`description` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `user_create` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`user_update` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `time_create` TIMESTAMP NULL ,
`time_update` TIMESTAMP NULL , PRIMARY KEY (`company_contact_id`)) ENGINE = InnoDB;

ALTER TABLE `company` ADD `website` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `status`;

--15/9/2022 BEST Create table Employee & Add column image SysUser
CREATE TABLE `billing`.`employee` ( `Employee_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
`department_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `position_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`role_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL , `image` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`gender` VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `title_name_en` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`name_en` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `nickname_en` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`title_name_th` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `name_th` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`nickname_th` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `phone` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`email` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `address_name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`address` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , `province` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`district` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `subdistrict` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`zip` VARCHAR(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `enable` VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`description` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `user_create` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`user_update` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `time_create` TIMESTAMP NULL , `time_cupdate` TIMESTAMP NULL ,
PRIMARY KEY (`Employee_id`)) ENGINE = InnoDB;

ALTER TABLE `sys_user` ADD `image` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `user_id`;

-- 16/9/2022 BEST Change name
ALTER TABLE `employee` CHANGE `Employee_id` `employee_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `employee` CHANGE `zip` `zip_code` VARCHAR(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
ALTER TABLE `company_sales` CHANGE `user_id` `employee_id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

-- 20/9/2022 BEST Change name
ALTER TABLE quotation_sale DROP name_th;
ALTER TABLE quotation_sale CHANGE user_id employee_id VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE quotation_sale ADD title_name_en VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER employee_id;
ALTER TABLE company_sales DROP name_th;
ALTER TABLE `company_sales` ADD `title_name_en` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `employee_id`;

--23/09/2022 Tan
ALTER TABLE order CHANGE quantity quantity INT(10) NOT NULL;
RENAME TABLE billing.order TO billing.quotation_order;
ALTER TABLE company_contact ADD title_name_en VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER company_id;