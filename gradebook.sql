#CREATE SCHEMA GradeBook;

CREATE TABLE `STUDENT` (
    `FirstName` varchar(255) DEFAULT NULL,
    `LastName` varchar(255) DEFAULT NULL,
    `Major` varchar(255) DEFAULT NULL,
    `StudentID` int UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`StudentID`)
);


CREATE TABLE `GRADEBOOK` (
    `StudentID` int UNSIGNED NOT NULL,
    `AssignmentID` int UNSIGNED NOT NULL,
    `Point` int UNSIGNED DEFAULT 0 NOT NULL,
    PRIMARY KEY (`StudentID`, `AssignmentID`)
);


CREATE TABLE `ASSIGNMENT` (
    `AssignmentID` int UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    `DistributionID` int UNSIGNED NOT NULL,
    `Instance` int UNSIGNED NOT NULL,
    `PointsPossible` int UNSIGNED DEFAULT 0 NOT NULL,
    PRIMARY KEY (`AssignmentID`)
);


CREATE TABLE `DISTRIBUTION` (
    `DistributionID` int UNSIGNED NOT NULL UNIQUE,
    `CourseID` int UNSIGNED NOT NULL,
    `CategoryName` varchar(255) NOT NULL,
    `Percentage` int UNSIGNED NOT NULL,
    PRIMARY KEY(`DistributionID`)
) ENGINE=InnoDB;


CREATE TABLE `ENROLLMENT` (
    `StudentID` int UNSIGNED NOT NULL,
    `CourseID` int UNSIGNED NOT NULL,
    PRIMARY KEY (`StudentID`, `CourseID`)
);


CREATE TABLE `COURSE` (
    `Department` varchar(255) NOT NULL,
    `CourseNumber` int UNSIGNED NOT NULL,
    `CourseName` varchar(255) NOT NULL,
    `Term` varchar(255) NOT NULL,
    `Year` int UNSIGNED NOT NULL,
    `CourseID` int UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    PRIMARY KEY(`CourseID`)
);

#INSERT STUDETNS INTO TABLE
INSERT INTO `STUDENT` 
VALUES
('Xavier', 'Brown', 'Computer Science', 6345),('Kirah', 'Long', 'Computer Engineering', 3463),
('Eren', 'Jaegar', 'Architecture', 8989),('Stephanie', 'Garner', 'Marine Biology', 7321);

#INSERT COURSES INTO TABLE
INSERT INTO `COURSE` 
VALUES
('Computer Science', 678, 'Senior Project', 'Spring', 2020, 87653),
('Biology', 101, 'Biology 101', 'Fall', 2020, 76922),
('Chemistry', 101, 'Chemistry 101', 'Spring', 2020, 89209);

#INSERT STUDENTS TO BE ENROLLED
INSERT INTO `ENROLLMENT` 
VALUES
(6345, 87653),
(6345, 76922),
(3463, 89209),
(3463, 76922),
(8989, 87653),
(8989, 89209),
(7321, 87653),
(7321, 76922);

#SET THE DITRIBUTION FOR CLASSES
INSERT INTO `DISTRIBUTION` 
VALUES
(5, 87653, 'Participation', 10),
(6, 87653, 'Sprint Reports', 20),
(7, 87653, 'Projects', 20),
(8, 87653, 'Demo Project', 50);

#ENTER ASSIGNMENTS INTO TABLE
INSERT INTO `ASSIGNMENT` 
VALUES
(5, 5, 1, 100),
(6, 5, 2, 100),
(7, 6, 1, 100),
(8, 6, 2, 100),
(9, 7, 1, 100),
(10, 7, 2, 100),
(11, 8, 1, 100),
(12, 8, 2, 100);

#INSERT VALUES INTO THE GRADEBOOK
INSERT INTO `GRADEBOOK` 
VALUES
(6345, 5, 89),
(3463, 5, 80),
(8989, 5, 91),
(7321, 5, 72),
(6345, 6, 89),
(3463, 6, 81),
(8989, 6, 90),
(7321, 6, 82),
(6345, 7, 80),
(3463, 7, 94),
(8989, 7, 65),
(7321, 7, 82),
(6345, 8, 97),
(3463, 8, 64),
(8989, 8, 75),
(7321, 8, 82);

#TASK #3: Show the tables with the contents that you have inserted
SELECT * FROM STUDENT;
SELECT * FROM GRADEBOOK;
SELECT * FROM ASSIGNMENT;
SELECT * FROM DISTRIBUTION;
SELECT * FROM ENROLLMENT;
SELECT * FROM COURSE;

#TASK #4: Compute the average/highest/lowest score of an assignment
SELECT a.AssignmentID, avg(s.POINTS), max(s.POINTS), min(s.POINTS) 
FROM ASSIGNMENT a, GRADEBOOK s WHERE a.AssignmentID=7 AND s.AssignmentID=a.AssignmentID;


#TASK #5 List all students of a given course
SELECT s.StudentID, s.FirstName FROM STUDENT s JOIN ENROLLMENT e WHERE e.CourseID = 87653 AND s.StudentID = e.StudentID;


#TASK 6: List all of the students in a course and all of their scores on every assignment
SELECT s.StudentID, s.FirstName, s.LastName, e.CourseID, g.AssignmentID, g.Point FROM STUDENT s, ENROLLMENT e, GRADEBOOK g
WHERE s.StudentID = g.StudentId AND g.StudentID = e.StudentID AND e.CourseID = 1;

#TASK 7: Add an assignment to a course
INSERT INTO ASSIGNMENT
VALUES
(20, 5, 2, 80);

#TASK 8: Change the percentages of the categories for a course;
UPDATE DISTRIBUTION SET Percentage = 45 WHERE CategoryName = 'TEST';

#TASK 9: Add 2 points to the score of each student on an assignment;
UPDATE GRADEBOOK SET Point = Point + 2 WHERE AssignmentID = 9; 

#TASK 10: Add 2 points just to those students whose last name contains a ‘Q’.
UPDATE GRADEBOOK
SET Point = Point + 2
WHERE GRADEBOOK.StudentID = (SELECT StudentID FROM STUDENT WHERE GRADEBOOK.StudentID = 
                             STUDENT.StudentID AND STUDENT.LastName LIKE '%Q%');
