/*
Navicat MySQL Data Transfer

Source Server         : MYSQL LOCALHOST
Source Server Version : 100126
Source Host           : localhost:3306
Source Database       : qmall_store_dev

Target Server Type    : MYSQL
Target Server Version : 100126
File Encoding         : 65001

Date: 2017-10-23 16:11:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_account
-- ----------------------------
DROP TABLE IF EXISTS `admin_account`;
CREATE TABLE `admin_account` (
`adminEmail`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`adminPassword`  varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`adminPhoneNumber`  varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`adminFirstName`  varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`adminLastName`  varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`adminRoleId`  int(2) NULL DEFAULT NULL ,
PRIMARY KEY (`adminEmail`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of admin_account
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
`adminRoleId`  int(2) NOT NULL AUTO_INCREMENT ,
`adminRoleDescription`  varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`adminRoleId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admin_session
-- ----------------------------
DROP TABLE IF EXISTS `admin_session`;
CREATE TABLE `admin_session` (
`adminSessionId`  int(11) NOT NULL AUTO_INCREMENT ,
`adminEmail`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`updateTimeAdminSession`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`expireTimeAdminSession`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`adminToken`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`adminAccess`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`adminSessionId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of admin_session
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for advertisement
-- ----------------------------
DROP TABLE IF EXISTS `advertisement`;
CREATE TABLE `advertisement` (
`advertisementId`  int(11) NOT NULL AUTO_INCREMENT ,
`advertisementTitle`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`advertisementDescription`  longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`advertisementImage`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`advertisementId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of advertisement
-- ----------------------------
BEGIN;
INSERT INTO `advertisement` VALUES ('1', 'dsf', 'fdsfd', 'fdsfdsfdsf');
COMMIT;

-- ----------------------------
-- Table structure for api_log
-- ----------------------------
DROP TABLE IF EXISTS `api_log`;
CREATE TABLE `api_log` (
`apiLogId`  int(11) NOT NULL AUTO_INCREMENT ,
`adminEmail`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`apiLogTime`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`apiLogDescription`  varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`apiLogId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of api_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for contact_form
-- ----------------------------
DROP TABLE IF EXISTS `contact_form`;
CREATE TABLE `contact_form` (
`contactFormId`  int(11) NOT NULL AUTO_INCREMENT ,
`contactFormFirstName`  varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`contactFormLastName`  varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`contactFormMobileNumber`  varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`contactFormEmail`  varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`contactFormCompanyName`  varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`contactFormCompanyAddress`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`contactFormInquiry`  varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`contactFormRequirement`  longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
PRIMARY KEY (`contactFormId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=48

;

-- ----------------------------
-- Records of contact_form
-- ----------------------------
BEGIN;
INSERT INTO `contact_form` VALUES ('42', '11', '1', '1', '1', '1', '1', '1', '1'), ('43', '', '1', '1', '1', '1', '1', '1', '1'), ('44', '', '1', '1', '1', '1', '1', '1', '1'), ('45', '', '1', '1', '1', '1', '1', '1', '1'), ('46', 'k', '1', '1', '1', '1', '1', '1', '1'), ('47', 'k', 'hdgh', 'hfdh', 'hgdh', 'hdfh', 'hfdh', 'hfdh', 'hgf');
COMMIT;

-- ----------------------------
-- Table structure for customer_account
-- ----------------------------
DROP TABLE IF EXISTS `customer_account`;
CREATE TABLE `customer_account` (
`customerEmail`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`customerPassword`  varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customerPhoneNumber`  varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`customerEmail`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of customer_account
-- ----------------------------
BEGIN;
INSERT INTO `customer_account` VALUES ('firnandestossni@gmail.com', '$2a$10$x3ejwTnztQX3J9wPda', '6282218155500');
COMMIT;

-- ----------------------------
-- Table structure for customer_address
-- ----------------------------
DROP TABLE IF EXISTS `customer_address`;
CREATE TABLE `customer_address` (
`customerAddressId`  int(11) NOT NULL AUTO_INCREMENT ,
`customerAddress`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customerAddressZipcode`  int(7) NULL DEFAULT NULL ,
`customerEmail`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`customerAddressId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=35

;

-- ----------------------------
-- Records of customer_address
-- ----------------------------
BEGIN;
INSERT INTO `customer_address` VALUES ('32', '1', '1', '1'), ('33', '1', '1', '2'), ('34', '4', '9', '1');
COMMIT;

-- ----------------------------
-- Table structure for customer_data_kredit
-- ----------------------------
DROP TABLE IF EXISTS `customer_data_kredit`;
CREATE TABLE `customer_data_kredit` (
`customerDataKreditId`  int(11) NOT NULL AUTO_INCREMENT ,
`customerDataKreditNow`  int(25) NULL DEFAULT NULL ,
`customerDataKreditLimit`  int(25) NULL DEFAULT NULL ,
`customerDataKreditStatusId`  int(4) NULL DEFAULT NULL ,
`customerEmail`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`customerDataKreditId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of customer_data_kredit
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for customer_data_kredit_status
-- ----------------------------
DROP TABLE IF EXISTS `customer_data_kredit_status`;
CREATE TABLE `customer_data_kredit_status` (
`customerDataKreditStatusId`  int(4) NOT NULL AUTO_INCREMENT ,
`customerDataKreditStatusDescription`  varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`customerDataKreditStatusId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of customer_data_kredit_status
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for customer_payment_data
-- ----------------------------
DROP TABLE IF EXISTS `customer_payment_data`;
CREATE TABLE `customer_payment_data` (
`customerPaymentDataId`  int(11) NOT NULL AUTO_INCREMENT ,
`customerPaymentDataDescription`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customerPaymentDataNumber`  int(30) NULL DEFAULT NULL ,
`customerEmail`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`customerPaymentDataId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of customer_payment_data
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for customer_personal_info
-- ----------------------------
DROP TABLE IF EXISTS `customer_personal_info`;
CREATE TABLE `customer_personal_info` (
`customerPersonalInfoId`  int(11) NOT NULL AUTO_INCREMENT ,
`customerGender`  varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customerNpwp`  varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customerEmail`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`customerPersonalInfoId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=36

;

-- ----------------------------
-- Records of customer_personal_info
-- ----------------------------
BEGIN;
INSERT INTO `customer_personal_info` VALUES ('33', '1', null, '1'), ('34', '1', null, '2'), ('35', '3', null, '1');
COMMIT;

-- ----------------------------
-- Table structure for customer_register_account
-- ----------------------------
DROP TABLE IF EXISTS `customer_register_account`;
CREATE TABLE `customer_register_account` (
`customerEmail`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`customerPassword`  varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customerConfirmPassword`  varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customerAccountStatus`  varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customerPhoneNumber`  varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customerOtpCode`  int(255) NULL DEFAULT NULL ,
`customerUpdateOtpTime`  datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`customerUpdateOtpExpired`  datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`customerLimitNumberResend`  int(1) NULL DEFAULT NULL ,
`customerLimitTime`  datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (`customerEmail`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of customer_register_account
-- ----------------------------
BEGIN;
INSERT INTO `customer_register_account` VALUES ('caliandrat9@gmail.com', '$2a$10$UJUGwo8poWI3FWT/7n', '$2a$10$UJUGwo8poWI3FWT/7n', 'Y', '6282218155500', '3554', '2017-10-21 08:43:03', '2017-10-21 08:48:03', '2', '2017-10-22 08:43:03'), ('firnandestoni@gmail.com', '$2a$10$KBtE6CCaq7zZsbFHrT', '$2a$10$KBtE6CCaq7zZsbFHrT', 'N', '6282218155500', '7344', '2017-10-23 10:55:45', '2017-10-23 11:00:45', '1', '2017-10-23 10:55:45'), ('firnandestossni@gmail.com', '$2a$10$x3ejwTnztQX3J9wPda', '$2a$10$x3ejwTnztQX3J9wPda', 'Y', '6282218155500', '7726', '2017-10-23 11:49:16', '2017-10-23 11:54:16', '2', '2017-10-24 11:49:16');
COMMIT;

-- ----------------------------
-- Table structure for customer_session
-- ----------------------------
DROP TABLE IF EXISTS `customer_session`;
CREATE TABLE `customer_session` (
`customerSessionId`  int(11) NOT NULL AUTO_INCREMENT ,
`customerEmail`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`updateTimeCustomerSession`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`expireTimeCustomerSession`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`customerToken`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customerAccess`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`customerSessionId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of customer_session
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for faq
-- ----------------------------
DROP TABLE IF EXISTS `faq`;
CREATE TABLE `faq` (
`faqId`  int(11) NOT NULL AUTO_INCREMENT ,
`faqQuestion`  longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`faqAnswer`  longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`faqDetail`  longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`faqLike`  int(15) NULL DEFAULT 0 ,
`faqDislike`  int(15) NULL DEFAULT 0 ,
PRIMARY KEY (`faqId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of faq
-- ----------------------------
BEGIN;
INSERT INTO `faq` VALUES ('1', 'Question 1', 'Answer 1', 'Title FAQ', '8', '23');
COMMIT;

-- ----------------------------
-- Table structure for faq_waiting_list
-- ----------------------------
DROP TABLE IF EXISTS `faq_waiting_list`;
CREATE TABLE `faq_waiting_list` (
`faqWaitingListId`  int(11) NOT NULL AUTO_INCREMENT ,
`faqWaitingListSubject`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`faqWaitingListQuestion`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`faqWaitingListDetail`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
PRIMARY KEY (`faqWaitingListId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=12

;

-- ----------------------------
-- Records of faq_waiting_list
-- ----------------------------
BEGIN;
INSERT INTO `faq_waiting_list` VALUES ('1', 'asdfd fd f', 'fdsaf ', 'fafdsafdsaf'), ('2', 'asdfd fd f', 'fdsaf ', 'fafdsafdsaf'), ('3', 'asdfd fd f', 'fdsaf ', 'fafdsafdsaf'), ('4', 'asdfd fd f', 'fdsaf ', 'fafdsafdsaf'), ('5', 'asdfd fd f', 'fdsaf ', 'fafdsafdsaf'), ('6', 'asdfd fd f', 'fdsaf ', 'fafdsafdsaf'), ('7', 'asdfd fd f', 'fdsaf ', ''), ('8', 'asdfd fd f', 'fdsaf ', ''), ('9', 'asdfd fd f', 'fdsaf ', ''), ('10', 'asdfd fd f', 'fdsaf ', ''), ('11', 'ggfd', 'fdsaf gfdgfd', 'fafdsafgfdgfdggdgdsaf');
COMMIT;

-- ----------------------------
-- Table structure for indonesian_district
-- ----------------------------
DROP TABLE IF EXISTS `indonesian_district`;
CREATE TABLE `indonesian_district` (
`districtId`  int(8) NOT NULL AUTO_INCREMENT ,
`districtDescription`  varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`regencyId`  int(3) NULL DEFAULT NULL ,
PRIMARY KEY (`districtId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of indonesian_district
-- ----------------------------
BEGIN;
INSERT INTO `indonesian_district` VALUES ('1', '1', '1');
COMMIT;

-- ----------------------------
-- Table structure for indonesian_province
-- ----------------------------
DROP TABLE IF EXISTS `indonesian_province`;
CREATE TABLE `indonesian_province` (
`provinceId`  int(3) NOT NULL AUTO_INCREMENT ,
`provinceDescription`  varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`provinceId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of indonesian_province
-- ----------------------------
BEGIN;
INSERT INTO `indonesian_province` VALUES ('1', '1');
COMMIT;

-- ----------------------------
-- Table structure for indonesian_regency
-- ----------------------------
DROP TABLE IF EXISTS `indonesian_regency`;
CREATE TABLE `indonesian_regency` (
`regencyId`  int(3) NOT NULL ,
`regencyDescription`  varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`provinceId`  int(3) NULL DEFAULT NULL ,
PRIMARY KEY (`regencyId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of indonesian_regency
-- ----------------------------
BEGIN;
INSERT INTO `indonesian_regency` VALUES ('1', '1', '2');
COMMIT;

-- ----------------------------
-- Table structure for indonesian_village
-- ----------------------------
DROP TABLE IF EXISTS `indonesian_village`;
CREATE TABLE `indonesian_village` (
`villageId`  int(8) NOT NULL ,
`villageDescription`  varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`districtId`  int(8) NULL DEFAULT NULL ,
PRIMARY KEY (`villageId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of indonesian_village
-- ----------------------------
BEGIN;
INSERT INTO `indonesian_village` VALUES ('1', '1', '1');
COMMIT;

-- ----------------------------
-- Table structure for newsletter
-- ----------------------------
DROP TABLE IF EXISTS `newsletter`;
CREATE TABLE `newsletter` (
`newsletterId`  int(11) NOT NULL AUTO_INCREMENT ,
`newsletterDescription`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`newsletterDetail`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`newsletterImage`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`newsletterId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of newsletter
-- ----------------------------
BEGIN;
INSERT INTO `newsletter` VALUES ('1', 'fdsf', 'fdsfsd', 'fdsfdsf'), ('2', 'fsdfjhgjgf', 'rdgfdg', 'gfdgfdgfdg');
COMMIT;

-- ----------------------------
-- Table structure for newsletter_subcribe
-- ----------------------------
DROP TABLE IF EXISTS `newsletter_subcribe`;
CREATE TABLE `newsletter_subcribe` (
`newsletterSubscribeId`  int(11) NOT NULL AUTO_INCREMENT ,
`email`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`newsletterSubscribeId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=34

;

-- ----------------------------
-- Records of newsletter_subcribe
-- ----------------------------
BEGIN;
INSERT INTO `newsletter_subcribe` VALUES ('33', '');
COMMIT;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
`orderId`  int(11) NOT NULL AUTO_INCREMENT ,
`orderTotalPrice`  int(25) NULL DEFAULT NULL ,
`orderTime`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`cartId`  int(11) NULL DEFAULT NULL ,
`orderStatusId`  int(11) NULL DEFAULT NULL ,
`paymentMethodId`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`orderId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order_cart
-- ----------------------------
DROP TABLE IF EXISTS `order_cart`;
CREATE TABLE `order_cart` (
`cartId`  int(11) NOT NULL AUTO_INCREMENT ,
`cartTime`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`cartExpireTime`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`cartQuantity`  int(5) NULL DEFAULT NULL ,
`cartStatus`  varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`productId`  int(11) NULL DEFAULT NULL ,
`customerEmail`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`cartId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of order_cart
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order_confirmation
-- ----------------------------
DROP TABLE IF EXISTS `order_confirmation`;
CREATE TABLE `order_confirmation` (
`orderConfirmationId`  int(11) NOT NULL AUTO_INCREMENT ,
`orderConfirmationFile`  varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`orderConfirmationDescription`  varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`orderId`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`orderConfirmationId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of order_confirmation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order_invoice
-- ----------------------------
DROP TABLE IF EXISTS `order_invoice`;
CREATE TABLE `order_invoice` (
`invoiceId`  int(11) NOT NULL AUTO_INCREMENT ,
`invoiceDetail`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`invoiceDate`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`orderId`  int(11) NULL DEFAULT NULL ,
`invoiceStatusId`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`invoiceId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of order_invoice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order_invoice_status
-- ----------------------------
DROP TABLE IF EXISTS `order_invoice_status`;
CREATE TABLE `order_invoice_status` (
`invoiceStatusId`  int(11) NOT NULL AUTO_INCREMENT ,
`invoiceStatusDescription`  varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`invoiceStatusId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of order_invoice_status
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order_payment
-- ----------------------------
DROP TABLE IF EXISTS `order_payment`;
CREATE TABLE `order_payment` (
`paymentId`  int(11) NOT NULL AUTO_INCREMENT ,
`paymentDate`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`paymentAmount`  int(25) NULL DEFAULT NULL ,
`invoiceId`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`paymentId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of order_payment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order_payment_method
-- ----------------------------
DROP TABLE IF EXISTS `order_payment_method`;
CREATE TABLE `order_payment_method` (
`paymentMethodId`  int(11) NOT NULL AUTO_INCREMENT ,
`paymentMethodDescription`  varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`paymentMethodId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of order_payment_method
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order_shipment
-- ----------------------------
DROP TABLE IF EXISTS `order_shipment`;
CREATE TABLE `order_shipment` (
`shipmentId`  int(11) NOT NULL AUTO_INCREMENT ,
`shipmentTrackingNumber`  int(25) NULL DEFAULT NULL ,
`shipmentDetail`  varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`orderId`  int(11) NULL DEFAULT NULL ,
`invoiceId`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`shipmentId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of order_shipment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order_status
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
`orderStatusId`  int(11) NOT NULL AUTO_INCREMENT ,
`orderStatusDescription`  varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`orderStatusId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of order_status
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
`organizationId`  int(11) NOT NULL AUTO_INCREMENT ,
`organizationName`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`organizationPhoneNumber`  varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`organizationSiup`  varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`organizationTdp`  varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`organizationNpwp`  varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customerEmail`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`organizationVerificationStatusId`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`organizationId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of organization
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for organization_address
-- ----------------------------
DROP TABLE IF EXISTS `organization_address`;
CREATE TABLE `organization_address` (
`organizationAddressId`  int(11) NOT NULL AUTO_INCREMENT ,
`organizationAddress`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`organizationAddressZipcode`  int(7) NULL DEFAULT NULL ,
`organizationId`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`organizationAddressId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of organization_address
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for organization_verification_status
-- ----------------------------
DROP TABLE IF EXISTS `organization_verification_status`;
CREATE TABLE `organization_verification_status` (
`organizationVerificationStatusId`  int(11) NOT NULL AUTO_INCREMENT ,
`organizationVerificationStatusDescription`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`organizationVerificationStatusId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of organization_verification_status
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
`productId`  int(11) NOT NULL AUTO_INCREMENT ,
`productName`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`productPartNumber`  int(40) NULL DEFAULT NULL ,
`productStock`  int(11) NULL DEFAULT NULL ,
`productSpesification`  longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`productDescription`  longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`productWeight`  double NULL DEFAULT NULL ,
`productDownloadLink`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`productCategoryId`  int(11) NULL DEFAULT NULL ,
`productBrandId`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`productId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES ('1', 'fdsf', '435', '2', 'vgd', 'fdsfgds`', '24', 'gdfg', '1', '1'), ('2', 'product 2', '432', '2', 'gfdg', 'gfdgdfg', '23', 'fdsf', '1', '1');
COMMIT;

-- ----------------------------
-- Table structure for product_brand
-- ----------------------------
DROP TABLE IF EXISTS `product_brand`;
CREATE TABLE `product_brand` (
`productBrandId`  int(11) NOT NULL AUTO_INCREMENT ,
`productBrandDescription`  varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`productBrandImage`  varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`productBrandId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of product_brand
-- ----------------------------
BEGIN;
INSERT INTO `product_brand` VALUES ('1', 'brand 1', 'images'), ('2', 'brand 2', 'images'), ('3', 'brand 3', 'images');
COMMIT;

-- ----------------------------
-- Table structure for product_brand_category
-- ----------------------------
DROP TABLE IF EXISTS `product_brand_category`;
CREATE TABLE `product_brand_category` (
`productBrandCategoryId`  int(11) NOT NULL AUTO_INCREMENT ,
`productBrandId`  int(11) NULL DEFAULT NULL ,
`productCategoryId`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`productBrandCategoryId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=9

;

-- ----------------------------
-- Records of product_brand_category
-- ----------------------------
BEGIN;
INSERT INTO `product_brand_category` VALUES ('1', '1', '1'), ('2', '1', '2'), ('3', '1', '3'), ('4', '2', '1'), ('5', '2', '2'), ('6', '2', '3'), ('7', '3', '1'), ('8', '3', '2');
COMMIT;

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
`productCategoryId`  int(11) NOT NULL AUTO_INCREMENT ,
`productCategoryDescription`  varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`productCategoryImage`  varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`productCategoryId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of product_category
-- ----------------------------
BEGIN;
INSERT INTO `product_category` VALUES ('1', 'category 1', 'images'), ('2', 'category 2', 'images'), ('3', 'category 3', 'images');
COMMIT;

-- ----------------------------
-- Table structure for product_price
-- ----------------------------
DROP TABLE IF EXISTS `product_price`;
CREATE TABLE `product_price` (
`productPriceId`  int(11) NOT NULL AUTO_INCREMENT ,
`productPrice`  varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`productId`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`productPriceId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of product_price
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_promo
-- ----------------------------
DROP TABLE IF EXISTS `product_promo`;
CREATE TABLE `product_promo` (
`productPromoId`  int(11) NOT NULL AUTO_INCREMENT ,
`productPromoDescription`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`productPromoImage`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`productId`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`productPromoId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of product_promo
-- ----------------------------
BEGIN;
INSERT INTO `product_promo` VALUES ('1', 'dsf promo', 'promo images', '1');
COMMIT;

-- ----------------------------
-- Table structure for product_top
-- ----------------------------
DROP TABLE IF EXISTS `product_top`;
CREATE TABLE `product_top` (
`productId`  int(11) NOT NULL ,
`sellingNumber`  int(11) NULL DEFAULT NULL ,
`viewingNumber`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`productId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of product_top
-- ----------------------------
BEGIN;
INSERT INTO `product_top` VALUES ('1', '100', '120'), ('2', '98', '130');
COMMIT;

-- ----------------------------
-- Table structure for product_wishlist
-- ----------------------------
DROP TABLE IF EXISTS `product_wishlist`;
CREATE TABLE `product_wishlist` (
`productWishlistId`  int(11) NOT NULL AUTO_INCREMENT ,
`customerEmail`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`productId`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`productWishlistId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of product_wishlist
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order`;
CREATE TABLE `purchase_order` (
`purchaseOrderId`  int(11) NOT NULL AUTO_INCREMENT ,
`purchaseOrderTotalPrice`  int(25) NULL DEFAULT NULL ,
`purchaseOrderTime`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`quotationId`  int(11) NULL DEFAULT NULL ,
`purchaseOrderStatusId`  int(11) NULL DEFAULT NULL ,
`purchaseOrderPaymentMethodId`  int(4) NULL DEFAULT NULL ,
PRIMARY KEY (`purchaseOrderId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of purchase_order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for purchase_order_invoice
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_invoice`;
CREATE TABLE `purchase_order_invoice` (
`purchaseOrderInvoiceId`  int(11) NOT NULL ,
`purchaseOrderInvoiceDetail`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`purchaseOrderInvoiceDate`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`purchaseOrderId`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`purchaseOrderInvoiceId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of purchase_order_invoice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for purchase_order_invoice_status
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_invoice_status`;
CREATE TABLE `purchase_order_invoice_status` (
`purchaseOrderInvoiceStatusId`  int(11) NOT NULL AUTO_INCREMENT ,
`purchaseOrderInvoiceStatusDescription`  varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`purchaseOrderInvoiceStatusId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of purchase_order_invoice_status
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for purchase_order_payment
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_payment`;
CREATE TABLE `purchase_order_payment` (
`purchaseOrderPaymentId`  int(11) NOT NULL AUTO_INCREMENT ,
`purchaseOrderPaymentDate`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`purchaseOrderPaymentAmount`  int(25) NULL DEFAULT NULL ,
`purchaseOrderPaymentRemainingDebt`  int(25) NULL DEFAULT NULL ,
`purchaseOrderInvoiceId`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`purchaseOrderPaymentId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of purchase_order_payment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for purchase_order_payment_method
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_payment_method`;
CREATE TABLE `purchase_order_payment_method` (
`purchaseOrderPaymentMethodId`  int(4) NOT NULL AUTO_INCREMENT ,
`purchaseOrderPaymentMethodDescription`  varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`purchaseOrderPaymentMethodId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of purchase_order_payment_method
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for purchase_order_quotation
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_quotation`;
CREATE TABLE `purchase_order_quotation` (
`quotationId`  int(11) NOT NULL AUTO_INCREMENT ,
`quotationTime`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`quotationExpireTime`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`quotationQuantity`  int(5) NULL DEFAULT NULL ,
`quotationStatus`  varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`productId`  int(11) NULL DEFAULT NULL ,
`customerEmail`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`quotationId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of purchase_order_quotation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for purchase_order_shipment
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_shipment`;
CREATE TABLE `purchase_order_shipment` (
`purchaseOrderShipmentId`  int(11) NOT NULL AUTO_INCREMENT ,
`purchaseOrderShipmentTrackingNumber`  varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`purchaseOrderShipmentDetail`  varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`purchaseOrderId`  int(11) NULL DEFAULT NULL ,
`purchaseOrderInvoiceId`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`purchaseOrderShipmentId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of purchase_order_shipment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for purchase_order_status
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_status`;
CREATE TABLE `purchase_order_status` (
`purchaseOrderStatusId`  int(11) NOT NULL ,
`purchaseOrderStatusDescription`  varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`purchaseOrderStatusId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of purchase_order_status
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Auto increment value for admin_role
-- ----------------------------
ALTER TABLE `admin_role` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for admin_session
-- ----------------------------
ALTER TABLE `admin_session` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for advertisement
-- ----------------------------
ALTER TABLE `advertisement` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for api_log
-- ----------------------------
ALTER TABLE `api_log` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for contact_form
-- ----------------------------
ALTER TABLE `contact_form` AUTO_INCREMENT=48;

-- ----------------------------
-- Auto increment value for customer_address
-- ----------------------------
ALTER TABLE `customer_address` AUTO_INCREMENT=35;

-- ----------------------------
-- Auto increment value for customer_data_kredit
-- ----------------------------
ALTER TABLE `customer_data_kredit` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for customer_data_kredit_status
-- ----------------------------
ALTER TABLE `customer_data_kredit_status` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for customer_payment_data
-- ----------------------------
ALTER TABLE `customer_payment_data` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for customer_personal_info
-- ----------------------------
ALTER TABLE `customer_personal_info` AUTO_INCREMENT=36;

-- ----------------------------
-- Auto increment value for customer_session
-- ----------------------------
ALTER TABLE `customer_session` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for faq
-- ----------------------------
ALTER TABLE `faq` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for faq_waiting_list
-- ----------------------------
ALTER TABLE `faq_waiting_list` AUTO_INCREMENT=12;

-- ----------------------------
-- Auto increment value for indonesian_district
-- ----------------------------
ALTER TABLE `indonesian_district` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for indonesian_province
-- ----------------------------
ALTER TABLE `indonesian_province` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for newsletter
-- ----------------------------
ALTER TABLE `newsletter` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for newsletter_subcribe
-- ----------------------------
ALTER TABLE `newsletter_subcribe` AUTO_INCREMENT=34;

-- ----------------------------
-- Auto increment value for order
-- ----------------------------
ALTER TABLE `order` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for order_cart
-- ----------------------------
ALTER TABLE `order_cart` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for order_confirmation
-- ----------------------------
ALTER TABLE `order_confirmation` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for order_invoice
-- ----------------------------
ALTER TABLE `order_invoice` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for order_invoice_status
-- ----------------------------
ALTER TABLE `order_invoice_status` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for order_payment
-- ----------------------------
ALTER TABLE `order_payment` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for order_payment_method
-- ----------------------------
ALTER TABLE `order_payment_method` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for order_shipment
-- ----------------------------
ALTER TABLE `order_shipment` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for order_status
-- ----------------------------
ALTER TABLE `order_status` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for organization
-- ----------------------------
ALTER TABLE `organization` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for organization_address
-- ----------------------------
ALTER TABLE `organization_address` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for organization_verification_status
-- ----------------------------
ALTER TABLE `organization_verification_status` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for product
-- ----------------------------
ALTER TABLE `product` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for product_brand
-- ----------------------------
ALTER TABLE `product_brand` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for product_brand_category
-- ----------------------------
ALTER TABLE `product_brand_category` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for product_category
-- ----------------------------
ALTER TABLE `product_category` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for product_price
-- ----------------------------
ALTER TABLE `product_price` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for product_promo
-- ----------------------------
ALTER TABLE `product_promo` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for product_wishlist
-- ----------------------------
ALTER TABLE `product_wishlist` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for purchase_order
-- ----------------------------
ALTER TABLE `purchase_order` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for purchase_order_invoice_status
-- ----------------------------
ALTER TABLE `purchase_order_invoice_status` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for purchase_order_payment
-- ----------------------------
ALTER TABLE `purchase_order_payment` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for purchase_order_payment_method
-- ----------------------------
ALTER TABLE `purchase_order_payment_method` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for purchase_order_quotation
-- ----------------------------
ALTER TABLE `purchase_order_quotation` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for purchase_order_shipment
-- ----------------------------
ALTER TABLE `purchase_order_shipment` AUTO_INCREMENT=1;
