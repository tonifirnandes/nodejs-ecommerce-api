/*
Navicat MySQL Data Transfer

Source Server         : MYSQL LOCALHOST
Source Server Version : 100126
Source Host           : localhost:3306
Source Database       : qmall_store_dev

Target Server Type    : MYSQL
Target Server Version : 100126
File Encoding         : 65001

Date: 2017-11-15 09:29:35
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
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
`cartId`  int(11) NOT NULL AUTO_INCREMENT ,
`cartTime`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`cartExpireTime`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`customerEmail`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`cartStatus`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`cartId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=22

;

-- ----------------------------
-- Records of cart
-- ----------------------------
BEGIN;
INSERT INTO `cart` VALUES ('19', '2017-11-13 15:49:51', '2017-11-13 15:49:51', 'test@gmail.com', 'expired'), ('20', '2017-11-13 15:50:51', '2017-11-13 15:50:51', 'test@gmail.com', 'finish'), ('21', '2017-11-13 15:51:03', '2017-12-13 15:51:03', 'test@gmail.com', 'active');
COMMIT;

-- ----------------------------
-- Table structure for cart_item
-- ----------------------------
DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE `cart_item` (
`cartItemId`  int(11) NOT NULL AUTO_INCREMENT ,
`cartItemQuantity`  int(5) NULL DEFAULT NULL ,
`productId`  int(11) NULL DEFAULT NULL ,
`cartId`  int(11) NULL DEFAULT NULL ,
`cartItemTotalPrice`  int(20) NULL DEFAULT NULL ,
PRIMARY KEY (`cartItemId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=23

;

-- ----------------------------
-- Records of cart_item
-- ----------------------------
BEGIN;
INSERT INTO `cart_item` VALUES ('21', '10', '22', '20', '20000'), ('22', '10', '22', '21', '20000');
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
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of contact_form
-- ----------------------------
BEGIN;
INSERT INTO `contact_form` VALUES ('1', 'u', 'dsfsd', '     dsf', 'hgdh', 'hdfh', 'hfdh', 'hfdh', 'hgf');
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
AUTO_INCREMENT=6

;

-- ----------------------------
-- Records of customer_address
-- ----------------------------
BEGIN;
INSERT INTO `customer_address` VALUES ('1', '1', '31111', 'test@gmail.com'), ('2', '1', '31111', '1'), ('3', '4', '31111', '1'), ('4', '4', '31111', '1'), ('5', '4', '31111', '1');
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
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of customer_data_kredit
-- ----------------------------
BEGIN;
INSERT INTO `customer_data_kredit` VALUES ('1', '150000000', '300000000', '1', 'test@gmail.com');
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
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of customer_data_kredit_status
-- ----------------------------
BEGIN;
INSERT INTO `customer_data_kredit_status` VALUES ('1', 'TERSEDIA'), ('2', 'TIDAK TERSEDIA');
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
-- Table structure for customer_inquiry
-- ----------------------------
DROP TABLE IF EXISTS `customer_inquiry`;
CREATE TABLE `customer_inquiry` (
`customerInquiryId`  int(11) NOT NULL AUTO_INCREMENT ,
`customerEmail`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`customerTelephone`  varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`customerInquiryNotes`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`productId`  int(11) NOT NULL ,
`customerInquiryDate`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (`customerInquiryId`),
FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE,
INDEX `productForeignKey` (`productId`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=9

;

-- ----------------------------
-- Records of customer_inquiry
-- ----------------------------
BEGIN;
INSERT INTO `customer_inquiry` VALUES ('1', 'lexwanlex@gmail.com', '7900999606', 'Nothing to note', '2', '2017-11-09 15:45:08'), ('2', 'wanlexwan@gmail.com', '08969694692', 'Nothing to notes', '2', '2017-11-09 15:45:08'), ('8', 'u', '134', 'dsf', '1', '2017-11-10 17:47:09');
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
`productDeliveryTimeId`  int(11) NULL DEFAULT NULL ,
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
INSERT INTO `product` VALUES ('1', 'product 1', 'CYIT34-1', '0', 'spec 1', 'desc 1', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '1'), ('2', 'product 2', 'CYIT34-2', '1', 'spec 2', 'desc 2', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '2'), ('3', 'product 3', 'CYIT34-3', '2', 'spec 3', 'desc 3', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '3'), ('4', 'product 4', 'CYIT34-4', '3', 'spec 4', 'desc 4', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '4'), ('5', 'product 5', 'CYIT34-5', '4', 'spec 5', 'desc 5', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '5'), ('6', 'product 6', 'CYIT34-6', '5', 'spec 6', 'desc 6', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '6'), ('7', 'product 7', 'CYIT34-7', '6', 'spec 7', 'desc 7', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '7'), ('8', 'product 8', 'CYIT34-8', '7', 'spec 8', 'desc 8', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '8'), ('9', 'product 9', 'CYIT34-9', '8', 'spec 9', 'desc 9', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '9'), ('10', 'product 10', 'CYIT34-10', '9', 'spec 10', 'desc 10', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '10'), ('11', 'product 11', 'CYIT34-11', '10', 'spec 11', 'desc 11', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '11'), ('12', 'product 12', 'CYIT34-12', '11', 'spec 12', 'desc 12', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '12'), ('13', 'product 13', 'CYIT34-13', '12', 'spec 13', 'desc 13', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '13'), ('14', 'product 14', 'CYIT34-14', '13', 'spec 14', 'desc 14', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '14'), ('15', 'product 15', 'CYIT34-15', '14', 'spec 15', 'desc 15', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '15'), ('16', 'product 16', 'CYIT34-16', '15', 'spec 16', 'desc 16', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '16'), ('17', 'product 17', 'CYIT34-17', '16', 'spec 17', 'desc 17', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '17'), ('18', 'product 18', 'CYIT34-18', '17', 'spec 18', 'desc 18', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '18'), ('19', 'product 19', 'CYIT34-19', '18', 'spec 19', 'desc 19', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '19'), ('20', 'product 20', 'CYIT34-20', '19', 'spec 20', 'desc 20', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '20'), ('21', 'product 21', 'CYIT34-21', '20', 'spec 21', 'desc 21', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '21'), ('22', 'product 22', 'CYIT34-22', '21', 'spec 22', 'desc 22', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '22'), ('23', 'product 23', 'CYIT34-23', '22', 'spec 23', 'desc 23', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '23'), ('24', 'product 24', 'CYIT34-24', '23', 'spec 24', 'desc 24', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '24'), ('25', 'product 25', 'CYIT34-25', '24', 'spec 25', 'desc 25', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '25'), ('26', 'product 26', 'CYIT34-26', '25', 'spec 26', 'desc 26', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '26'), ('27', 'product 27', 'CYIT34-27', '26', 'spec 27', 'desc 27', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '27'), ('28', 'product 28', 'CYIT34-28', '27', 'spec 28', 'desc 28', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '28'), ('29', 'product 29', 'CYIT34-29', '28', 'spec 29', 'desc 29', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '29'), ('30', 'product 30', 'CYIT34-30', '29', 'spec 30', 'desc 30', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '30'), ('31', 'product 31', 'CYIT34-31', '30', 'spec 31', 'desc 31', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '31'), ('32', 'product 32', 'CYIT34-32', '31', 'spec 32', 'desc 32', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '32'), ('33', 'product 33', 'CYIT34-33', '32', 'spec 33', 'desc 33', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '33'), ('34', 'product 34', 'CYIT34-34', '33', 'spec 34', 'desc 34', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '34'), ('35', 'product 35', 'CYIT34-35', '34', 'spec 35', 'desc 35', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '35'), ('36', 'product 36', 'CYIT34-36', '35', 'spec 36', 'desc 36', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '36'), ('37', 'product 37', 'CYIT34-37', '36', 'spec 37', 'desc 37', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '37'), ('38', 'product 38', 'CYIT34-38', '37', 'spec 38', 'desc 38', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '38'), ('39', 'product 39', 'CYIT34-39', '38', 'spec 39', 'desc 39', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '39'), ('40', 'product 40', 'CYIT34-40', '39', 'spec 40', 'desc 40', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '40'), ('41', 'product 41', 'CYIT34-41', '40', 'spec 41', 'desc 41', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '41'), ('42', 'product 42', 'CYIT34-42', '41', 'spec 42', 'desc 42', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '42'), ('43', 'product 43', 'CYIT34-43', '42', 'spec 43', 'desc 43', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '43'), ('44', 'product 44', 'CYIT34-44', '43', 'spec 44', 'desc 44', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '44'), ('45', 'product 45', 'CYIT34-45', '44', 'spec 45', 'desc 45', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '45'), ('46', 'product 46', 'CYIT34-46', '45', 'spec 46', 'desc 46', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '46'), ('47', 'product 47', 'CYIT34-47', '46', 'spec 47', 'desc 47', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '47'), ('48', 'product 48', 'CYIT34-48', '47', 'spec 48', 'desc 48', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '48'), ('49', 'product 49', 'CYIT34-49', '48', 'spec 49', 'desc 49', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '49'), ('50', 'product 50', 'CYIT34-50', '49', 'spec 50', 'desc 50', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '50'), ('51', 'product 51', 'CYIT34-51', '50', 'spec 51', 'desc 51', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '51'), ('52', 'product 52', 'CYIT34-52', '51', 'spec 52', 'desc 52', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '52'), ('53', 'product 53', 'CYIT34-53', '52', 'spec 53', 'desc 53', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '53'), ('54', 'product 54', 'CYIT34-54', '53', 'spec 54', 'desc 54', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '54'), ('55', 'product 55', 'CYIT34-55', '54', 'spec 55', 'desc 55', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '55'), ('56', 'product 56', 'CYIT34-56', '55', 'spec 56', 'desc 56', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '56'), ('57', 'product 57', 'CYIT34-57', '56', 'spec 57', 'desc 57', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '57'), ('58', 'product 58', 'CYIT34-58', '57', 'spec 58', 'desc 58', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '58'), ('59', 'product 59', 'CYIT34-59', '58', 'spec 59', 'desc 59', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '59'), ('60', 'product 60', 'CYIT34-60', '59', 'spec 60', 'desc 60', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '60'), ('61', 'product 61', 'CYIT34-61', '60', 'spec 61', 'desc 61', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '61'), ('62', 'product 62', 'CYIT34-62', '61', 'spec 62', 'desc 62', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '62'), ('63', 'product 63', 'CYIT34-63', '62', 'spec 63', 'desc 63', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '63'), ('64', 'product 64', 'CYIT34-64', '63', 'spec 64', 'desc 64', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '64'), ('65', 'product 65', 'CYIT34-65', '64', 'spec 65', 'desc 65', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '65'), ('66', 'product 66', 'CYIT34-66', '65', 'spec 66', 'desc 66', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '66'), ('67', 'product 67', 'CYIT34-67', '66', 'spec 67', 'desc 67', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '67'), ('68', 'product 68', 'CYIT34-68', '67', 'spec 68', 'desc 68', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '68'), ('69', 'product 69', 'CYIT34-69', '68', 'spec 69', 'desc 69', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '69'), ('70', 'product 70', 'CYIT34-70', '69', 'spec 70', 'desc 70', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '70'), ('71', 'product 71', 'CYIT34-71', '70', 'spec 71', 'desc 71', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '71'), ('72', 'product 72', 'CYIT34-72', '71', 'spec 72', 'desc 72', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '72'), ('73', 'product 73', 'CYIT34-73', '72', 'spec 73', 'desc 73', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '73'), ('74', 'product 74', 'CYIT34-74', '73', 'spec 74', 'desc 74', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '74'), ('75', 'product 75', 'CYIT34-75', '74', 'spec 75', 'desc 75', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '75'), ('76', 'product 76', 'CYIT34-76', '75', 'spec 76', 'desc 76', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '76'), ('77', 'product 77', 'CYIT34-77', '76', 'spec 77', 'desc 77', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '77'), ('78', 'product 78', 'CYIT34-78', '77', 'spec 78', 'desc 78', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '78'), ('79', 'product 79', 'CYIT34-79', '78', 'spec 79', 'desc 79', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '79'), ('80', 'product 80', 'CYIT34-80', '79', 'spec 80', 'desc 80', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '80'), ('81', 'product 81', 'CYIT34-81', '80', 'spec 81', 'desc 81', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '81'), ('82', 'product 82', 'CYIT34-82', '81', 'spec 82', 'desc 82', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '82'), ('83', 'product 83', 'CYIT34-83', '82', 'spec 83', 'desc 83', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '83'), ('84', 'product 84', 'CYIT34-84', '83', 'spec 84', 'desc 84', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '84'), ('85', 'product 85', 'CYIT34-85', '84', 'spec 85', 'desc 85', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '85'), ('86', 'product 86', 'CYIT34-86', '85', 'spec 86', 'desc 86', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '86'), ('87', 'product 87', 'CYIT34-87', '86', 'spec 87', 'desc 87', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '87'), ('88', 'product 88', 'CYIT34-88', '87', 'spec 88', 'desc 88', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '88'), ('89', 'product 89', 'CYIT34-89', '0', 'spec 89', 'desc 89', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '89'), ('90', 'product 90', 'CYIT34-90', '1', 'spec 90', 'desc 90', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '90'), ('91', 'product 91', 'CYIT34-91', '2', 'spec 91', 'desc 91', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '91'), ('92', 'product 92', 'CYIT34-92', '3', 'spec 92', 'desc 92', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '92'), ('93', 'product 93', 'CYIT34-93', '4', 'spec 93', 'desc 93', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '93'), ('94', 'product 94', 'CYIT34-94', '5', 'spec 94', 'desc 94', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '94'), ('95', 'product 95', 'CYIT34-95', '6', 'spec 95', 'desc 95', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '95'), ('96', 'product 96', 'CYIT34-96', '7', 'spec 96', 'desc 96', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '96'), ('97', 'product 97', 'CYIT34-97', '8', 'spec 97', 'desc 97', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '97'), ('98', 'product 98', 'CYIT34-98', '9', 'spec 98', 'desc 98', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '98'), ('99', 'product 99', 'CYIT34-99', '10', 'spec 99', 'desc 99', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '99'), ('100', 'product 100', 'CYIT34-100', '11', 'spec 100', 'desc 100', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '100');
INSERT INTO `product` VALUES ('101', 'product 101', 'CYIT34-101', '0', 'spec 101', 'desc 101', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '101'), ('102', 'product 102', 'CYIT34-102', '0', 'spec 102', 'desc 102', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '102'), ('103', 'product 103', 'CYIT34-103', '0', 'spec 103', 'desc 103', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '103'), ('104', 'product 104', 'CYIT34-104', '0', 'spec 104', 'desc 104', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '104'), ('105', 'product 105', 'CYIT34-105', '0', 'spec 105', 'desc 105', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '105'), ('106', 'product 106', 'CYIT34-106', '0', 'spec 106', 'desc 106', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '106'), ('107', 'product 107', 'CYIT34-107', '0', 'spec 107', 'desc 107', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '107'), ('108', 'product 108', 'CYIT34-108', '0', 'spec 108', 'desc 108', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '108'), ('109', 'product 109', 'CYIT34-109', '0', 'spec 109', 'desc 109', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '109'), ('110', 'product 110', 'CYIT34-110', '0', 'spec 110', 'desc 110', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '110'), ('111', 'product 111', 'CYIT34-111', '0', 'spec 111', 'desc 111', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '111'), ('112', 'product 112', 'CYIT34-112', '0', 'spec 112', 'desc 112', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '112'), ('113', 'product 113', 'CYIT34-113', '0', 'spec 113', 'desc 113', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '113'), ('114', 'product 114', 'CYIT34-114', '0', 'spec 114', 'desc 114', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '114'), ('115', 'product 115', 'CYIT34-115', '0', 'spec 115', 'desc 115', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '115'), ('116', 'product 116', 'CYIT34-116', '0', 'spec 116', 'desc 116', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '116'), ('117', 'product 117', 'CYIT34-117', '0', 'spec 117', 'desc 117', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '117'), ('118', 'product 118', 'CYIT34-118', '0', 'spec 118', 'desc 118', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '118'), ('119', 'product 119', 'CYIT34-119', '0', 'spec 119', 'desc 119', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '119'), ('120', 'product 120', 'CYIT34-120', '0', 'spec 120', 'desc 120', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '120'), ('121', 'product 121', 'CYIT34-121', '0', 'spec 121', 'desc 121', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '121'), ('122', 'product 122', 'CYIT34-122', '0', 'spec 122', 'desc 122', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '122'), ('123', 'product 123', 'CYIT34-123', '0', 'spec 123', 'desc 123', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '123'), ('124', 'product 124', 'CYIT34-124', '0', 'spec 124', 'desc 124', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '124'), ('125', 'product 125', 'CYIT34-125', '0', 'spec 125', 'desc 125', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '125'), ('126', 'product 126', 'CYIT34-126', '0', 'spec 126', 'desc 126', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '126'), ('127', 'product 127', 'CYIT34-127', '0', 'spec 127', 'desc 127', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '127'), ('128', 'product 128', 'CYIT34-128', '0', 'spec 128', 'desc 128', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '128'), ('129', 'product 129', 'CYIT34-129', '0', 'spec 129', 'desc 129', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '129'), ('130', 'product 130', 'CYIT34-130', '0', 'spec 130', 'desc 130', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '130'), ('131', 'product 131', 'CYIT34-131', '1', 'spec 131', 'desc 131', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '131'), ('132', 'product 132', 'CYIT34-132', '2', 'spec 132', 'desc 132', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '132'), ('133', 'product 133', 'CYIT34-133', '3', 'spec 133', 'desc 133', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '133'), ('134', 'product 134', 'CYIT34-134', '4', 'spec 134', 'desc 134', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '134'), ('135', 'product 135', 'CYIT34-135', '5', 'spec 135', 'desc 135', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '135'), ('136', 'product 136', 'CYIT34-136', '6', 'spec 136', 'desc 136', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '136'), ('137', 'product 137', 'CYIT34-137', '7', 'spec 137', 'desc 137', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '137'), ('138', 'product 138', 'CYIT34-138', '8', 'spec 138', 'desc 138', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '138'), ('139', 'product 139', 'CYIT34-139', '9', 'spec 139', 'desc 139', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '139'), ('140', 'product 140', 'CYIT34-140', '10', 'spec 140', 'desc 140', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '140'), ('141', 'product 141', 'CYIT34-141', '11', 'spec 141', 'desc 141', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '141'), ('142', 'product 142', 'CYIT34-142', '12', 'spec 142', 'desc 142', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '142'), ('143', 'product 143', 'CYIT34-143', '13', 'spec 143', 'desc 143', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '143'), ('144', 'product 144', 'CYIT34-144', '14', 'spec 144', 'desc 144', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '144'), ('145', 'product 145', 'CYIT34-145', '15', 'spec 145', 'desc 145', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '145'), ('146', 'product 146', 'CYIT34-146', '16', 'spec 146', 'desc 146', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '146'), ('147', 'product 147', 'CYIT34-147', '17', 'spec 147', 'desc 147', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '147'), ('148', 'product 148', 'CYIT34-148', '18', 'spec 148', 'desc 148', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '148'), ('149', 'product 149', 'CYIT34-149', '19', 'spec 149', 'desc 149', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '149'), ('150', 'product 150', 'CYIT34-150', '20', 'spec 150', 'desc 150', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '150'), ('151', 'product 151', 'CYIT34-151', '21', 'spec 151', 'desc 151', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '151'), ('152', 'product 152', 'CYIT34-152', '22', 'spec 152', 'desc 152', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '152'), ('153', 'product 153', 'CYIT34-153', '23', 'spec 153', 'desc 153', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '153'), ('154', 'product 154', 'CYIT34-154', '24', 'spec 154', 'desc 154', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '154'), ('155', 'product 155', 'CYIT34-155', '25', 'spec 155', 'desc 155', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '155'), ('156', 'product 156', 'CYIT34-156', '26', 'spec 156', 'desc 156', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '156'), ('157', 'product 157', 'CYIT34-157', '27', 'spec 157', 'desc 157', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '157'), ('158', 'product 158', 'CYIT34-158', '28', 'spec 158', 'desc 158', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '158'), ('159', 'product 159', 'CYIT34-159', '29', 'spec 159', 'desc 159', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '159'), ('160', 'product 160', 'CYIT34-160', '30', 'spec 160', 'desc 160', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '160'), ('161', 'product 161', 'CYIT34-161', '31', 'spec 161', 'desc 161', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '161'), ('162', 'product 162', 'CYIT34-162', '32', 'spec 162', 'desc 162', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '162'), ('163', 'product 163', 'CYIT34-163', '33', 'spec 163', 'desc 163', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '163'), ('164', 'product 164', 'CYIT34-164', '34', 'spec 164', 'desc 164', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '164'), ('165', 'product 165', 'CYIT34-165', '35', 'spec 165', 'desc 165', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '165'), ('166', 'product 166', 'CYIT34-166', '36', 'spec 166', 'desc 166', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '166'), ('167', 'product 167', 'CYIT34-167', '37', 'spec 167', 'desc 167', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '167'), ('168', 'product 168', 'CYIT34-168', '38', 'spec 168', 'desc 168', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '168'), ('169', 'product 169', 'CYIT34-169', '39', 'spec 169', 'desc 169', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '169'), ('170', 'product 170', 'CYIT34-170', '40', 'spec 170', 'desc 170', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '170'), ('171', 'product 171', 'CYIT34-171', '41', 'spec 171', 'desc 171', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '171'), ('172', 'product 172', 'CYIT34-172', '42', 'spec 172', 'desc 172', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '172'), ('173', 'product 173', 'CYIT34-173', '43', 'spec 173', 'desc 173', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '173'), ('174', 'product 174', 'CYIT34-174', '44', 'spec 174', 'desc 174', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '174'), ('175', 'product 175', 'CYIT34-175', '45', 'spec 175', 'desc 175', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '175'), ('176', 'product 176', 'CYIT34-176', '46', 'spec 176', 'desc 176', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '176'), ('177', 'product 177', 'CYIT34-177', '47', 'spec 177', 'desc 177', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '177'), ('178', 'product 178', 'CYIT34-178', '48', 'spec 178', 'desc 178', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '178'), ('179', 'product 179', 'CYIT34-179', '49', 'spec 179', 'desc 179', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '179'), ('180', 'product 180', 'CYIT34-180', '50', 'spec 180', 'desc 180', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '180'), ('181', 'product 181', 'CYIT34-181', '51', 'spec 181', 'desc 181', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '181'), ('182', 'product 182', 'CYIT34-182', '52', 'spec 182', 'desc 182', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '182'), ('183', 'product 183', 'CYIT34-183', '53', 'spec 183', 'desc 183', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '183'), ('184', 'product 184', 'CYIT34-184', '54', 'spec 184', 'desc 184', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '184'), ('185', 'product 185', 'CYIT34-185', '55', 'spec 185', 'desc 185', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '185'), ('186', 'product 186', 'CYIT34-186', '56', 'spec 186', 'desc 186', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '186'), ('187', 'product 187', 'CYIT34-187', '57', 'spec 187', 'desc 187', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '187'), ('188', 'product 188', 'CYIT34-188', '58', 'spec 188', 'desc 188', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '188'), ('189', 'product 189', 'CYIT34-189', '59', 'spec 189', 'desc 189', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '189'), ('190', 'product 190', 'CYIT34-190', '60', 'spec 190', 'desc 190', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '190'), ('191', 'product 191', 'CYIT34-191', '61', 'spec 191', 'desc 191', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '191'), ('192', 'product 192', 'CYIT34-192', '62', 'spec 192', 'desc 192', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '192'), ('193', 'product 193', 'CYIT34-193', '63', 'spec 193', 'desc 193', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '193'), ('194', 'product 194', 'CYIT34-194', '64', 'spec 194', 'desc 194', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '194'), ('195', 'product 195', 'CYIT34-195', '65', 'spec 195', 'desc 195', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '195'), ('196', 'product 196', 'CYIT34-196', '66', 'spec 196', 'desc 196', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '196'), ('197', 'product 197', 'CYIT34-197', '67', 'spec 197', 'desc 197', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '197'), ('198', 'product 198', 'CYIT34-198', '68', 'spec 198', 'desc 198', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '198'), ('199', 'product 199', 'CYIT34-199', '69', 'spec 199', 'desc 199', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '199'), ('200', 'product 200', 'CYIT34-200', '70', 'spec 200', 'desc 200', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '200');
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
-- Table structure for product_delivery_time
-- ----------------------------
DROP TABLE IF EXISTS `product_delivery_time`;
CREATE TABLE `product_delivery_time` (
`productDeliveryTimeId`  int(11) NOT NULL AUTO_INCREMENT ,
`productDeliveryTimeMin`  int(11) NULL DEFAULT NULL ,
`productDeliveryTimeMax`  int(11) NULL DEFAULT NULL ,
`productDeliveryTimeTypeId`  int(11) NULL DEFAULT NULL ,
`productId`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`productDeliveryTimeId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=201

;

-- ----------------------------
-- Records of product_delivery_time
-- ----------------------------
BEGIN;
INSERT INTO `product_delivery_time` VALUES ('1', '1', '2', '1', '1'), ('2', '1', '3', '1', '2'), ('3', '1', '4', '1', '3'), ('4', '1', '5', '1', '4'), ('5', '1', '6', '1', '5'), ('6', '1', '7', '1', '6'), ('7', '1', '8', '1', '7'), ('8', '1', '9', '1', '8'), ('9', '1', '10', '1', '9'), ('10', '1', '11', '1', '10'), ('11', '1', '12', '1', '11'), ('12', '1', '13', '1', '12'), ('13', '1', '14', '1', '13'), ('14', '1', '15', '1', '14'), ('15', '1', '16', '1', '15'), ('16', '1', '17', '1', '16'), ('17', '1', '1', '1', '17'), ('18', '1', '2', '1', '18'), ('19', '1', '3', '1', '19'), ('20', '1', '4', '2', '20'), ('21', '1', '5', '2', '21'), ('22', '1', '6', '2', '22'), ('23', '1', '7', '2', '23'), ('24', '1', '8', '2', '24'), ('25', '1', '9', '2', '25'), ('26', '1', '10', '2', '26'), ('27', '1', '11', '2', '27'), ('28', '1', '12', '2', '28'), ('29', '1', '13', '2', '29'), ('30', '1', '14', '2', '30'), ('31', '1', '15', '2', '31'), ('32', '1', '16', '2', '32'), ('33', '1', '17', '2', '33'), ('34', '1', '18', '2', '34'), ('35', '1', '19', '2', '35'), ('36', '1', '20', '2', '36'), ('37', '1', '21', '2', '37'), ('38', '1', '22', '2', '38'), ('39', '1', '23', '2', '39'), ('40', '1', '24', '3', '40'), ('41', '1', '25', '3', '41'), ('42', '1', '26', '3', '42'), ('43', '1', '27', '3', '43'), ('44', '1', '28', '3', '44'), ('45', '1', '29', '3', '45'), ('46', '1', '30', '3', '46'), ('47', '1', '31', '3', '47'), ('48', '1', '32', '3', '48'), ('49', '1', '33', '3', '49'), ('50', '1', '34', '3', '50'), ('51', '1', '35', '3', '51'), ('52', '1', '36', '3', '52'), ('53', '1', '37', '3', '53'), ('54', '1', '38', '3', '54'), ('55', '1', '39', '3', '55'), ('56', '1', '40', '3', '56'), ('57', '1', '41', '3', '57'), ('58', '1', '42', '3', '58'), ('59', '1', '43', '3', '59'), ('60', '1', '44', '1', '60'), ('61', '1', '45', '1', '61'), ('62', '1', '46', '1', '62'), ('63', '1', '47', '1', '63'), ('64', '1', '48', '1', '64'), ('65', '1', '49', '1', '65'), ('66', '1', '3', '1', '66'), ('67', '1', '4', '1', '67'), ('68', '1', '5', '1', '68'), ('69', '1', '6', '1', '69'), ('70', '1', '7', '1', '70'), ('71', '1', '8', '1', '71'), ('72', '1', '9', '1', '72'), ('73', '1', '10', '1', '73'), ('74', '1', '11', '1', '74'), ('75', '1', '12', '1', '75'), ('76', '1', '13', '1', '76'), ('77', '1', '14', '1', '77'), ('78', '1', '15', '1', '78'), ('79', '1', '16', '2', '79'), ('80', '1', '17', '2', '80'), ('81', '1', '18', '2', '81'), ('82', '1', '19', '2', '82'), ('83', '1', '20', '2', '83'), ('84', '1', '21', '2', '84'), ('85', '1', '22', '2', '85'), ('86', '1', '23', '2', '86'), ('87', '1', '24', '2', '87'), ('88', '1', '25', '2', '88'), ('89', '1', '26', '2', '89'), ('90', '1', '27', '2', '90'), ('91', '1', '28', '2', '91'), ('92', '1', '29', '2', '92'), ('93', '1', '30', '2', '93'), ('94', '1', '31', '2', '94'), ('95', '1', '32', '2', '95'), ('96', '1', '33', '2', '96'), ('97', '1', '34', '2', '97'), ('98', '1', '35', '2', '98'), ('99', '1', '36', '3', '99'), ('100', '1', '3', '3', '100');
INSERT INTO `product_delivery_time` VALUES ('101', '1', '4', '3', '101'), ('102', '1', '5', '3', '102'), ('103', '1', '6', '3', '103'), ('104', '1', '7', '3', '104'), ('105', '1', '8', '3', '105'), ('106', '1', '9', '3', '106'), ('107', '1', '10', '3', '107'), ('108', '1', '11', '3', '108'), ('109', '1', '12', '3', '109'), ('110', '1', '13', '3', '110'), ('111', '1', '14', '3', '111'), ('112', '1', '15', '3', '112'), ('113', '1', '16', '3', '113'), ('114', '1', '17', '3', '114'), ('115', '1', '18', '3', '115'), ('116', '1', '19', '3', '116'), ('117', '1', '20', '3', '117'), ('118', '1', '21', '3', '118'), ('119', '1', '22', '1', '119'), ('120', '1', '23', '1', '120'), ('121', '1', '24', '1', '121'), ('122', '1', '25', '1', '122'), ('123', '1', '26', '1', '123'), ('124', '1', '27', '1', '124'), ('125', '1', '28', '1', '125'), ('126', '1', '29', '1', '126'), ('127', '1', '30', '1', '127'), ('128', '1', '31', '1', '128'), ('129', '1', '32', '1', '129'), ('130', '1', '33', '1', '130'), ('131', '1', '34', '1', '131'), ('132', '1', '35', '1', '132'), ('133', '1', '36', '1', '133'), ('134', '1', '37', '1', '134'), ('135', '1', '38', '1', '135'), ('136', '1', '39', '1', '136'), ('137', '1', '40', '1', '137'), ('138', '1', '41', '2', '138'), ('139', '1', '42', '2', '139'), ('140', '1', '43', '2', '140'), ('141', '1', '44', '2', '141'), ('142', '1', '45', '2', '142'), ('143', '1', '46', '2', '143'), ('144', '1', '47', '2', '144'), ('145', '1', '48', '2', '145'), ('146', '1', '49', '2', '146'), ('147', '1', '50', '2', '147'), ('148', '1', '51', '2', '148'), ('149', '1', '52', '2', '149'), ('150', '1', '53', '2', '150'), ('151', '1', '54', '2', '151'), ('152', '1', '3', '2', '152'), ('153', '1', '4', '2', '153'), ('154', '1', '5', '2', '154'), ('155', '1', '6', '2', '155'), ('156', '1', '7', '2', '156'), ('157', '1', '8', '2', '157'), ('158', '1', '9', '3', '158'), ('159', '1', '10', '3', '159'), ('160', '1', '11', '3', '160'), ('161', '1', '12', '3', '161'), ('162', '1', '13', '3', '162'), ('163', '1', '14', '3', '163'), ('164', '1', '15', '3', '164'), ('165', '1', '16', '3', '165'), ('166', '1', '17', '3', '166'), ('167', '1', '18', '3', '167'), ('168', '1', '19', '3', '168'), ('169', '1', '20', '3', '169'), ('170', '1', '21', '3', '170'), ('171', '1', '22', '1', '171'), ('172', '1', '23', '1', '172'), ('173', '1', '24', '1', '173'), ('174', '1', '25', '1', '174'), ('175', '1', '26', '1', '175'), ('176', '1', '27', '1', '176'), ('177', '1', '28', '1', '177'), ('178', '1', '29', '1', '178'), ('179', '1', '30', '1', '179'), ('180', '1', '31', '1', '180'), ('181', '1', '32', '1', '181'), ('182', '1', '33', '1', '182'), ('183', '1', '34', '1', '183'), ('184', '1', '35', '1', '184'), ('185', '1', '36', '1', '185'), ('186', '1', '37', '1', '186'), ('187', '1', '38', '1', '187'), ('188', '1', '39', '1', '188'), ('189', '1', '40', '1', '189'), ('190', '1', '41', '2', '190'), ('191', '1', '42', '2', '191'), ('192', '1', '43', '2', '192'), ('193', '1', '44', '2', '193'), ('194', '1', '45', '2', '194'), ('195', '1', '46', '2', '195'), ('196', '1', '47', '2', '196'), ('197', '1', '48', '2', '197'), ('198', '1', '49', '2', '198'), ('199', '1', '50', '2', '199'), ('200', '1', '51', '2', '200');
COMMIT;

-- ----------------------------
-- Table structure for product_delivery_time_type
-- ----------------------------
DROP TABLE IF EXISTS `product_delivery_time_type`;
CREATE TABLE `product_delivery_time_type` (
`productDeliveryTimeTypeId`  int(11) NOT NULL AUTO_INCREMENT ,
`productDeliveryTImeType`  varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`productDeliveryTimeValue`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`productDeliveryTimeTypeId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of product_delivery_time_type
-- ----------------------------
BEGIN;
INSERT INTO `product_delivery_time_type` VALUES ('1', 'leadtime', '0'), ('2', 'indent', '90'), ('3', 'advice', '180');
COMMIT;

-- ----------------------------
-- Table structure for product_price
-- ----------------------------
DROP TABLE IF EXISTS `product_price`;
CREATE TABLE `product_price` (
`productPriceId`  int(11) NOT NULL AUTO_INCREMENT ,
`productId`  int(11) NULL DEFAULT NULL ,
`productOriginalPrice`  varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`productDiscountPrice`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`productSpecialPriceOne`  varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`productSpecialPriceTwo`  varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`productSpecialPriceThree`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`productPriceId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=201

;

-- ----------------------------
-- Records of product_price
-- ----------------------------
BEGIN;
INSERT INTO `product_price` VALUES ('1', '1', '4000', '2000', '3000', '3300', '3700'), ('2', '2', '4001', '2001', '3001', '3301', '3701'), ('3', '3', '4002', '2002', '3002', '3302', '3702'), ('4', '4', '4003', '2003', '3003', '3303', '3703'), ('5', '5', '4004', '2004', '3004', '3304', '3704'), ('6', '6', '4005', '2005', '3005', '3305', '3705'), ('7', '7', '4006', '2006', '3006', '3306', '3706'), ('8', '8', '4007', '2007', '3007', '3307', '3707'), ('9', '9', '4008', '2008', '3008', '3308', '3708'), ('10', '10', '4009', '2009', '3009', '3309', '3709'), ('11', '11', '4010', '2010', '3010', '3310', '3710'), ('12', '12', '4011', '2011', '3011', '3311', '3711'), ('13', '13', '4012', '2012', '3012', '3312', '3712'), ('14', '14', '4013', '2013', '3013', '3313', '3713'), ('15', '15', '4014', '2014', '3014', '3314', '3714'), ('16', '16', '4015', '2015', '3015', '3315', '3715'), ('17', '17', '4016', '2016', '3016', '3316', '3716'), ('18', '18', '4017', '2017', '3017', '3317', '3717'), ('19', '19', '4018', '2018', '3018', '3318', '3718'), ('20', '20', '4019', '2019', '3019', '3319', '3719'), ('21', '21', '4020', '2020', '3020', '3320', '3720'), ('22', '22', '4021', '2021', '3021', '3321', '3721'), ('23', '23', '4022', '2022', '3022', '3322', '3722'), ('24', '24', '4023', '2023', '3023', '3323', '3723'), ('25', '25', '4024', '2024', '3024', '3324', '3724'), ('26', '26', '4025', '2025', '3025', '3325', '3725'), ('27', '27', '4026', '2026', '3026', '3326', '3726'), ('28', '28', '4027', '2027', '3027', '3327', '3727'), ('29', '29', '4028', '2028', '3028', '3328', '3728'), ('30', '30', '4029', '2029', '3029', '3329', '3729'), ('31', '31', '4030', '2030', '3030', '3330', '3730'), ('32', '32', '4031', '2031', '3031', '3331', '3731'), ('33', '33', '4032', '2032', '3032', '3332', '3732'), ('34', '34', '4033', '2033', '3033', '3333', '3733'), ('35', '35', '4034', '2034', '3034', '3334', '3734'), ('36', '36', '4035', '2035', '3035', '3335', '3735'), ('37', '37', '4036', '2036', '3036', '3336', '3736'), ('38', '38', '4037', '2037', '3037', '3337', '3737'), ('39', '39', '4038', '2038', '3038', '3338', '3738'), ('40', '40', '4039', '2039', '3039', '3339', '3739'), ('41', '41', '4040', '2040', '3040', '3340', '3740'), ('42', '42', '4041', '2041', '3041', '3341', '3741'), ('43', '43', '4042', '2042', '3042', '3342', '3742'), ('44', '44', '4043', '2043', '3043', '3343', '3743'), ('45', '45', '4044', '2044', '3044', '3344', '3744'), ('46', '46', '4045', '2045', '3045', '3345', '3745'), ('47', '47', '4046', '2046', '3046', '3346', '3746'), ('48', '48', '4047', '2047', '3047', '3347', '3747'), ('49', '49', '4048', '2048', '3048', '3348', '3748'), ('50', '50', '4049', '2049', '3049', '3349', '3749'), ('51', '51', '4050', '2050', '3050', '3350', '3750'), ('52', '52', '4051', '2051', '3051', '3351', '3751'), ('53', '53', '4052', '2052', '3052', '3352', '3752'), ('54', '54', '4053', '2053', '3053', '3353', '3753'), ('55', '55', '4054', '2054', '3054', '3354', '3754'), ('56', '56', '4055', '2055', '3055', '3355', '3755'), ('57', '57', '4056', '2056', '3056', '3356', '3756'), ('58', '58', '4057', '2057', '3057', '3357', '3757'), ('59', '59', '4058', '2058', '3058', '3358', '3758'), ('60', '60', '4059', '2059', '3059', '3359', '3759'), ('61', '61', '4060', '2060', '3060', '3360', '3760'), ('62', '62', '4061', '2061', '3061', '3361', '3761'), ('63', '63', '4062', '2062', '3062', '3362', '3762'), ('64', '64', '4063', '2063', '3063', '3363', '3763'), ('65', '65', '4064', '2064', '3064', '3364', '3764'), ('66', '66', '4065', '2065', '3065', '3365', '3765'), ('67', '67', '4066', '2066', '3066', '3366', '3766'), ('68', '68', '4067', '2067', '3067', '3367', '3767'), ('69', '69', '4068', '2068', '3068', '3368', '3768'), ('70', '70', '4069', '2069', '3069', '3369', '3769'), ('71', '71', '4070', '2070', '3070', '3370', '3770'), ('72', '72', '4071', '2071', '3071', '3371', '3771'), ('73', '73', '4072', '2072', '3072', '3372', '3772'), ('74', '74', '4073', '2073', '3073', '3373', '3773'), ('75', '75', '4074', '2074', '3074', '3374', '3774'), ('76', '76', '4075', '2075', '3075', '3375', '3775'), ('77', '77', '4076', '2076', '3076', '3376', '3776'), ('78', '78', '4077', '2077', '3077', '3377', '3777'), ('79', '79', '4078', '2078', '3078', '3378', '3778'), ('80', '80', '4079', '2079', '3079', '3379', '3779'), ('81', '81', '4080', '2080', '3080', '3380', '3780'), ('82', '82', '4081', '2081', '3081', '3381', '3781'), ('83', '83', '4082', '2082', '3082', '3382', '3782'), ('84', '84', '4083', '2083', '3083', '3383', '3783'), ('85', '85', '4084', '2084', '3084', '3384', '3784'), ('86', '86', '4085', '2085', '3085', '3385', '3785'), ('87', '87', '4086', '2086', '3086', '3386', '3786'), ('88', '88', '4087', '2087', '3087', '3387', '3787'), ('89', '89', '4088', '2088', '3088', '3388', '3788'), ('90', '90', '4089', '2089', '3089', '3389', '3789'), ('91', '91', '4090', '2090', '3090', '3390', '3790'), ('92', '92', '4091', '2091', '3091', '3391', '3791'), ('93', '93', '4092', '2092', '3092', '3392', '3792'), ('94', '94', '4093', '2093', '3093', '3393', '3793'), ('95', '95', '4094', '2094', '3094', '3394', '3794'), ('96', '96', '4095', '2095', '3095', '3395', '3795'), ('97', '97', '4096', '2096', '3096', '3396', '3796'), ('98', '98', '4097', '2097', '3097', '3397', '3797'), ('99', '99', '4098', '2098', '3098', '3398', '3798'), ('100', '100', '4099', '2099', '3099', '3399', '3799');
INSERT INTO `product_price` VALUES ('101', '101', '4100', '2100', '3100', '3400', '3800'), ('102', '102', '4101', '2101', '3101', '3401', '3801'), ('103', '103', '4102', '2102', '3102', '3402', '3802'), ('104', '104', '4103', '2103', '3103', '3403', '3803'), ('105', '105', '4104', '2104', '3104', '3404', '3804'), ('106', '106', '4105', '2105', '3105', '3405', '3805'), ('107', '107', '4106', '2106', '3106', '3406', '3806'), ('108', '108', '4107', '2107', '3107', '3407', '3807'), ('109', '109', '4108', '2108', '3108', '3408', '3808'), ('110', '110', '4109', '2109', '3109', '3409', '3809'), ('111', '111', '4110', '2110', '3110', '3410', '3810'), ('112', '112', '4111', '2111', '3111', '3411', '3811'), ('113', '113', '4112', '2112', '3112', '3412', '3812'), ('114', '114', '4113', '2113', '3113', '3413', '3813'), ('115', '115', '4114', '2114', '3114', '3414', '3814'), ('116', '116', '4115', '2115', '3115', '3415', '3815'), ('117', '117', '4116', '2116', '3116', '3416', '3816'), ('118', '118', '4117', '2117', '3117', '3417', '3817'), ('119', '119', '4118', '2118', '3118', '3418', '3818'), ('120', '120', '4119', '2119', '3119', '3419', '3819'), ('121', '121', '4120', '2120', '3120', '3420', '3820'), ('122', '122', '4121', '2121', '3121', '3421', '3821'), ('123', '123', '4122', '2122', '3122', '3422', '3822'), ('124', '124', '4123', '2123', '3123', '3423', '3823'), ('125', '125', '4124', '2124', '3124', '3424', '3824'), ('126', '126', '4125', '2125', '3125', '3425', '3825'), ('127', '127', '4126', '2126', '3126', '3426', '3826'), ('128', '128', '4127', '2127', '3127', '3427', '3827'), ('129', '129', '4128', '2128', '3128', '3428', '3828'), ('130', '130', '4129', '2129', '3129', '3429', '3829'), ('131', '131', '4130', '2130', '3130', '3430', '3830'), ('132', '132', '4131', '2131', '3131', '3431', '3831'), ('133', '133', '4132', '2132', '3132', '3432', '3832'), ('134', '134', '4133', '2133', '3133', '3433', '3833'), ('135', '135', '4134', '2134', '3134', '3434', '3834'), ('136', '136', '4135', '2135', '3135', '3435', '3835'), ('137', '137', '4136', '2136', '3136', '3436', '3836'), ('138', '138', '4137', '2137', '3137', '3437', '3837'), ('139', '139', '4138', '2138', '3138', '3438', '3838'), ('140', '140', '4139', '2139', '3139', '3439', '3839'), ('141', '141', '4140', '2140', '3140', '3440', '3840'), ('142', '142', '4141', '2141', '3141', '3441', '3841'), ('143', '143', '4142', '2142', '3142', '3442', '3842'), ('144', '144', '4143', '2143', '3143', '3443', '3843'), ('145', '145', '4144', '2144', '3144', '3444', '3844'), ('146', '146', '4145', '2145', '3145', '3445', '3845'), ('147', '147', '4146', '2146', '3146', '3446', '3846'), ('148', '148', '4147', '2147', '3147', '3447', '3847'), ('149', '149', '4148', '2148', '3148', '3448', '3848'), ('150', '150', '4149', '2149', '3149', '3449', '3849'), ('151', '151', '4150', '2150', '3150', '3450', '3850'), ('152', '152', '4151', '2151', '3151', '3451', '3851'), ('153', '153', '4152', '2152', '3152', '3452', '3852'), ('154', '154', '4153', '2153', '3153', '3453', '3853'), ('155', '155', '4154', '2154', '3154', '3454', '3854'), ('156', '156', '4155', '2155', '3155', '3455', '3855'), ('157', '157', '4156', '2156', '3156', '3456', '3856'), ('158', '158', '4157', '2157', '3157', '3457', '3857'), ('159', '159', '4158', '2158', '3158', '3458', '3858'), ('160', '160', '4159', '2159', '3159', '3459', '3859'), ('161', '161', '4160', '2160', '3160', '3460', '3860'), ('162', '162', '4161', '2161', '3161', '3461', '3861'), ('163', '163', '4162', '2162', '3162', '3462', '3862'), ('164', '164', '4163', '2163', '3163', '3463', '3863'), ('165', '165', '4164', '2164', '3164', '3464', '3864'), ('166', '166', '4165', '2165', '3165', '3465', '3865'), ('167', '167', '4166', '2166', '3166', '3466', '3866'), ('168', '168', '4167', '2167', '3167', '3467', '3867'), ('169', '169', '4168', '2168', '3168', '3468', '3868'), ('170', '170', '4169', '2169', '3169', '3469', '3869'), ('171', '171', '4170', '2170', '3170', '3470', '3870'), ('172', '172', '4171', '2171', '3171', '3471', '3871'), ('173', '173', '4172', '2172', '3172', '3472', '3872'), ('174', '174', '4173', '2173', '3173', '3473', '3873'), ('175', '175', '4174', '2174', '3174', '3474', '3874'), ('176', '176', '4175', '2175', '3175', '3475', '3875'), ('177', '177', '4176', '2176', '3176', '3476', '3876'), ('178', '178', '4177', '2177', '3177', '3477', '3877'), ('179', '179', '4178', '2178', '3178', '3478', '3878'), ('180', '180', '4179', '2179', '3179', '3479', '3879'), ('181', '181', '4180', '2180', '3180', '3480', '3880'), ('182', '182', '4181', '2181', '3181', '3481', '3881'), ('183', '183', '4182', '2182', '3182', '3482', '3882'), ('184', '184', '4183', '2183', '3183', '3483', '3883'), ('185', '185', '4184', '2184', '3184', '3484', '3884'), ('186', '186', '4185', '2185', '3185', '3485', '3885'), ('187', '187', '4186', '2186', '3186', '3486', '3886'), ('188', '188', '4187', '2187', '3187', '3487', '3887'), ('189', '189', '4188', '2188', '3188', '3488', '3888'), ('190', '190', '4189', '2189', '3189', '3489', '3889'), ('191', '191', '4190', '2190', '3190', '3490', '3890'), ('192', '192', '4191', '2191', '3191', '3491', '3891'), ('193', '193', '4192', '2192', '3192', '3492', '3892'), ('194', '194', '4193', '2193', '3193', '3493', '3893'), ('195', '195', '4194', '2194', '3194', '3494', '3894'), ('196', '196', '4195', '2195', '3195', '3495', '3895'), ('197', '197', '4196', '2196', '3196', '3496', '3896'), ('198', '198', '4197', '2197', '3197', '3497', '3897'), ('199', '199', '4198', '2198', '3198', '3498', '3898'), ('200', '200', '4199', '2199', '3199', '3499', '3899');
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
INSERT INTO `product_top` VALUES ('1', '0', '2'), ('2', '45', '76'), ('3', '0', '3'), ('4', '234', '12'), ('5', '657', '876'), ('8', '765', '67'), ('11', '0', '3'), ('21', '432', '768'), ('23', '756', '453'), ('45', '574', '432'), ('87', '543', '324'), ('110', '0', '43'), ('111', '0', '3'), ('200', '543', '432');
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
-- Auto increment value for cart
-- ----------------------------
ALTER TABLE `cart` AUTO_INCREMENT=22;

-- ----------------------------
-- Auto increment value for cart_item
-- ----------------------------
ALTER TABLE `cart_item` AUTO_INCREMENT=23;

-- ----------------------------
-- Auto increment value for contact_form
-- ----------------------------
ALTER TABLE `contact_form` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for customer_address
-- ----------------------------
ALTER TABLE `customer_address` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for customer_data_kredit
-- ----------------------------
ALTER TABLE `customer_data_kredit` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for customer_data_kredit_status
-- ----------------------------
ALTER TABLE `customer_data_kredit_status` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for customer_forgot_password
-- ----------------------------
ALTER TABLE `customer_forgot_password` AUTO_INCREMENT=11;

-- ----------------------------
-- Auto increment value for customer_inquiry
-- ----------------------------
ALTER TABLE `customer_inquiry` AUTO_INCREMENT=9;

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
-- Auto increment value for product_delivery_time
-- ----------------------------
ALTER TABLE `product_delivery_time` AUTO_INCREMENT=201;

-- ----------------------------
-- Auto increment value for product_delivery_time_type
-- ----------------------------
ALTER TABLE `product_delivery_time_type` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for product_price
-- ----------------------------
ALTER TABLE `product_price` AUTO_INCREMENT=201;

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
