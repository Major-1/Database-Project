#create schema for the database:

CREATE SCHEMA `Gradebook` ;


#create tables needed for the database 

CREATE TABLE `Gradebook`.`STUDENT` (
    `FirstName` varchar(255) DEFAULT NULL,
    `LastName` varchar(255) DEFAULT NULL,
    `Major` varchar(255) DEFAULT NULL,
    `StudentID` int UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`StudentID`)
);