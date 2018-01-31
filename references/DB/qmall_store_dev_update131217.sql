/*
Navicat MySQL Data Transfer

Source Server         : MYSQL LOCALHOST
Source Server Version : 100126
Source Host           : localhost:3306
Source Database       : qmall_store_dev

Target Server Type    : MYSQL
Target Server Version : 100126
File Encoding         : 65001

Date: 2017-12-13 16:52:55
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
AUTO_INCREMENT=29

;

-- ----------------------------
-- Records of cart
-- ----------------------------
BEGIN;
INSERT INTO `cart` VALUES ('26', '2017-11-27 15:10:40', '2017-11-27 15:10:40', 'test@gmail.com', 'finish'), ('27', '2017-11-27 15:12:45', '2017-11-27 15:12:45', 'test@gmail.com', 'expired'), ('28', '2017-11-27 15:12:46', '2017-12-27 15:12:46', 'test@gmail.com', 'active');
COMMIT;

-- ----------------------------
-- Table structure for cart_item
-- ----------------------------
DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE `cart_item` (
`cartItemId`  int(11) NOT NULL AUTO_INCREMENT ,
`cartId`  int(11) NULL DEFAULT NULL ,
`productId`  int(11) NULL DEFAULT NULL ,
`cartItemProductWeight`  double NULL DEFAULT NULL ,
`cartItemProductPrice`  double(20,0) NULL DEFAULT NULL ,
`cartItemProductPriceType`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`cartItemProductPriceStatus`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`cartItemQuantity`  int(5) NULL DEFAULT NULL ,
`cartItemTotalProductWeight`  double NULL DEFAULT NULL ,
`cartItemTotalPrice`  int(20) NULL DEFAULT NULL ,
PRIMARY KEY (`cartItemId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=35

;

-- ----------------------------
-- Records of cart_item
-- ----------------------------
BEGIN;
INSERT INTO `cart_item` VALUES ('29', '26', '23', '12', '2000', 'ORIGINAL', 'ACTIVE', '11', '132', '22000'), ('30', '27', '23', '1.5', '2000', 'ORIGINAL', 'ACTIVE', '11', '16.5', '22000'), ('31', '27', '2', '1.5', '2000', 'ORIGINAL', 'ACTIVE', '11', '16.5', '22000'), ('32', '28', '2', '3', '40000', 'ORIGINAL', 'ACTIVE', '1', '16.5', '22000'), ('33', '28', '23', '3', '40000', 'ORIGINAL', 'ACTIVE', '1', '16.5', '22000'), ('34', '28', '3', '3', '40000', 'ORIGINAL', 'ACTIVE', '1', '16.5', '22000');
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
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of contact_form
-- ----------------------------
BEGIN;
INSERT INTO `contact_form` VALUES ('1', 'u', 'dsfsd', '     dsf', 'hgdh', 'hdfh', 'hfdh', 'hfdh', 'hgf'), ('2', 'u', 'dsfsd', '     dsf', 'hgdh', 'hdfh', 'hfdh', 'hfdh', 'hgf'), ('3', 'u', 'dsfsd', '     dsf', 'hgdh', 'hdfh', 'hfdh', 'hfdh', 'hgf');
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
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of faq
-- ----------------------------
BEGIN;
INSERT INTO `faq` VALUES ('1', 'Question 1', 'Answer 1', 'Title FAQ', '10', '27'), ('2', '2', null, null, '0', '0');
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
AUTO_INCREMENT=7

;

-- ----------------------------
-- Records of newsletter_subcribe
-- ----------------------------
BEGIN;
INSERT INTO `newsletter_subcribe` VALUES ('1', 'caliandrat9@gmail.com'), ('2', 'caliandratrinanda@gmail.com'), ('3', 'ctrinanda@gmail.com'), ('4', 'jinothanloi@gmail.com'), ('5', 'caltrinanda@gmail.com'), ('6', 'adadsad');
COMMIT;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
`orderId`  int(11) NOT NULL AUTO_INCREMENT ,
`cartId`  int(11) NULL DEFAULT NULL ,
`orderTime`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`orderExpiredTime`  timestamp NULL DEFAULT NULL ,
`orderProductWeightFull`  double NULL DEFAULT NULL ,
`orderProductPriceFull`  int(25) NULL DEFAULT NULL ,
`orderStatusId`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`orderId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=9

;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
INSERT INTO `order` VALUES ('8', '28', '2017-11-30 15:27:15', '2017-11-30 18:27:15', '49.5', '66000', '2');
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
-- Table structure for order_customer_information
-- ----------------------------
DROP TABLE IF EXISTS `order_customer_information`;
CREATE TABLE `order_customer_information` (
`orderCustomerInformationId`  int(11) NOT NULL AUTO_INCREMENT ,
`orderCustomerName`  varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`orderCustomerJob`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`orderCustomerProvince`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`orderCustomerRegency`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`orderCustomerVillage`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`orderCustomerDistrict`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`orderCustomerAddress`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`orderCustomerInformationId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of order_customer_information
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
`orderPaymentId`  int(11) NOT NULL AUTO_INCREMENT ,
`paymentDate`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`orderId`  int(11) NULL DEFAULT NULL ,
`paymentReferenceId`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`orderPaymentId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of order_payment
-- ----------------------------
BEGIN;
INSERT INTO `order_payment` VALUES ('1', '2017-12-05 13:10:39', '28', '1'), ('2', '2017-12-05 13:18:29', '2', '1'), ('3', '2017-12-06 11:35:09', '1', '1');
COMMIT;

-- ----------------------------
-- Table structure for order_shipment
-- ----------------------------
DROP TABLE IF EXISTS `order_shipment`;
CREATE TABLE `order_shipment` (
`shipmentId`  int(11) NOT NULL AUTO_INCREMENT ,
`orderId`  int(11) NULL DEFAULT NULL ,
`shipmentReferenceId`  int(11) NULL DEFAULT NULL ,
`shipmentTrackingNumber`  int(25) NULL DEFAULT NULL ,
`shipmentPriceItem`  double(75,0) NULL DEFAULT NULL ,
`shipmentFullPrice`  double(10,2) NULL DEFAULT NULL ,
PRIMARY KEY (`shipmentId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of order_shipment
-- ----------------------------
BEGIN;
INSERT INTO `order_shipment` VALUES ('2', '8', '1', null, '120000', '5940000.00');
COMMIT;

-- ----------------------------
-- Table structure for order_status
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
`orderStatusId`  int(11) NOT NULL AUTO_INCREMENT ,
`orderStatusDescription`  varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`orderStatusExplanation`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`orderStatusId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of order_status
-- ----------------------------
BEGIN;
INSERT INTO `order_status` VALUES ('1', 'expired', 'customer cant finish order'), ('2', 'pending', 'customer have 3 hours to finish order'), ('3', 'finish', 'customer succes to finish order');
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
-- Table structure for payment_reference
-- ----------------------------
DROP TABLE IF EXISTS `payment_reference`;
CREATE TABLE `payment_reference` (
`paymentReferenceId`  int(11) NOT NULL AUTO_INCREMENT ,
`paymentMethodDescription`  varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`paymentReferenceId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of payment_reference
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
INSERT INTO `product` VALUES ('1', 'product 1', 'CYIT34-1', '0', 'spec 1', 'desc 1', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '1'), ('2', 'product 2', 'CYIT34-2', '68', 'spec 2', 'desc 2', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '2'), ('3', 'product 3', 'CYIT34-3', '81', 'spec 3', 'desc 3', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '3'), ('4', 'product 4', 'CYIT34-4', '3', 'spec 4', 'desc 4', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '4'), ('5', 'product 5', 'CYIT34-5', '4', 'spec 5', 'desc 5', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '5'), ('6', 'product 6', 'CYIT34-6', '5', 'spec 6', 'desc 6', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '6'), ('7', 'product 7', 'CYIT34-7', '6', 'spec 7', 'desc 7', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '7'), ('8', 'product 8', 'CYIT34-8', '7', 'spec 8', 'desc 8', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '8'), ('9', 'product 9', 'CYIT34-9', '8', 'spec 9', 'desc 9', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '9'), ('10', 'product 10', 'CYIT34-10', '9', 'spec 10', 'desc 10', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '10'), ('11', 'product 11', 'CYIT34-11', '10', 'spec 11', 'desc 11', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '11'), ('12', 'product 12', 'CYIT34-12', '11', 'spec 12', 'desc 12', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '12'), ('13', 'product 13', 'CYIT34-13', '12', 'spec 13', 'desc 13', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '13'), ('14', 'product 14', 'CYIT34-14', '13', 'spec 14', 'desc 14', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '14'), ('15', 'product 15', 'CYIT34-15', '14', 'spec 15', 'desc 15', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '15'), ('16', 'product 16', 'CYIT34-16', '15', 'spec 16', 'desc 16', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '16'), ('17', 'product 17', 'CYIT34-17', '16', 'spec 17', 'desc 17', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '17'), ('18', 'product 18', 'CYIT34-18', '17', 'spec 18', 'desc 18', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '18'), ('19', 'product 19', 'CYIT34-19', '18', 'spec 19', 'desc 19', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '19'), ('20', 'product 20', 'CYIT34-20', '19', 'spec 20', 'desc 20', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '20'), ('21', 'product 21', 'CYIT34-21', '20', 'spec 21', 'desc 21', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '21'), ('22', 'product 22', 'CYIT34-22', '21', 'spec 22', 'desc 22', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '22'), ('23', 'product 23', 'CYIT34-23', '68', 'spec 23', 'desc 23', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '23'), ('24', 'product 24', 'CYIT34-24', '23', 'spec 24', 'desc 24', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '24'), ('25', 'product 25', 'CYIT34-25', '24', 'spec 25', 'desc 25', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '25'), ('26', 'product 26', 'CYIT34-26', '25', 'spec 26', 'desc 26', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '26'), ('27', 'product 27', 'CYIT34-27', '26', 'spec 27', 'desc 27', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '27'), ('28', 'product 28', 'CYIT34-28', '27', 'spec 28', 'desc 28', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '28'), ('29', 'product 29', 'CYIT34-29', '28', 'spec 29', 'desc 29', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '29'), ('30', 'product 30', 'CYIT34-30', '29', 'spec 30', 'desc 30', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '30'), ('31', 'product 31', 'CYIT34-31', '30', 'spec 31', 'desc 31', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '31'), ('32', 'product 32', 'CYIT34-32', '31', 'spec 32', 'desc 32', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '32'), ('33', 'product 33', 'CYIT34-33', '32', 'spec 33', 'desc 33', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '33'), ('34', 'product 34', 'CYIT34-34', '33', 'spec 34', 'desc 34', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '34'), ('35', 'product 35', 'CYIT34-35', '34', 'spec 35', 'desc 35', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '35'), ('36', 'product 36', 'CYIT34-36', '35', 'spec 36', 'desc 36', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '36'), ('37', 'product 37', 'CYIT34-37', '36', 'spec 37', 'desc 37', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '37'), ('38', 'product 38', 'CYIT34-38', '37', 'spec 38', 'desc 38', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '38'), ('39', 'product 39', 'CYIT34-39', '38', 'spec 39', 'desc 39', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '39'), ('40', 'product 40', 'CYIT34-40', '39', 'spec 40', 'desc 40', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '40'), ('41', 'product 41', 'CYIT34-41', '40', 'spec 41', 'desc 41', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '41'), ('42', 'product 42', 'CYIT34-42', '41', 'spec 42', 'desc 42', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '42'), ('43', 'product 43', 'CYIT34-43', '42', 'spec 43', 'desc 43', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '43'), ('44', 'product 44', 'CYIT34-44', '43', 'spec 44', 'desc 44', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '44'), ('45', 'product 45', 'CYIT34-45', '44', 'spec 45', 'desc 45', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '45'), ('46', 'product 46', 'CYIT34-46', '45', 'spec 46', 'desc 46', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '46'), ('47', 'product 47', 'CYIT34-47', '46', 'spec 47', 'desc 47', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '47'), ('48', 'product 48', 'CYIT34-48', '47', 'spec 48', 'desc 48', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '48'), ('49', 'product 49', 'CYIT34-49', '48', 'spec 49', 'desc 49', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '49'), ('50', 'product 50', 'CYIT34-50', '49', 'spec 50', 'desc 50', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '50'), ('51', 'product 51', 'CYIT34-51', '50', 'spec 51', 'desc 51', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '51'), ('52', 'product 52', 'CYIT34-52', '51', 'spec 52', 'desc 52', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '52'), ('53', 'product 53', 'CYIT34-53', '52', 'spec 53', 'desc 53', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '53'), ('54', 'product 54', 'CYIT34-54', '53', 'spec 54', 'desc 54', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '54'), ('55', 'product 55', 'CYIT34-55', '54', 'spec 55', 'desc 55', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '55'), ('56', 'product 56', 'CYIT34-56', '55', 'spec 56', 'desc 56', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '56'), ('57', 'product 57', 'CYIT34-57', '56', 'spec 57', 'desc 57', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '57'), ('58', 'product 58', 'CYIT34-58', '57', 'spec 58', 'desc 58', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '58'), ('59', 'product 59', 'CYIT34-59', '58', 'spec 59', 'desc 59', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '59'), ('60', 'product 60', 'CYIT34-60', '59', 'spec 60', 'desc 60', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '60'), ('61', 'product 61', 'CYIT34-61', '60', 'spec 61', 'desc 61', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '61'), ('62', 'product 62', 'CYIT34-62', '61', 'spec 62', 'desc 62', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '62'), ('63', 'product 63', 'CYIT34-63', '62', 'spec 63', 'desc 63', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '63'), ('64', 'product 64', 'CYIT34-64', '63', 'spec 64', 'desc 64', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '64'), ('65', 'product 65', 'CYIT34-65', '64', 'spec 65', 'desc 65', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '65'), ('66', 'product 66', 'CYIT34-66', '65', 'spec 66', 'desc 66', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '66'), ('67', 'product 67', 'CYIT34-67', '66', 'spec 67', 'desc 67', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '67'), ('68', 'product 68', 'CYIT34-68', '67', 'spec 68', 'desc 68', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '68'), ('69', 'product 69', 'CYIT34-69', '68', 'spec 69', 'desc 69', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '69'), ('70', 'product 70', 'CYIT34-70', '69', 'spec 70', 'desc 70', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '70'), ('71', 'product 71', 'CYIT34-71', '70', 'spec 71', 'desc 71', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '71'), ('72', 'product 72', 'CYIT34-72', '71', 'spec 72', 'desc 72', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '72'), ('73', 'product 73', 'CYIT34-73', '72', 'spec 73', 'desc 73', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '73'), ('74', 'product 74', 'CYIT34-74', '73', 'spec 74', 'desc 74', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '74'), ('75', 'product 75', 'CYIT34-75', '74', 'spec 75', 'desc 75', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '75'), ('76', 'product 76', 'CYIT34-76', '75', 'spec 76', 'desc 76', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '76'), ('77', 'product 77', 'CYIT34-77', '76', 'spec 77', 'desc 77', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '77'), ('78', 'product 78', 'CYIT34-78', '77', 'spec 78', 'desc 78', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '78'), ('79', 'product 79', 'CYIT34-79', '78', 'spec 79', 'desc 79', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '79'), ('80', 'product 80', 'CYIT34-80', '79', 'spec 80', 'desc 80', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '80'), ('81', 'product 81', 'CYIT34-81', '80', 'spec 81', 'desc 81', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '81'), ('82', 'product 82', 'CYIT34-82', '81', 'spec 82', 'desc 82', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '82'), ('83', 'product 83', 'CYIT34-83', '82', 'spec 83', 'desc 83', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '83'), ('84', 'product 84', 'CYIT34-84', '83', 'spec 84', 'desc 84', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '84'), ('85', 'product 85', 'CYIT34-85', '84', 'spec 85', 'desc 85', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '85'), ('86', 'product 86', 'CYIT34-86', '85', 'spec 86', 'desc 86', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '86'), ('87', 'product 87', 'CYIT34-87', '86', 'spec 87', 'desc 87', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '87'), ('88', 'product 88', 'CYIT34-88', '87', 'spec 88', 'desc 88', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '88'), ('89', 'product 89', 'CYIT34-89', '0', 'spec 89', 'desc 89', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '89'), ('90', 'product 90', 'CYIT34-90', '1', 'spec 90', 'desc 90', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '90'), ('91', 'product 91', 'CYIT34-91', '2', 'spec 91', 'desc 91', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '91'), ('92', 'product 92', 'CYIT34-92', '3', 'spec 92', 'desc 92', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '92'), ('93', 'product 93', 'CYIT34-93', '4', 'spec 93', 'desc 93', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '93'), ('94', 'product 94', 'CYIT34-94', '5', 'spec 94', 'desc 94', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '94'), ('95', 'product 95', 'CYIT34-95', '6', 'spec 95', 'desc 95', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '95'), ('96', 'product 96', 'CYIT34-96', '7', 'spec 96', 'desc 96', '3', 'https://www.sistemseiki.com/catalog', '1', '5', '96'), ('97', 'product 97', 'CYIT34-97', '8', 'spec 97', 'desc 97', '3', 'https://www.sistemseiki.com/catalog', '2', '4', '97'), ('98', 'product 98', 'CYIT34-98', '9', 'spec 98', 'desc 98', '3', 'https://www.sistemseiki.com/catalog', '3', '3', '98'), ('99', 'product 99', 'CYIT34-99', '10', 'spec 99', 'desc 99', '3', 'https://www.sistemseiki.com/catalog', '4', '2', '99'), ('100', 'product 100', 'CYIT34-100', '11', 'spec 100', 'desc 100', '3', 'https://www.sistemseiki.com/catalog', '5', '1', '100');
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
`productPrice`  double(25,0) NULL DEFAULT NULL ,
`productId`  int(11) NULL DEFAULT NULL ,
`productPriceType`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`productPriceDisplayStatus`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`productPriceStatus`  varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`productPriceId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=402

;

-- ----------------------------
-- Records of product_price
-- ----------------------------
BEGIN;
INSERT INTO `product_price` VALUES ('1', '40000', '1', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('2', '40000', '2', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('3', '40000', '3', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('4', '40000', '4', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('5', '40000', '5', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('6', '40000', '6', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('7', '40000', '7', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('8', '40000', '8', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('9', '40000', '9', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('10', '40000', '10', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('11', '40000', '11', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('12', '40000', '12', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('13', '40000', '13', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('14', '40000', '14', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('15', '40000', '15', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('16', '40000', '16', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('17', '40000', '17', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('18', '40000', '18', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('19', '40000', '19', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('20', '40000', '20', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('21', '40000', '21', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('22', '40000', '22', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('23', '40000', '23', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('24', '40000', '24', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('25', '40000', '25', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('26', '40000', '26', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('27', '40000', '27', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('28', '40000', '28', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('29', '40000', '29', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('30', '40000', '30', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('31', '40000', '31', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('32', '40000', '32', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('33', '40000', '33', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('34', '40000', '34', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('35', '40000', '35', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('36', '40000', '36', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('37', '40000', '37', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('38', '40000', '38', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('39', '40000', '39', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('40', '40000', '40', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('41', '40000', '41', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('42', '40000', '42', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('43', '40000', '43', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('44', '40000', '44', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('45', '40000', '45', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('46', '40000', '46', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('47', '40000', '47', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('48', '40000', '48', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('49', '40000', '49', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('50', '40000', '50', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('51', '40000', '51', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('52', '40000', '52', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('53', '40000', '53', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('54', '40000', '54', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('55', '40000', '55', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('56', '40000', '56', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('57', '40000', '57', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('58', '40000', '58', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('59', '40000', '59', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('60', '40000', '60', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('61', '40000', '61', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('62', '65000', '62', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('63', '65000', '63', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('64', '65000', '64', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('65', '65000', '65', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('66', '65000', '66', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('67', '65000', '67', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('68', '65000', '68', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('69', '65000', '69', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('70', '65000', '70', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('71', '65000', '71', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('72', '65000', '72', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('73', '65000', '73', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('74', '65000', '74', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('75', '65000', '75', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('76', '65000', '76', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('77', '65000', '77', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('78', '65000', '78', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('79', '65000', '79', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('80', '65000', '80', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('81', '65000', '81', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('82', '65000', '82', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('83', '65000', '83', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('84', '65000', '84', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('85', '65000', '85', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('86', '65000', '86', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('87', '65000', '87', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('88', '65000', '88', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('89', '65000', '89', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('90', '65000', '90', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('91', '65000', '91', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('92', '65000', '92', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('93', '65000', '93', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('94', '65000', '94', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('95', '65000', '95', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('96', '65000', '96', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('97', '65000', '97', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('98', '65000', '98', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('99', '65000', '99', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('100', '65000', '100', 'ORIGINAL', 'SHOW', 'INACTIVE');
INSERT INTO `product_price` VALUES ('101', '65000', '101', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('102', '65000', '102', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('103', '65000', '103', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('104', '65000', '104', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('105', '65000', '105', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('106', '65000', '106', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('107', '65000', '107', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('108', '65000', '108', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('109', '65000', '109', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('110', '65000', '110', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('111', '65000', '111', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('112', '65000', '112', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('113', '65000', '113', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('114', '65000', '114', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('115', '65000', '115', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('116', '65000', '116', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('117', '65000', '117', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('118', '65000', '118', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('119', '65000', '119', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('120', '65000', '120', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('121', '65000', '121', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('122', '65000', '122', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('123', '65000', '123', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('124', '65000', '124', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('125', '65000', '125', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('126', '65000', '126', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('127', '65000', '127', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('128', '65000', '128', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('129', '78700', '129', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('130', '78700', '130', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('131', '78700', '131', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('132', '78700', '132', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('133', '78700', '133', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('134', '78700', '134', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('135', '78700', '135', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('136', '78700', '136', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('137', '78700', '137', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('138', '78700', '138', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('139', '78700', '139', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('140', '78700', '140', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('141', '78700', '141', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('142', '78700', '142', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('143', '78700', '143', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('144', '78700', '144', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('145', '78700', '145', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('146', '78700', '146', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('147', '78700', '147', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('148', '78700', '148', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('149', '78700', '149', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('150', '78700', '150', 'ORIGINAL', 'SHOW', 'ACTIVE'), ('151', '78700', '151', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('152', '78700', '152', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('153', '78700', '153', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('154', '78700', '154', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('155', '78700', '155', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('156', '78700', '156', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('157', '78700', '157', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('158', '78700', '158', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('159', '78700', '159', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('160', '78700', '160', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('161', '78700', '161', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('162', '78700', '162', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('163', '78700', '163', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('164', '78700', '164', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('165', '78700', '165', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('166', '78700', '166', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('167', '78700', '167', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('168', '78700', '168', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('169', '78700', '169', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('170', '78700', '170', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('171', '78700', '171', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('172', '78700', '172', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('173', '78700', '173', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('174', '78700', '174', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('175', '78700', '175', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('176', '78700', '176', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('177', '78700', '177', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('178', '78700', '178', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('179', '78700', '179', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('180', '78700', '180', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('181', '78700', '181', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('182', '78700', '182', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('183', '78700', '183', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('184', '78700', '184', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('185', '78700', '185', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('186', '78700', '186', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('187', '78700', '187', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('188', '78700', '188', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('189', '78700', '189', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('190', '78700', '190', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('191', '78700', '191', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('192', '78700', '192', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('193', '78700', '193', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('194', '78700', '194', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('195', '78700', '195', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('196', '78700', '196', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('197', '78700', '197', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('198', '78700', '198', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('199', '78700', '199', 'ORIGINAL', 'SHOW', 'INACTIVE'), ('200', '78700', '200', 'ORIGINAL', 'SHOW', 'INACTIVE');
INSERT INTO `product_price` VALUES ('201', '78700', '1', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('202', '1', '2', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('203', '1', '3', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('204', '1', '4', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('205', '1', '5', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('206', '1', '6', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('207', '1', '7', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('208', '1', '8', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('209', '1', '9', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('210', '1', '10', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('211', '1', '11', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('212', '1', '12', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('213', '1', '13', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('214', '1', '14', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('215', '1', '15', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('216', '1', '16', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('217', '1', '17', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('218', '1', '18', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('219', '1', '19', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('220', '1', '20', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('221', '1', '21', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('222', '1', '22', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('223', '1', '23', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('224', '1', '24', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('225', '1', '25', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('226', '1', '26', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('227', '1', '27', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('228', '1', '28', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('229', '1', '29', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('230', '1', '30', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('231', '1', '31', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('232', '1', '32', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('233', '1', '33', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('234', '1', '34', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('235', '1', '35', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('236', '1', '36', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('237', '1', '37', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('238', '1', '38', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('239', '1', '39', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('240', '1', '40', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('241', '1', '41', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('242', '1', '42', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('243', '1', '43', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('244', '1', '44', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('245', '1', '45', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('246', '1', '46', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('247', '1', '47', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('248', '1', '48', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('249', '1', '49', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('250', '1', '50', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('251', '1', '51', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('252', '1', '52', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('253', '1', '53', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('254', '1', '54', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('255', '1', '55', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('256', '1', '56', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('257', '1', '57', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('258', '1', '58', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('259', '1', '59', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('260', '1', '60', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('261', '1', '61', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('262', '1', '62', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('263', '1', '63', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('264', '1', '64', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('265', '1', '65', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('266', '1', '66', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('267', '1', '67', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('268', '1', '68', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('269', '1', '69', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('270', '1', '70', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('271', '1', '71', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('272', '1', '72', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('273', '1', '73', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('274', '1', '74', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('275', '1', '75', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('276', '1', '76', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('277', '1', '77', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('278', '1', '78', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('279', '1', '79', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('280', '1', '80', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('281', '1', '81', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('282', '1', '82', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('283', '1', '83', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('284', '1', '84', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('285', '1', '85', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('286', '1', '86', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('287', '1', '87', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('288', '1', '88', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('289', '1', '89', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('290', '1', '90', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('291', '1', '91', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('292', '1', '92', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('293', '1', '93', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('294', '1', '94', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('295', '1', '95', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('296', '1', '96', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('297', '1', '97', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('298', '1', '98', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('299', '1', '99', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('300', '1', '100', 'DISCOUNT', 'SHOW', 'ACTIVE');
INSERT INTO `product_price` VALUES ('301', '1', '101', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('302', '1', '102', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('303', '1', '103', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('304', '1', '104', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('305', '1', '105', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('306', '1', '106', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('307', '1', '107', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('308', '1', '108', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('309', '1', '109', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('310', '1', '110', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('311', '1', '111', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('312', '1', '112', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('313', '1', '113', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('314', '1', '114', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('315', '1', '115', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('316', '1', '116', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('317', '1', '117', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('318', '1', '118', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('319', '1', '119', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('320', '1', '120', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('321', '1', '121', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('322', '1', '122', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('323', '1', '123', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('324', '1', '124', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('325', '1', '125', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('326', '1', '126', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('327', '1', '127', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('328', '1', '128', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('329', '1', '129', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('330', '1', '130', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('331', '1', '131', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('332', '1', '132', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('333', '1', '133', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('334', '1', '134', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('335', '1', '135', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('336', '1', '136', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('337', '1', '137', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('338', '1', '138', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('339', '1', '139', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('340', '1', '140', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('341', '1', '141', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('342', '1', '142', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('343', '1', '143', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('344', '1', '144', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('345', '1', '145', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('346', '1', '146', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('347', '1', '147', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('348', '1', '148', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('349', '1', '149', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('350', '1', '150', 'DISCOUNT', 'SHOW', 'INACTIVE'), ('351', '1', '151', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('352', '1', '152', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('353', '1', '153', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('354', '1', '154', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('355', '1', '155', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('356', '1', '156', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('357', '1', '157', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('358', '1', '158', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('359', '1', '159', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('360', '1', '160', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('361', '1', '161', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('362', '1', '162', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('363', '1', '163', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('364', '1', '164', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('365', '1', '165', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('366', '1', '166', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('367', '1', '167', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('368', '1', '168', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('369', '1', '169', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('370', '1', '170', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('371', '1', '171', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('372', '1', '172', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('373', '1', '173', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('374', '1', '174', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('375', '1', '175', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('376', '1', '176', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('377', '1', '177', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('378', '1', '178', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('379', '1', '179', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('380', '1', '180', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('381', '1', '181', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('382', '1', '182', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('383', '1', '183', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('384', '1', '184', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('385', '1', '185', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('386', '1', '186', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('387', '1', '187', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('388', '1', '188', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('389', '1', '189', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('390', '1', '190', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('391', '1', '191', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('392', '1', '192', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('393', '1', '193', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('394', '1', '194', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('395', '1', '195', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('396', '1', '196', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('397', '1', '197', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('398', '1', '198', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('399', '1', '199', 'DISCOUNT', 'SHOW', 'ACTIVE'), ('400', '1', '200', 'DISCOUNT', 'SHOW', 'ACTIVE');
INSERT INTO `product_price` VALUES ('401', '123', '1', 'SPECIAL', 'SHOW', 'ACTIVE');
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
INSERT INTO `product_top` VALUES ('1', '0', '2'), ('2', '45', '76'), ('3', '0', '3'), ('4', '234', '12'), ('5', '657', '876'), ('8', '765', '67'), ('11', '0', '3'), ('21', '432', '768'), ('23', '756', '453'), ('45', '574', '432'), ('87', '543', '324'), ('110', '0', '1'), ('111', '0', '3'), ('200', '543', '432');
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
-- Table structure for shipment_reference
-- ----------------------------
DROP TABLE IF EXISTS `shipment_reference`;
CREATE TABLE `shipment_reference` (
`shipmentReferenceId`  int(11) NOT NULL AUTO_INCREMENT ,
`shipmentReferenceDetail`  varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`shipmentReference`  varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`shipmentReferenceId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of shipment_reference
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
ALTER TABLE `cart` AUTO_INCREMENT=29;

-- ----------------------------
-- Auto increment value for cart_item
-- ----------------------------
ALTER TABLE `cart_item` AUTO_INCREMENT=35;

-- ----------------------------
-- Auto increment value for contact_form
-- ----------------------------
ALTER TABLE `contact_form` AUTO_INCREMENT=4;

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
ALTER TABLE `faq` AUTO_INCREMENT=3;

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
ALTER TABLE `newsletter_subcribe` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for order
-- ----------------------------
ALTER TABLE `order` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for order_confirmation
-- ----------------------------
ALTER TABLE `order_confirmation` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for order_customer_information
-- ----------------------------
ALTER TABLE `order_customer_information` AUTO_INCREMENT=1;

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
ALTER TABLE `order_payment` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for order_shipment
-- ----------------------------
ALTER TABLE `order_shipment` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for order_status
-- ----------------------------
ALTER TABLE `order_status` AUTO_INCREMENT=4;

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
-- Auto increment value for payment_reference
-- ----------------------------
ALTER TABLE `payment_reference` AUTO_INCREMENT=1;

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
ALTER TABLE `product_price` AUTO_INCREMENT=402;

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

-- ----------------------------
-- Auto increment value for shipment_reference
-- ----------------------------
ALTER TABLE `shipment_reference` AUTO_INCREMENT=1;
