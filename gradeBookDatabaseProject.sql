#CREATE SCHEMA FOR THE DATABASE:

CREATE SCHEMA `Gradebook`;

#CREATE TABLES USED FOR THE DATABASE

 CREATE TABLE `Gradebook`.`STUDENT` (
    `FirstName` varchar(255) DEFAULT NULL,
    `LastName` varchar(255) DEFAULT NULL,
    `Major` varchar(255) DEFAULT NULL,
    `StudentID` int UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`StudentID`)
); 

CREATE TABLE `Gradebook`.`SCORE` (
	`StudentID` int UNSIGNED NOT NULL,
    `AssignmentID` int UNSIGNED NOT NULL,
    `POINTS` int UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`StudentID`, `AssignmentID`)
);

CREATE TABLE `Gradebook`.`ASSIGNMENT` (
    `AssignmentID` int UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    `DistributionID` int UNSIGNED NOT NULL,
    `Instance` int UNSIGNED NOT NULL,
    `PointsPossible` int UNSIGNED DEFAULT 0 NOT NULL,
    PRIMARY KEY (`AssignmentID`)
);
    
CREATE TABLE `COURSE` (
    `Department` varchar(255) NOT NULL,
    `CourseNumber` int UNSIGNED NOT NULL,
    `CourseName` varchar(255) NOT NULL,
    `Term` varchar(255) NOT NULL,
    `Year` int UNSIGNED NOT NULL,
    `CourseID` int UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    PRIMARY KEY(`CourseID`)
) ;

CREATE TABLE `ENROLLMENT` (
    `StudentID` int UNSIGNED NOT NULL,
    `CourseID` int UNSIGNED NOT NULL,
    PRIMARY KEY (`StudentID`, `CourseID`)
);

CREATE TABLE `DISTRIBUTION` (
    `DistributionID` int UNSIGNED NOT NULL UNIQUE,
    `CourseID` int UNSIGNED NOT NULL,
    `CategoryName` varchar(30) NOT NULL,
    `Percentage` int UNSIGNED NOT NULL,
    PRIMARY KEY(`DistributionID`)
);
