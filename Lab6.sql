CREATE DATABASE MOVIE;
USE MOVIE;
SHOW DATABASES;
CREATE TABLE ACTOR(ACT_ID INT,ACT_NAME VARCHAR(30),ACT_GENDER VARCHAR(30),PRIMARY KEY(ACT_ID));

CREATE TABLE DIRECTOR(DIR_ID INT,DIR_NAME VARCHAR(30),PHONE_NO LONG,PRIMARY KEY(DIR_ID));

CREATE TABLE MOVIES(MOVIE_ID INT,MOVIE_TITLE VARCHAR(30),MOVIE_YEAR INT,MOVIE_LANG VARCHAR(30),DIR_ID INT,PRIMARY KEY(MOVIE_ID),
				  FOREIGN KEY(DIR_ID) REFERENCES DIRECTOR(DIR_ID) ON UPDATE CASCADE);
                  
                  
                  CREATE TABLE MOVIE_CAST(ACT_ID INT,MOVIE_ID INT,ROLE VARCHAR(30),
                  FOREIGN KEY(ACT_ID) REFERENCES ACTOR(ACT_ID) ON DELETE CASCADE ON UPDATE CASCADE,
                  FOREIGN KEY(MOVIE_ID) REFERENCES MOVIES(MOVIE_ID) ON DELETE CASCADE ON UPDATE CASCADE);
                  
CREATE TABLE RATING(MOVIE_ID INT,RATING_STARS INT CHECK (RATING_STARS<=5),
				  FOREIGN KEY(MOVIE_ID) REFERENCES MOVIES(MOVIE_ID) ON UPDATE CASCADE);


INSERT INTO ACTOR(ACT_ID,ACT_NAME,ACT_GENDER) VALUES (5, 'WILL SMITH','MALE' ),
													 (4, 'MANIKANTH SHETTY','MALE'),
													 (1, 'TOM HOLLAND', 'MALE'),
													 (2, 'SCARLETT JOHANSSON','FEMALE' ),
													 (3, 'EMMA STONE','FEMALE');


INSERT INTO MOVIES(MOVIE_ID,MOVIE_TITLE,MOVIE_YEAR,MOVIE_LANG,DIR_ID) VALUES(1,'War of the Worlds', 2005, 'ENG', 1),
																			(2,'Minority Report', 2002, 'ENG', 1),
                                                                            (3,'Django Unchained', 2012, 'ENG', 2),
                                                                            (4,'Vertigo', 1958, 'ENG', 3),
                                                                            (5,'Goodfellas',1990, 'ENG', 4),
                                                                            (6, 'Avatar', 2009, 'ENG', 5);

INSERT INTO DIRECTOR(DIR_ID, DIR_NAME, PHONE_NO) VALUES (1, 'Steven Spielberg', 9110626411),  
														(2, 'Quentin Tarantino', 9110626422),   
                                                        (3, 'Alfred Hitchcock', 9110626433),   
                                                        (4, 'Martin Scorsese', 9110626444),   
                                                        (5, 'James Cameron', 9110626455);

drop table MOVIE_CAST;
INSERT INTO MOVIE_CAST(ACT_ID, MOVIE_ID,ROLE) VALUES(1, 1, 'LEAD'),		
													(1, 2, 'LEAD'),	
                                                    (2, 3, 'LEAD'),	
                                                    (3, 5, 'LEAD'),	
                                                    (4, 6, 'CO-STAR'),	
                                                    (5, 4, 'LEAD');
                               
drop table RATING;
INSERT INTO RATING(MOVIE_ID, RATING_STARS) VALUES(1, 3),
												 (2, 4),
                                                 (3, 5),
                                                 (4, 4),
                                                 (5, 5),
                                                 (1, 4),
                                                 (1, 1),
                                                 (6, 4);



SELECT M.MOVIE_TITLE FROM MOVIES M,DIRECTOR D WHERE M.DIR_ID=D.DIR_ID AND D.DIR_NAME="Alfred Hitchcock";


SELECT M.MOVIE_TITLE FROM ACTOR A,MOVIE_CAST C,MOVIES M WHERE A.ACT_ID=C.ACT_ID AND C.MOVIE_ID=M.MOVIE_ID 
                                                        AND A.ACT_ID IN(SELECT ACT_ID FROM MOVIE_CAST GROUP BY ACT_ID HAVING COUNT(*)>=2);

SELECT M.MOVIE_TITLE, COUNT(*) AS NO_OF_RATINGS,MAX(R.RATING_STARS) AS MAX_RATING FROM MOVIES M,RATING R WHERE M.MOVIE_ID=R.MOVIE_ID  GROUP BY R.MOVIE_ID HAVING COUNT(*)>0 ORDER BY M.MOVIE_TITLE;

UPDATE RATING SET RATING_STARS = 5 WHERE MOVIE_ID IN
(SELECT M.MOVIE_ID FROM MOVIES M, DIRECTOR D WHERE M.DIR_ID = D.DIR_ID AND D.DIR_NAME='Steven Spielberg');
