/*
Navicat MySQL Data Transfer

Source Server         : MYSQL LOCALHOST
Source Server Version : 100126
Source Host           : localhost:3306
Source Database       : qmall_store_dev

Target Server Type    : MYSQL
Target Server Version : 100126
File Encoding         : 65001

Date: 2017-10-31 18:38:03
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
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of advertisement
-- ----------------------------
BEGIN;
INSERT INTO `advertisement` VALUES ('1', 'Credit Card Payment Now Available', 'The following credit can be used as payment for the customer using with Web Ordering System (WOS), not be accepted for order by email, phone call or FAX.', '/images/adertisement/images1.jpg'), ('2', 'BCA Transfer Payment Now Available', 'The following credit can be used as payment for the customer using with Web Ordering System (WOS), not be accepted for order by email, phone call or FAX.', '/images/adertisement/images2.jpg');
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
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of contact_form
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for customer_account
-- ----------------------------
DROP TABLE IF EXISTS `customer_account`;
CREATE TABLE `customer_account` (
`customerEmail`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`customerPassword`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
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
INSERT INTO `customer_account` VALUES ('test@gmail.com', '$2a$10$7MKb31ncwRpLuDG0V4VLQOoFoiqNuaKLMrvqOzpZ3nhQlLq/1SJhu', '6282218155502');
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
AUTO_INCREMENT=37

;

-- ----------------------------
-- Records of customer_address
-- ----------------------------
BEGIN;
INSERT INTO `customer_address` VALUES ('32', '1', '1', '1'), ('33', '1', '1', '2'), ('34', '4', '9', '1'), ('35', '4', '9', '1'), ('36', '4', '9', '1');
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
-- Table structure for customer_forgot_password
-- ----------------------------
DROP TABLE IF EXISTS `customer_forgot_password`;
CREATE TABLE `customer_forgot_password` (
`customerForgotPasswordId`  int(11) NOT NULL AUTO_INCREMENT ,
`customerEmail`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customerForgotPasswordCode`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customerUpdateForgotPasswordTime`  datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`customerUpdateForgotPasswordExpired`  datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`customerLimitEmailSendNumber`  int(1) NULL DEFAULT NULL ,
`customerLimitEmailSendTime`  datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (`customerForgotPasswordId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=11

;

-- ----------------------------
-- Records of customer_forgot_password
-- ----------------------------
BEGIN;
INSERT INTO `customer_forgot_password` VALUES ('10', 'test@gmail.com', '0adbae1bd714bd18feb7c8baaa192d18', '2017-10-31 16:58:15', '2017-10-31 16:00:00', '1', '2017-10-31 16:58:15');
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
AUTO_INCREMENT=38

;

-- ----------------------------
-- Records of customer_personal_info
-- ----------------------------
BEGIN;
INSERT INTO `customer_personal_info` VALUES ('33', '1', null, '1'), ('34', '1', null, '2'), ('35', '3', null, '1'), ('36', '3', null, '1'), ('37', '3', null, '1');
COMMIT;

-- ----------------------------
-- Table structure for customer_register_account
-- ----------------------------
DROP TABLE IF EXISTS `customer_register_account`;
CREATE TABLE `customer_register_account` (
`customerEmail`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`customerPassword`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customerConfirmPassword`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customerAccountStatus`  varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customerPhoneNumber`  varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customerOtpCode`  int(255) NULL DEFAULT NULL ,
`customerUpdateOtpTime`  datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`customerUpdateOtpExpired`  datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`customerLimitNumberResend`  int(1) NULL DEFAULT NULL ,
`customerLimitTime`  datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`customerCodeEmailVerification`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`customerEmail`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of customer_register_account
-- ----------------------------
BEGIN;
INSERT INTO `customer_register_account` VALUES ('test2@gmail.com', '$2a$10$TS5sBnmvXamR9SzIipvISeUwSZaVcunn3HCdskI.fwWLhF5kMNkHW', '$2a$10$TS5sBnmvXamR9SzIipvISeUwSZaVcunn3HCdskI.fwWLhF5kMNkHW', 'Y', '6282218155502', '8594', '2017-10-30 12:38:29', '2017-10-30 12:38:29', '1', '2017-10-30 12:38:29', '3c4f419e8cd958690d0d14b3b89380d3');
COMMIT;

-- ----------------------------
-- Table structure for customer_session
-- ----------------------------
DROP TABLE IF EXISTS `customer_session`;
CREATE TABLE `customer_session` (
`customerSessionId`  int(11) NOT NULL AUTO_INCREMENT ,
`customerEmail`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customerPhoneNumber`  varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`updateTimeCustomerSession`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`expireTimeCustomerSession`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`customerToken`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customerAccess`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`customerSessionId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=27

;

-- ----------------------------
-- Records of customer_session
-- ----------------------------
BEGIN;
INSERT INTO `customer_session` VALUES ('26', 'test@gmail.com', '6282218155502', '2017-10-31 15:10:57', '2018-01-31 15:10:57', '8bf9e568d61400f02a432ea9ce565a9e', 'UNBLOCK');
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
INSERT INTO `faq` VALUES ('1', 'Question 1', 'Answer 1', 'Title FAQ', '10', '27');
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
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of faq_waiting_list
-- ----------------------------
BEGIN;
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
AUTO_INCREMENT=6

;

-- ----------------------------
-- Records of newsletter
-- ----------------------------
BEGIN;
INSERT INTO `newsletter` VALUES ('1', 'Sistem Seiki Aditama terima penghargaan perusahaan terpercaya', 'penghargaan yang didapat oleh PT Sistem Seika Aditama merupakan hasil dari kerja keras team. penghargaan diberikan oleh kementerian perdagangan republik indonesia', 'images/newsletter/newsletter1.jpg'), ('2', 'Jalin kerjasama dengan Yamaha', 'PT Sistem Seiki Aditama menjalin kerjasama dengan perusahaan Yamaha', 'images/newsletter/newsletter2.jpg'), ('3', 'Jalin kerjasama dengan Omron', 'PT Sistem Seiki Aditama menjalin kerjasama dengan perusahaan Omron', 'images/newsletter/newsletter3.jpg'), ('4', 'Jalin kerjasama dengan Mitsubishi', 'PT Sistem Seiki Aditama menjalin kerjasama dengan perusahaan Mitsubishi', 'images/newsletter/newsletter4.jpg'), ('5', 'Jalin kerjasama dengan SMC', 'PT Sistem Seiki Aditama menjalin kerjasama dengan perusahaan SMC', 'images/newsletter/newsletter5.jpg');
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
AUTO_INCREMENT=6

;

-- ----------------------------
-- Records of newsletter_subcribe
-- ----------------------------
BEGIN;
INSERT INTO `newsletter_subcribe` VALUES ('1', 'caliandrat9@gmail.com'), ('2', 'caliandratrinanda@gmail.com'), ('3', 'ctrinanda@gmail.com'), ('4', 'jinothanloi@gmail.com'), ('5', 'caltrinanda@gmail.com');
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
`productPartNumber`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
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
AUTO_INCREMENT=201

;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES ('1', 'product 1', 'CYIT34-1', '30', 'spec 1', 'desc 1', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('2', 'product 2', 'CYIT34-2', '30', 'spec 2', 'desc 2', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('3', 'product 3', 'CYIT34-3', '30', 'spec 3', 'desc 3', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('4', 'product 4', 'CYIT34-4', '30', 'spec 4', 'desc 4', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('5', 'product 5', 'CYIT34-5', '30', 'spec 5', 'desc 5', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('6', 'product 6', 'CYIT34-6', '30', 'spec 6', 'desc 6', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('7', 'product 7', 'CYIT34-7', '30', 'spec 7', 'desc 7', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('8', 'product 8', 'CYIT34-8', '30', 'spec 8', 'desc 8', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('9', 'product 9', 'CYIT34-9', '30', 'spec 9', 'desc 9', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('10', 'product 10', 'CYIT34-10', '30', 'spec 10', 'desc 10', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('11', 'product 11', 'CYIT34-11', '30', 'spec 11', 'desc 11', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('12', 'product 12', 'CYIT34-12', '30', 'spec 12', 'desc 12', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('13', 'product 13', 'CYIT34-13', '30', 'spec 13', 'desc 13', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('14', 'product 14', 'CYIT34-14', '30', 'spec 14', 'desc 14', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('15', 'product 15', 'CYIT34-15', '30', 'spec 15', 'desc 15', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('16', 'product 16', 'CYIT34-16', '30', 'spec 16', 'desc 16', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('17', 'product 17', 'CYIT34-17', '30', 'spec 17', 'desc 17', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('18', 'product 18', 'CYIT34-18', '30', 'spec 18', 'desc 18', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('19', 'product 19', 'CYIT34-19', '30', 'spec 19', 'desc 19', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('20', 'product 20', 'CYIT34-20', '30', 'spec 20', 'desc 20', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('21', 'product 21', 'CYIT34-21', '30', 'spec 21', 'desc 21', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('22', 'product 22', 'CYIT34-22', '30', 'spec 22', 'desc 22', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('23', 'product 23', 'CYIT34-23', '30', 'spec 23', 'desc 23', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('24', 'product 24', 'CYIT34-24', '30', 'spec 24', 'desc 24', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('25', 'product 25', 'CYIT34-25', '30', 'spec 25', 'desc 25', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('26', 'product 26', 'CYIT34-26', '30', 'spec 26', 'desc 26', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('27', 'product 27', 'CYIT34-27', '30', 'spec 27', 'desc 27', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('28', 'product 28', 'CYIT34-28', '30', 'spec 28', 'desc 28', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('29', 'product 29', 'CYIT34-29', '30', 'spec 29', 'desc 29', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('30', 'product 30', 'CYIT34-30', '30', 'spec 30', 'desc 30', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('31', 'product 31', 'CYIT34-31', '30', 'spec 31', 'desc 31', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('32', 'product 32', 'CYIT34-32', '30', 'spec 32', 'desc 32', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('33', 'product 33', 'CYIT34-33', '30', 'spec 33', 'desc 33', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('34', 'product 34', 'CYIT34-34', '30', 'spec 34', 'desc 34', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('35', 'product 35', 'CYIT34-35', '30', 'spec 35', 'desc 35', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('36', 'product 36', 'CYIT34-36', '30', 'spec 36', 'desc 36', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('37', 'product 37', 'CYIT34-37', '30', 'spec 37', 'desc 37', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('38', 'product 38', 'CYIT34-38', '30', 'spec 38', 'desc 38', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('39', 'product 39', 'CYIT34-39', '30', 'spec 39', 'desc 39', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('40', 'product 40', 'CYIT34-40', '30', 'spec 40', 'desc 40', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('41', 'product 41', 'CYIT34-41', '30', 'spec 41', 'desc 41', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('42', 'product 42', 'CYIT34-42', '30', 'spec 42', 'desc 42', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('43', 'product 43', 'CYIT34-43', '30', 'spec 43', 'desc 43', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('44', 'product 44', 'CYIT34-44', '30', 'spec 44', 'desc 44', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('45', 'product 45', 'CYIT34-45', '30', 'spec 45', 'desc 45', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('46', 'product 46', 'CYIT34-46', '30', 'spec 46', 'desc 46', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('47', 'product 47', 'CYIT34-47', '30', 'spec 47', 'desc 47', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('48', 'product 48', 'CYIT34-48', '30', 'spec 48', 'desc 48', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('49', 'product 49', 'CYIT34-49', '30', 'spec 49', 'desc 49', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('50', 'product 50', 'CYIT34-50', '30', 'spec 50', 'desc 50', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('51', 'product 51', 'CYIT34-51', '30', 'spec 51', 'desc 51', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('52', 'product 52', 'CYIT34-52', '30', 'spec 52', 'desc 52', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('53', 'product 53', 'CYIT34-53', '30', 'spec 53', 'desc 53', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('54', 'product 54', 'CYIT34-54', '30', 'spec 54', 'desc 54', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('55', 'product 55', 'CYIT34-55', '30', 'spec 55', 'desc 55', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('56', 'product 56', 'CYIT34-56', '30', 'spec 56', 'desc 56', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('57', 'product 57', 'CYIT34-57', '30', 'spec 57', 'desc 57', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('58', 'product 58', 'CYIT34-58', '30', 'spec 58', 'desc 58', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('59', 'product 59', 'CYIT34-59', '30', 'spec 59', 'desc 59', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('60', 'product 60', 'CYIT34-60', '30', 'spec 60', 'desc 60', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('61', 'product 61', 'CYIT34-61', '30', 'spec 61', 'desc 61', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('62', 'product 62', 'CYIT34-62', '30', 'spec 62', 'desc 62', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('63', 'product 63', 'CYIT34-63', '30', 'spec 63', 'desc 63', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('64', 'product 64', 'CYIT34-64', '30', 'spec 64', 'desc 64', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('65', 'product 65', 'CYIT34-65', '30', 'spec 65', 'desc 65', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('66', 'product 66', 'CYIT34-66', '30', 'spec 66', 'desc 66', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('67', 'product 67', 'CYIT34-67', '30', 'spec 67', 'desc 67', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('68', 'product 68', 'CYIT34-68', '30', 'spec 68', 'desc 68', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('69', 'product 69', 'CYIT34-69', '30', 'spec 69', 'desc 69', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('70', 'product 70', 'CYIT34-70', '30', 'spec 70', 'desc 70', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('71', 'product 71', 'CYIT34-71', '30', 'spec 71', 'desc 71', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('72', 'product 72', 'CYIT34-72', '30', 'spec 72', 'desc 72', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('73', 'product 73', 'CYIT34-73', '30', 'spec 73', 'desc 73', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('74', 'product 74', 'CYIT34-74', '30', 'spec 74', 'desc 74', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('75', 'product 75', 'CYIT34-75', '30', 'spec 75', 'desc 75', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('76', 'product 76', 'CYIT34-76', '30', 'spec 76', 'desc 76', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('77', 'product 77', 'CYIT34-77', '30', 'spec 77', 'desc 77', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('78', 'product 78', 'CYIT34-78', '30', 'spec 78', 'desc 78', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('79', 'product 79', 'CYIT34-79', '30', 'spec 79', 'desc 79', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('80', 'product 80', 'CYIT34-80', '30', 'spec 80', 'desc 80', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('81', 'product 81', 'CYIT34-81', '30', 'spec 81', 'desc 81', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('82', 'product 82', 'CYIT34-82', '30', 'spec 82', 'desc 82', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('83', 'product 83', 'CYIT34-83', '30', 'spec 83', 'desc 83', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('84', 'product 84', 'CYIT34-84', '30', 'spec 84', 'desc 84', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('85', 'product 85', 'CYIT34-85', '30', 'spec 85', 'desc 85', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('86', 'product 86', 'CYIT34-86', '30', 'spec 86', 'desc 86', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('87', 'product 87', 'CYIT34-87', '30', 'spec 87', 'desc 87', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('88', 'product 88', 'CYIT34-88', '30', 'spec 88', 'desc 88', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('89', 'product 89', 'CYIT34-89', '30', 'spec 89', 'desc 89', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('90', 'product 90', 'CYIT34-90', '30', 'spec 90', 'desc 90', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('91', 'product 91', 'CYIT34-91', '30', 'spec 91', 'desc 91', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('92', 'product 92', 'CYIT34-92', '30', 'spec 92', 'desc 92', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('93', 'product 93', 'CYIT34-93', '30', 'spec 93', 'desc 93', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('94', 'product 94', 'CYIT34-94', '30', 'spec 94', 'desc 94', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('95', 'product 95', 'CYIT34-95', '30', 'spec 95', 'desc 95', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('96', 'product 96', 'CYIT34-96', '30', 'spec 96', 'desc 96', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('97', 'product 97', 'CYIT34-97', '30', 'spec 97', 'desc 97', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('98', 'product 98', 'CYIT34-98', '30', 'spec 98', 'desc 98', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('99', 'product 99', 'CYIT34-99', '30', 'spec 99', 'desc 99', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('100', 'product 100', 'CYIT34-100', '30', 'spec 100', 'desc 100', '3', 'https://www.sistemseiki.com/catalog', '5', '1');
INSERT INTO `product` VALUES ('101', 'product 101', 'CYIT34-101', '30', 'spec 101', 'desc 101', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('102', 'product 102', 'CYIT34-102', '30', 'spec 102', 'desc 102', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('103', 'product 103', 'CYIT34-103', '30', 'spec 103', 'desc 103', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('104', 'product 104', 'CYIT34-104', '30', 'spec 104', 'desc 104', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('105', 'product 105', 'CYIT34-105', '30', 'spec 105', 'desc 105', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('106', 'product 106', 'CYIT34-106', '30', 'spec 106', 'desc 106', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('107', 'product 107', 'CYIT34-107', '30', 'spec 107', 'desc 107', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('108', 'product 108', 'CYIT34-108', '30', 'spec 108', 'desc 108', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('109', 'product 109', 'CYIT34-109', '30', 'spec 109', 'desc 109', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('110', 'product 110', 'CYIT34-110', '30', 'spec 110', 'desc 110', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('111', 'product 111', 'CYIT34-111', '30', 'spec 111', 'desc 111', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('112', 'product 112', 'CYIT34-112', '30', 'spec 112', 'desc 112', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('113', 'product 113', 'CYIT34-113', '30', 'spec 113', 'desc 113', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('114', 'product 114', 'CYIT34-114', '30', 'spec 114', 'desc 114', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('115', 'product 115', 'CYIT34-115', '30', 'spec 115', 'desc 115', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('116', 'product 116', 'CYIT34-116', '30', 'spec 116', 'desc 116', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('117', 'product 117', 'CYIT34-117', '30', 'spec 117', 'desc 117', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('118', 'product 118', 'CYIT34-118', '30', 'spec 118', 'desc 118', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('119', 'product 119', 'CYIT34-119', '30', 'spec 119', 'desc 119', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('120', 'product 120', 'CYIT34-120', '30', 'spec 120', 'desc 120', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('121', 'product 121', 'CYIT34-121', '30', 'spec 121', 'desc 121', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('122', 'product 122', 'CYIT34-122', '30', 'spec 122', 'desc 122', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('123', 'product 123', 'CYIT34-123', '30', 'spec 123', 'desc 123', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('124', 'product 124', 'CYIT34-124', '30', 'spec 124', 'desc 124', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('125', 'product 125', 'CYIT34-125', '30', 'spec 125', 'desc 125', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('126', 'product 126', 'CYIT34-126', '30', 'spec 126', 'desc 126', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('127', 'product 127', 'CYIT34-127', '30', 'spec 127', 'desc 127', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('128', 'product 128', 'CYIT34-128', '30', 'spec 128', 'desc 128', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('129', 'product 129', 'CYIT34-129', '30', 'spec 129', 'desc 129', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('130', 'product 130', 'CYIT34-130', '30', 'spec 130', 'desc 130', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('131', 'product 131', 'CYIT34-131', '30', 'spec 131', 'desc 131', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('132', 'product 132', 'CYIT34-132', '30', 'spec 132', 'desc 132', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('133', 'product 133', 'CYIT34-133', '30', 'spec 133', 'desc 133', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('134', 'product 134', 'CYIT34-134', '30', 'spec 134', 'desc 134', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('135', 'product 135', 'CYIT34-135', '30', 'spec 135', 'desc 135', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('136', 'product 136', 'CYIT34-136', '30', 'spec 136', 'desc 136', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('137', 'product 137', 'CYIT34-137', '30', 'spec 137', 'desc 137', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('138', 'product 138', 'CYIT34-138', '30', 'spec 138', 'desc 138', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('139', 'product 139', 'CYIT34-139', '30', 'spec 139', 'desc 139', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('140', 'product 140', 'CYIT34-140', '30', 'spec 140', 'desc 140', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('141', 'product 141', 'CYIT34-141', '30', 'spec 141', 'desc 141', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('142', 'product 142', 'CYIT34-142', '30', 'spec 142', 'desc 142', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('143', 'product 143', 'CYIT34-143', '30', 'spec 143', 'desc 143', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('144', 'product 144', 'CYIT34-144', '30', 'spec 144', 'desc 144', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('145', 'product 145', 'CYIT34-145', '30', 'spec 145', 'desc 145', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('146', 'product 146', 'CYIT34-146', '30', 'spec 146', 'desc 146', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('147', 'product 147', 'CYIT34-147', '30', 'spec 147', 'desc 147', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('148', 'product 148', 'CYIT34-148', '30', 'spec 148', 'desc 148', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('149', 'product 149', 'CYIT34-149', '30', 'spec 149', 'desc 149', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('150', 'product 150', 'CYIT34-150', '30', 'spec 150', 'desc 150', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('151', 'product 151', 'CYIT34-151', '30', 'spec 151', 'desc 151', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('152', 'product 152', 'CYIT34-152', '30', 'spec 152', 'desc 152', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('153', 'product 153', 'CYIT34-153', '30', 'spec 153', 'desc 153', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('154', 'product 154', 'CYIT34-154', '30', 'spec 154', 'desc 154', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('155', 'product 155', 'CYIT34-155', '30', 'spec 155', 'desc 155', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('156', 'product 156', 'CYIT34-156', '30', 'spec 156', 'desc 156', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('157', 'product 157', 'CYIT34-157', '30', 'spec 157', 'desc 157', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('158', 'product 158', 'CYIT34-158', '30', 'spec 158', 'desc 158', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('159', 'product 159', 'CYIT34-159', '30', 'spec 159', 'desc 159', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('160', 'product 160', 'CYIT34-160', '30', 'spec 160', 'desc 160', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('161', 'product 161', 'CYIT34-161', '30', 'spec 161', 'desc 161', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('162', 'product 162', 'CYIT34-162', '30', 'spec 162', 'desc 162', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('163', 'product 163', 'CYIT34-163', '30', 'spec 163', 'desc 163', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('164', 'product 164', 'CYIT34-164', '30', 'spec 164', 'desc 164', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('165', 'product 165', 'CYIT34-165', '30', 'spec 165', 'desc 165', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('166', 'product 166', 'CYIT34-166', '30', 'spec 166', 'desc 166', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('167', 'product 167', 'CYIT34-167', '30', 'spec 167', 'desc 167', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('168', 'product 168', 'CYIT34-168', '30', 'spec 168', 'desc 168', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('169', 'product 169', 'CYIT34-169', '30', 'spec 169', 'desc 169', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('170', 'product 170', 'CYIT34-170', '30', 'spec 170', 'desc 170', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('171', 'product 171', 'CYIT34-171', '30', 'spec 171', 'desc 171', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('172', 'product 172', 'CYIT34-172', '30', 'spec 172', 'desc 172', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('173', 'product 173', 'CYIT34-173', '30', 'spec 173', 'desc 173', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('174', 'product 174', 'CYIT34-174', '30', 'spec 174', 'desc 174', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('175', 'product 175', 'CYIT34-175', '30', 'spec 175', 'desc 175', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('176', 'product 176', 'CYIT34-176', '30', 'spec 176', 'desc 176', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('177', 'product 177', 'CYIT34-177', '30', 'spec 177', 'desc 177', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('178', 'product 178', 'CYIT34-178', '30', 'spec 178', 'desc 178', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('179', 'product 179', 'CYIT34-179', '30', 'spec 179', 'desc 179', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('180', 'product 180', 'CYIT34-180', '30', 'spec 180', 'desc 180', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('181', 'product 181', 'CYIT34-181', '30', 'spec 181', 'desc 181', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('182', 'product 182', 'CYIT34-182', '30', 'spec 182', 'desc 182', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('183', 'product 183', 'CYIT34-183', '30', 'spec 183', 'desc 183', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('184', 'product 184', 'CYIT34-184', '30', 'spec 184', 'desc 184', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('185', 'product 185', 'CYIT34-185', '30', 'spec 185', 'desc 185', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('186', 'product 186', 'CYIT34-186', '30', 'spec 186', 'desc 186', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('187', 'product 187', 'CYIT34-187', '30', 'spec 187', 'desc 187', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('188', 'product 188', 'CYIT34-188', '30', 'spec 188', 'desc 188', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('189', 'product 189', 'CYIT34-189', '30', 'spec 189', 'desc 189', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('190', 'product 190', 'CYIT34-190', '30', 'spec 190', 'desc 190', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('191', 'product 191', 'CYIT34-191', '30', 'spec 191', 'desc 191', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('192', 'product 192', 'CYIT34-192', '30', 'spec 192', 'desc 192', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('193', 'product 193', 'CYIT34-193', '30', 'spec 193', 'desc 193', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('194', 'product 194', 'CYIT34-194', '30', 'spec 194', 'desc 194', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('195', 'product 195', 'CYIT34-195', '30', 'spec 195', 'desc 195', '3', 'https://www.sistemseiki.com/catalog', '5', '1'), ('196', 'product 196', 'CYIT34-196', '30', 'spec 196', 'desc 196', '3', 'https://www.sistemseiki.com/catalog', '1', '5'), ('197', 'product 197', 'CYIT34-197', '30', 'spec 197', 'desc 197', '3', 'https://www.sistemseiki.com/catalog', '2', '4'), ('198', 'product 198', 'CYIT34-198', '30', 'spec 198', 'desc 198', '3', 'https://www.sistemseiki.com/catalog', '3', '3'), ('199', 'product 199', 'CYIT34-199', '30', 'spec 199', 'desc 199', '3', 'https://www.sistemseiki.com/catalog', '4', '2'), ('200', 'product 200', 'CYIT34-200', '30', 'spec 200', 'desc 200', '3', 'https://www.sistemseiki.com/catalog', '5', '1');
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
AUTO_INCREMENT=6

;

-- ----------------------------
-- Records of product_brand
-- ----------------------------
BEGIN;
INSERT INTO `product_brand` VALUES ('1', 'YAMAHA', 'images/product/brand/yamaha.jpg'), ('2', 'OMRON', 'images/product/brand/omron.jpg'), ('3', 'MITSUBISHI', 'images/product/brand/mitsubishi.jpg'), ('4', 'ORIENTAL MOTOR', 'images/product/brand/orientalmotor.jpg'), ('5', 'SMC', 'images/product/brand/smc.jpg');
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
AUTO_INCREMENT=23

;

-- ----------------------------
-- Records of product_brand_category
-- ----------------------------
BEGIN;
INSERT INTO `product_brand_category` VALUES ('1', '1', '1'), ('2', '1', '2'), ('3', '1', '3'), ('4', '1', '4'), ('5', '1', '5'), ('6', '2', '5'), ('7', '2', '3'), ('8', '2', '2'), ('11', '3', '1'), ('12', '3', '2'), ('13', '3', '3'), ('14', '3', '4'), ('15', '3', '5'), ('16', '4', '1'), ('17', '4', '4'), ('18', '4', '5'), ('21', '5', '2'), ('22', '5', '1');
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
AUTO_INCREMENT=6

;

-- ----------------------------
-- Records of product_category
-- ----------------------------
BEGIN;
INSERT INTO `product_category` VALUES ('1', 'Fastener', 'images/product/category/Fastener.jpg'), ('2', 'Material', 'images/product/category/Material.jpg'), ('3', 'Electrical', 'images/product/category/Electrical.jpg'), ('4', 'Automation Component', 'images/product/category/Automation.jpg'), ('5', 'Wiring Component', 'images/product/category/Wiring.jpg');
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
AUTO_INCREMENT=202

;

-- ----------------------------
-- Records of product_price
-- ----------------------------
BEGIN;
INSERT INTO `product_price` VALUES ('1', '40000', '1'), ('2', '40000', '2'), ('3', '40000', '3'), ('4', '40000', '4'), ('5', '40000', '5'), ('6', '40000', '6'), ('7', '40000', '7'), ('8', '40000', '8'), ('9', '40000', '9'), ('10', '40000', '10'), ('11', '40000', '11'), ('12', '40000', '12'), ('13', '40000', '13'), ('14', '40000', '14'), ('15', '40000', '15'), ('16', '40000', '16'), ('17', '40000', '17'), ('18', '40000', '18'), ('19', '40000', '19'), ('20', '40000', '20'), ('21', '40000', '21'), ('22', '40000', '22'), ('23', '40000', '23'), ('24', '40000', '24'), ('25', '40000', '25'), ('26', '40000', '26'), ('27', '40000', '27'), ('28', '40000', '28'), ('29', '40000', '29'), ('30', '40000', '30'), ('31', '40000', '31'), ('32', '40000', '32'), ('33', '40000', '33'), ('34', '40000', '34'), ('35', '40000', '35'), ('36', '40000', '36'), ('37', '40000', '37'), ('38', '40000', '38'), ('39', '40000', '39'), ('40', '40000', '40'), ('41', '40000', '41'), ('42', '40000', '42'), ('43', '40000', '43'), ('44', '40000', '44'), ('45', '40000', '45'), ('46', '40000', '46'), ('47', '40000', '47'), ('48', '40000', '48'), ('49', '40000', '49'), ('50', '40000', '50'), ('51', '40000', '51'), ('52', '40000', '52'), ('53', '40000', '53'), ('54', '40000', '54'), ('55', '40000', '55'), ('56', '40000', '56'), ('57', '40000', '57'), ('58', '40000', '58'), ('59', '40000', '59'), ('60', '40000', '60'), ('61', '40000', '61'), ('62', '65000', '62'), ('63', '65000', '63'), ('64', '65000', '64'), ('65', '65000', '65'), ('66', '65000', '66'), ('67', '65000', '67'), ('68', '65000', '68'), ('69', '65000', '69'), ('70', '65000', '70'), ('71', '65000', '71'), ('72', '65000', '72'), ('73', '65000', '73'), ('74', '65000', '74'), ('75', '65000', '75'), ('76', '65000', '76'), ('77', '65000', '77'), ('78', '65000', '78'), ('79', '65000', '79'), ('80', '65000', '80'), ('81', '65000', '81'), ('82', '65000', '82'), ('83', '65000', '83'), ('84', '65000', '84'), ('85', '65000', '85'), ('86', '65000', '86'), ('87', '65000', '87'), ('88', '65000', '88'), ('89', '65000', '89'), ('90', '65000', '90'), ('91', '65000', '91'), ('92', '65000', '92'), ('93', '65000', '93'), ('94', '65000', '94'), ('95', '65000', '95'), ('96', '65000', '96'), ('97', '65000', '97'), ('98', '65000', '98'), ('99', '65000', '99'), ('100', '65000', '100');
INSERT INTO `product_price` VALUES ('101', '65000', '101'), ('102', '65000', '102'), ('103', '65000', '103'), ('104', '65000', '104'), ('105', '65000', '105'), ('106', '65000', '106'), ('107', '65000', '107'), ('108', '65000', '108'), ('109', '65000', '109'), ('110', '65000', '110'), ('111', '65000', '111'), ('112', '65000', '112'), ('113', '65000', '113'), ('114', '65000', '114'), ('115', '65000', '115'), ('116', '65000', '116'), ('117', '65000', '117'), ('118', '65000', '118'), ('119', '65000', '119'), ('120', '65000', '120'), ('121', '65000', '121'), ('122', '65000', '122'), ('123', '65000', '123'), ('124', '65000', '124'), ('125', '65000', '125'), ('126', '65000', '126'), ('127', '65000', '127'), ('128', '65000', '128'), ('129', '78700', '129'), ('130', '78700', '130'), ('131', '78700', '131'), ('132', '78700', '132'), ('133', '78700', '133'), ('134', '78700', '134'), ('135', '78700', '135'), ('136', '78700', '136'), ('137', '78700', '137'), ('138', '78700', '138'), ('139', '78700', '139'), ('140', '78700', '140'), ('141', '78700', '141'), ('142', '78700', '142'), ('143', '78700', '143'), ('144', '78700', '144'), ('145', '78700', '145'), ('146', '78700', '146'), ('147', '78700', '147'), ('148', '78700', '148'), ('149', '78700', '149'), ('150', '78700', '150'), ('151', '78700', '151'), ('152', '78700', '152'), ('153', '78700', '153'), ('154', '78700', '154'), ('155', '78700', '155'), ('156', '78700', '156'), ('157', '78700', '157'), ('158', '78700', '158'), ('159', '78700', '159'), ('160', '78700', '160'), ('161', '78700', '161'), ('162', '78700', '162'), ('163', '78700', '163'), ('164', '78700', '164'), ('165', '78700', '165'), ('166', '78700', '166'), ('167', '78700', '167'), ('168', '78700', '168'), ('169', '78700', '169'), ('170', '78700', '170'), ('171', '78700', '171'), ('172', '78700', '172'), ('173', '78700', '173'), ('174', '78700', '174'), ('175', '78700', '175'), ('176', '78700', '176'), ('177', '78700', '177'), ('178', '78700', '178'), ('179', '78700', '179'), ('180', '78700', '180'), ('181', '78700', '181'), ('182', '78700', '182'), ('183', '78700', '183'), ('184', '78700', '184'), ('185', '78700', '185'), ('186', '78700', '186'), ('187', '78700', '187'), ('188', '78700', '188'), ('189', '78700', '189'), ('190', '78700', '190'), ('191', '78700', '191'), ('192', '78700', '192'), ('193', '78700', '193'), ('194', '78700', '194'), ('195', '78700', '195'), ('196', '78700', '196'), ('197', '78700', '197'), ('198', '78700', '198'), ('199', '78700', '199'), ('200', '78700', '200');
INSERT INTO `product_price` VALUES ('201', '78700', '201');
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
AUTO_INCREMENT=11

;

-- ----------------------------
-- Records of product_promo
-- ----------------------------
BEGIN;
INSERT INTO `product_promo` VALUES ('1', 'promo 1', 'images/product/promo/promo1.jpg', '1'), ('2', 'promo 2', 'images/product/promo/promo2.jpg', '34'), ('3', 'promo 3', 'images/product/promo/promo3.jpg', '64'), ('4', 'promo 4', 'images/product/promo/promo4.jpg', '32'), ('5', 'promo 5', 'images/product/promo/promo5.jpg', '12'), ('6', 'promo 6', 'images/product/promo/promo6.jpg', '45'), ('7', 'promo 7', 'images/product/promo/promo7.jpg', '200'), ('8', 'promo 8', 'images/product/promo/promo8.jpg', '21'), ('9', 'promo 9', 'images/product/promo/promo9.jpg', '23'), ('10', 'promo 10', 'images/product/promo/promo10.jpg', '87');
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
INSERT INTO `product_top` VALUES ('2', '45', '76'), ('4', '234', '12'), ('5', '657', '876'), ('8', '765', '67'), ('21', '432', '768'), ('23', '756', '453'), ('45', '574', '432'), ('87', '543', '324'), ('200', '543', '432');
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
ALTER TABLE `advertisement` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for api_log
-- ----------------------------
ALTER TABLE `api_log` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for contact_form
-- ----------------------------
ALTER TABLE `contact_form` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for customer_address
-- ----------------------------
ALTER TABLE `customer_address` AUTO_INCREMENT=37;

-- ----------------------------
-- Auto increment value for customer_data_kredit
-- ----------------------------
ALTER TABLE `customer_data_kredit` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for customer_data_kredit_status
-- ----------------------------
ALTER TABLE `customer_data_kredit_status` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for customer_forgot_password
-- ----------------------------
ALTER TABLE `customer_forgot_password` AUTO_INCREMENT=11;

-- ----------------------------
-- Auto increment value for customer_payment_data
-- ----------------------------
ALTER TABLE `customer_payment_data` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for customer_personal_info
-- ----------------------------
ALTER TABLE `customer_personal_info` AUTO_INCREMENT=38;

-- ----------------------------
-- Auto increment value for customer_session
-- ----------------------------
ALTER TABLE `customer_session` AUTO_INCREMENT=27;

-- ----------------------------
-- Auto increment value for faq
-- ----------------------------
ALTER TABLE `faq` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for faq_waiting_list
-- ----------------------------
ALTER TABLE `faq_waiting_list` AUTO_INCREMENT=1;

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
ALTER TABLE `newsletter` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for newsletter_subcribe
-- ----------------------------
ALTER TABLE `newsletter_subcribe` AUTO_INCREMENT=6;

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
ALTER TABLE `product` AUTO_INCREMENT=201;

-- ----------------------------
-- Auto increment value for product_brand
-- ----------------------------
ALTER TABLE `product_brand` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for product_brand_category
-- ----------------------------
ALTER TABLE `product_brand_category` AUTO_INCREMENT=23;

-- ----------------------------
-- Auto increment value for product_category
-- ----------------------------
ALTER TABLE `product_category` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for product_price
-- ----------------------------
ALTER TABLE `product_price` AUTO_INCREMENT=202;

-- ----------------------------
-- Auto increment value for product_promo
-- ----------------------------
ALTER TABLE `product_promo` AUTO_INCREMENT=11;

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
