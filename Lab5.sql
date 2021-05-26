CREATE DATABASE STUDENT_ENROLL;

USE STUDENT_ENROLL;

CREATE TABLE STUDENT(
REG_NO VARCHAR(30),
SNAME VARCHAR(30),
MAJOR VARCHAR(30),
BDATE DATE,
PRIMARY KEY(REG_NO)
);

CREATE TABLE COURSE(
COURSE_ID INT,
CNAME VARCHAR(30),
DEPT VARCHAR(30),
PRIMARY KEY(COURSE_ID)
);

CREATE TABLE ENROLL(
REG_NO VARCHAR(30),
COURSE_ID INT,
SEM INT,MARKS INT,
FOREIGN KEY(REG_NO) REFERENCES STUDENT(REG_NO) ON UPDATE CASCADE,
FOREIGN KEY(COURSE_ID) REFERENCES COURSE(COURSE_ID) ON UPDATE CASCADE
);

CREATE TABLE BOOK_ADOPTION(
COURSE_ID INT,
SEM INT,
BOOK_ISBN INT,
PRIMARY KEY(BOOK_ISBN),
FOREIGN KEY(COURSE_ID) REFERENCES COURSE(COURSE_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TEXT(
BOOK_ISBN INT,
BOOK_TITLE VARCHAR(30),
PUBLISHER VARCHAR(30),
AUTHOR VARCHAR(30),
FOREIGN KEY(BOOK_ISBN) REFERENCES BOOK_ADOPTION(BOOK_ISBN) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO STUDENT(REG_NO, SNAME, MAJOR, BDATE) VALUES ('CS01', 'RAM', 'DS', '1986-03-12'),
														('IS02', 'SMITH', 'USP', '1987-12-23'),
														('EC03', 'AHMED', 'SNS', '1985-04-17'),
														('CS03', 'SNEHA', 'DBMS', '1987-01-01'),
														('TC05', 'AKHILA', 'EC', '1986-10-06');

INSERT INTO COURSE(COURSE_ID, CNAME, DEPT) VALUES (11, 'DS', 'CS'),
												  (22, 'USP', 'IS'),
												  (33, 'SNS', 'EC'),
												  (44, 'DBMS', 'CS'),
												  (55, 'EC', 'TC');
                                                  
INSERT INTO ENROLL(REG_NO, COURSE_ID, SEM, MARKS) VALUES ('CS01', 11, 4, 85),
														 ('IS02', 22, 6, 80),
														 ('EC03', 33, 2, 80),
														 ('CS03', 44, 6, 75),
														 ('TC05', 55, 2, 8);
                                                         
INSERT INTO BOOK_ADOPTION(COURSE_ID,SEM,BOOK_ISBN) VALUES (11,4,1),
                                                          (11,4,2),
														  (44,6,3),
                                                          (44,6,4),
														  (55,2,5),
                                                          (22,6,6),
                                                          (55,2,7);
                                                          

INSERT INTO TEXT(BOOK_ISBN, BOOK_TITLE, PUBLISHER, AUTHOR) VALUES (1, 'DS and C', 'Princeton', 'Padma Reddy'),
																  (2, 'Fundamentals of DS', 'Princeton', 'Godse'),
																  (3, 'Fundamentals of DBMS', 'Princeton', 'Navathe'),
																  (4, 'SQL', 'Princeton', 'Foley'),
																  (5, 'Electronic circuits', 'TMH', 'Elmasri'),
																  (6, 'Adv unix prog', 'TMH', 'Stevens');
                                                                  
SELECT * FROM STUDENT;
SELECT * FROM COURSE;
SELECT * FROM ENROLL;
SELECT * FROM BOOK_ADOPTION;
SELECT * FROM TEXT;