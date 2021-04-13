CREATE SCHEMA Gradebook;

DROP TABLE IF EXISTS `GRADEBOOK`;
CREATE TABLE `GRADEBOOK` (
    `StudentID` int(11) NOT NULL,
    `AssignmentID` int(11) NOT NULL,
    `Point` int(11) DEFAULT 0 NOT NULL,
    PRIMARY KEY (`StudentID`, `AssignmentID`)
);
 
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

#INSERT COMMANDS USED TO PUT DATA IN TABLES: 
SELECT * FROM STUDENT;

#INSERT STUDENTS INTO THE STUDENT TABLE
INSERT INTO `STUDENT` VALUES('Xavier', 'Brown', 'Computer Science', 02851);
INSERT INTO `STUDENT` VALUES('Kendall', 'Stewart', 'English', 02761);
INSERT INTO `STUDENT` VALUES('Kirah', 'Lopez', 'Computer Engineering', 02656);
INSERT INTO `STUDENT` VALUES('William', 'Craft', 'Biology', 02551);
INSERT INTO `STUDENT` VALUES('Joshua', 'Gimmick', 'Computer Science', 02548);
INSERT INTO `STUDENT` VALUES('Trav', 'Bachman', 'Chemistry', 02367);

#INSERT COURSES INTO THE COURSE TABLE 
SELECT * FROM COURSE;

INSERT INTO `COURSE` VALUES('Math', 158, 'Calculus 2', 'Fall', 2021, 89784);
INSERT INTO `COURSE` VALUES('Computer Science', 450, 'Database Systems', 'Spring', 2021, 83794);
INSERT INTO `COURSE` VALUES('English', 007, 'Technical Writing', 'Fall', 2021, 59038);
INSERT INTO `COURSE` VALUES('Computer Science', 678, 'Senior Project II', 'Spring', 2021, 92850);
INSERT INTO `COURSE` VALUES('Biology', 101, 'Biology I', 'Fall', 2021, 49174);

#INSERT STUDENTS TO BE ENROLLED IN COURSES
SELECT * FROM ENROLLMENT;

#STUDENTS ADDED TO CALC II
INSERT INTO `ENROLLMENT` VALUES(02851, 89784);
INSERT INTO `ENROLLMENT` VALUES(02761, 89784);
INSERT INTO `ENROLLMENT` VALUES(02656, 89784);
INSERT INTO `ENROLLMENT` VALUES(02551, 89784);
INSERT INTO `ENROLLMENT` VALUES(02548, 89784);
INSERT INTO `ENROLLMENT` VALUES(02367, 89784);

#STUDENTS ADDED TO DATABASE SYSTEMS
INSERT INTO `ENROLLMENT` VALUES(02851, 83794);
INSERT INTO `ENROLLMENT` VALUES(02656, 83794);
INSERT INTO `ENROLLMENT` VALUES(02548, 83794);
INSERT INTO `ENROLLMENT` VALUES(02367, 56738);

#STUDENTS ADDED TO TECHNICAL WRITING 
INSERT INTO `ENROLLMENT` VALUES(02851, 59038);
INSERT INTO `ENROLLMENT` VALUES(02761, 59038);
INSERT INTO `ENROLLMENT` VALUES(02548, 59038);
INSERT INTO `ENROLLMENT` VALUES(02367, 59038);

#STUDENTS ADDED TO SENIOR PROJECT II
INSERT INTO `ENROLLMENT` VALUES(02851, 92850);
INSERT INTO `ENROLLMENT` VALUES(02656, 92850);
INSERT INTO `ENROLLMENT` VALUES(02548, 92850);

#STUDENTS ADDED TO BIOLOGY I
INSERT INTO `ENROLLMENT` VALUES(02551, 49174);
INSERT INTO `ENROLLMENT` VALUES(02367, 49174);

#INSERT DISTRIBUTION FOR GRADES 

SELECT * FROM DISTRIBUTION;

#CALC II DISTRIBUTION
INSERT INTO `DISTRIBUTION` VALUES(1, 89784, 'Quiz', 40);
INSERT INTO `DISTRIBUTION` VALUES(2, 89784, 'HW', 20);
INSERT INTO `DISTRIBUTION` VALUES(3, 89784, 'MidTerm', 20);
INSERT INTO `DISTRIBUTION` VALUES(4, 89784, 'Final', 20);

#DATABASE SYSTEM DISTRIBUTION
INSERT INTO `DISTRIBUTION` VALUES(5, 83794, 'Assignments', 30);
INSERT INTO `DISTRIBUTION` VALUES(6, 83794, 'HW', 20);
INSERT INTO `DISTRIBUTION` VALUES(7, 83794, 'MidTerm', 25);
INSERT INTO `DISTRIBUTION` VALUES(8, 83794, 'Final', 25);

#TECHNICAL WRITING DISTRIBUTION
INSERT INTO `DISTRIBUTION` VALUES(9, 59038, 'Writing Assignments', 40);
INSERT INTO `DISTRIBUTION` VALUES(10, 59038, 'HW', 15);
INSERT INTO `DISTRIBUTION` VALUES(11, 59038, 'MidTerm', 20);
INSERT INTO `DISTRIBUTION` VALUES(12, 59038, 'Final Writing Project', 25);

#SENIOR PROJECT DISTRIBUTION
INSERT INTO `DISTRIBUTION` VALUES(13, 92850, 'Assignments', 10);
INSERT INTO `DISTRIBUTION` VALUES(14, 92850, 'HW', 30);
INSERT INTO `DISTRIBUTION` VALUES(15, 92850, 'Project', 30);
INSERT INTO `DISTRIBUTION` VALUES(16, 92850, 'Final Demo', 30);

#BIOLOGY 101 DISTRIBUTION
INSERT INTO `DISTRIBUTION` VALUES(17, 49174, 'Quiz', 20);
INSERT INTO `DISTRIBUTION` VALUES(18, 49174, 'HW', 20);
INSERT INTO `DISTRIBUTION` VALUES(19, 49174, 'Midterm', 30);
INSERT INTO `DISTRIBUTION` VALUES(20, 49174, 'Final', 30);

#INSERT ASSIGNMENTS INTO COURSES 

SELECT * FROM ASSIGNMENT;

INSERT INTO `ASSIGNMENT` VALUES(1, 1, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(2, 1, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(3, 2, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(4, 2, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(5, 3, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(6, 3, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(7, 4, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(8, 4, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(9, 5, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(10, 5, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(11, 6, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(12, 6, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(13, 7, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(14, 7, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(15, 8, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(16, 8, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(17, 9, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(18, 9, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(19, 10, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(20, 10, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(21, 11, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(22, 11, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(23, 12, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(24, 12, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(25, 13, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(26, 13, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(27, 14, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(28, 14, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(29, 15, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(30, 15, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(31, 16, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(32, 16, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(33, 17, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(34, 17, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(35, 18, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(36, 18, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(37, 19, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(38, 19, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(39, 20, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(40, 20, 2, 100);

#INSERT SCORES FOR ASSIGNMENTS 

SELECT * FROM SCORE;

INSERT INTO `SCORE` VALUES(02851, 1, 75);
INSERT INTO `SCORE` VALUES(02761, 1, 88);
INSERT INTO `SCORE` VALUES(02656, 1, 100);
INSERT INTO `SCORE` VALUES(02551, 1, 95);
INSERT INTO `SCORE` VALUES(02548, 1, 87);
INSERT INTO `SCORE` VALUES(02367, 1, 93);

INSERT INTO `SCORE` VALUES(02851, 2, 74);
INSERT INTO `SCORE` VALUES(02761, 2, 89);
INSERT INTO `SCORE` VALUES(02656, 2, 92);
INSERT INTO `SCORE` VALUES(02551, 2, 59);
INSERT INTO `SCORE` VALUES(02548, 2, 88);
INSERT INTO `SCORE` VALUES(02367, 2, 79);

INSERT INTO `SCORE` VALUES(02851, 3, 88);
INSERT INTO `SCORE` VALUES(02761, 3, 98);
INSERT INTO `SCORE` VALUES(02656, 3, 83);
INSERT INTO `SCORE` VALUES(02551, 3, 76);
INSERT INTO `SCORE` VALUES(02548, 3, 79);
INSERT INTO `SCORE` VALUES(02367, 3, 87);

INSERT INTO `SCORE` VALUES(02851, 4, 81);
INSERT INTO `SCORE` VALUES(02761, 4, 84);
INSERT INTO `SCORE` VALUES(02656, 4, 95);
INSERT INTO `SCORE` VALUES(02551, 4, 62);
INSERT INTO `SCORE` VALUES(02548, 4, 90);
INSERT INTO `SCORE` VALUES(02367, 4, 93);

INSERT INTO `SCORE` VALUES(02851, 5, 86);
INSERT INTO `SCORE` VALUES(02761, 5, 94);
INSERT INTO `SCORE` VALUES(02656, 5, 86);
INSERT INTO `SCORE` VALUES(02551, 5, 75);
INSERT INTO `SCORE` VALUES(02548, 5, 86);
INSERT INTO `SCORE` VALUES(02367, 5, 100);

INSERT INTO `SCORE` VALUES(02851, 6, 84);
INSERT INTO `SCORE` VALUES(02761, 6, 95);
INSERT INTO `SCORE` VALUES(02656, 6, 73);
INSERT INTO `SCORE` VALUES(02551, 6, 89);
INSERT INTO `SCORE` VALUES(02548, 6, 94);
INSERT INTO `SCORE` VALUES(02367, 6, 97);

INSERT INTO `SCORE` VALUES(02851, 7, 81);
INSERT INTO `SCORE` VALUES(02761, 7, 84);
INSERT INTO `SCORE` VALUES(02656, 7, 95);
INSERT INTO `SCORE` VALUES(02551, 7, 62);
INSERT INTO `SCORE` VALUES(02548, 7, 90);
INSERT INTO `SCORE` VALUES(02367, 7, 93);

INSERT INTO `SCORE` VALUES(02851, 8, 90);
INSERT INTO `SCORE` VALUES(02761, 8, 89);
INSERT INTO `SCORE` VALUES(02656, 8, 99);
INSERT INTO `SCORE` VALUES(02551, 8, 69);
INSERT INTO `SCORE` VALUES(02548, 8, 94);
INSERT INTO `SCORE` VALUES(02367, 8, 91);

INSERT INTO `SCORE` VALUES(02851, 9, 95);
INSERT INTO `SCORE` VALUES(02761, 9, 86);
INSERT INTO `SCORE` VALUES(02656, 9, 94);
INSERT INTO `SCORE` VALUES(02551, 9, 75);
INSERT INTO `SCORE` VALUES(02548, 9, 99);
INSERT INTO `SCORE` VALUES(02367, 9, 94);

INSERT INTO `SCORE` VALUES(02851, 10, 95);
INSERT INTO `SCORE` VALUES(02761, 10, 86);
INSERT INTO `SCORE` VALUES(02656, 10, 94);
INSERT INTO `SCORE` VALUES(02551, 10, 75);
INSERT INTO `SCORE` VALUES(02548, 10, 99);
INSERT INTO `SCORE` VALUES(02367, 10, 94);

INSERT INTO `SCORE` VALUES(02851, 11, 56);
INSERT INTO `SCORE` VALUES(02761, 11, 98);
INSERT INTO `SCORE` VALUES(02656, 11, 93);
INSERT INTO `SCORE` VALUES(02551, 11, 79);
INSERT INTO `SCORE` VALUES(02548, 11, 94);
INSERT INTO `SCORE` VALUES(02367, 11, 91);

INSERT INTO `SCORE` VALUES(02851, 13, 76);
INSERT INTO `SCORE` VALUES(02761, 13, 86);
INSERT INTO `SCORE` VALUES(02656, 13, 92);
INSERT INTO `SCORE` VALUES(02551, 13, 87);
INSERT INTO `SCORE` VALUES(02548, 13, 87);
INSERT INTO `SCORE` VALUES(02367, 13, 77);

INSERT INTO `SCORE` VALUES(02851, 15, 86);
INSERT INTO `SCORE` VALUES(02761, 15, 96);
INSERT INTO `SCORE` VALUES(02656, 16, 82);
INSERT INTO `SCORE` VALUES(02551, 16, 87);
INSERT INTO `SCORE` VALUES(02548, 17, 77);
INSERT INTO `SCORE` VALUES(02367, 17, 67);

#TASK 3: Show the tables with the contents that you have inserted
SELECT * FROM STUDENT;
SELECT * FROM ENROLLMENT;
SELECT * FROM COURSES;
SELECT * FROM STUDENTSCORES;
SELECT * FROM ASSIGNMENTS;
SELECT * FROM DISTRIBUTION;


#TASK 4: Compute the average/highest/lowest score of an assignment
select a.AssignmentID, avg(s.POINTS), max(s.POINTS), min(s.POINTS) from ASSIGNMENT a, SCORE s where a.AssignmentID=3 AND s.AssignmentID=a.AssignmentID;


#TASK 5: List all of the students in a given course;
select s.StudentID, s.FirstName from STUDENT s JOIN ENROLLMENT e where e.CourseID = 89784 and s.StudentID = e.StudentID;


#TASK 6: List all of the students in a course and all of their scores on every assignment
SELECT s.StudentID, s.FirstName, s.LastName, e.CourseID, g.AssignmentID, g.Points
FROM STUDENT s, ENROLLMENT e, GRADEBOOK g
WHERE s.StudentID = g.StudentId AND g.StudentID = e.StudentID AND e.CourseID = 5;


#TASK 7: Add an assignment to a course;
SELECT * FROM ASSIGNMENT; 
INSERT INTO ASSIGNMENT VALUES (42, 5, 2, 100);


#TASK 8: Change the percentages of the categories for a course;
UPDATE DISTRIBUTION SET percentage = 45 WHERE CategoryName = 'Final';


#TASK 9: Add 2 points to the score of each student on an assignment;
UPDATE ASSIGNMENT SET POINTS = POINTS + 2 WHERE AssignmentID = 9; 


#TASK 10: Add 2 points just to those students whose last name contains a ‘Q’.
UPDATE GRADEBOOK SET Point = Point + 2
WHERE GRADEBOOK.StudentID = (SELECT StudentID FROM STUDENT WHERE GRADEBOOK.StudentID = 
                             STUDENT.StudentID AND STUDENT.LastName LIKE '%Q%');

#TASK 11: Compute the grade for a student;
SELECT DISTINCT pt.StudentID, st.FirstName, st.LastName, pt.CourseID,pt.AssignmentID, pt.CategoryName, pt.Points
FROM (
     SELECT STUDENT.StudentID, AssignmentID, FirstName, LastName, CourseID, Points
     FROM STUDENT JOIN ENROLLMENT JOIN GRADEBOOK
     WHERE STUDENT.StudentID = ENROLLMENT.StudentID
     AND STUDENT.StudentID = SCORE.StudentID) st
JOIN
 (SELECT StudentID, CourseID, CategoryName, ASSIGNMENT.AssignmentID, Points
     FROM DISTRIBUTION JOIN ASSIGNMENT JOIN GRADEBOOK
     WHERE DISTRIBUTION.DistributionID = ASSIGNMENT.DistributionID
     AND ASSIGNMENT.AssignmentID = SCORE.AssignmentID) pt
WHERE st.AssignmentID = pt.AssignmentID
AND st.Points = pt.Points AND st.StudentID=89784;

#TASK 12: Compute the grade for a student, where the lowest score for a given category is dropped.

