create database book;
show databases;
use book;
show tables;
create table author(author_id varchar(10), name varchar(20),city varchar(10),country varchar(10),primary key(author_id));	
desc author;
create table publisher(publisher_id int,name varchar(10),city varchar(10),country varchar(10),primary key(publisher_id));
create table category(category_id int,desciption varchar(10),primary key(category_id));
create table 
catalog(book_id int,title varchar(10),author_id int,publisher_id int,category_id int,year int,price int,
primary key(book_id),
foreign key(publisher_id) references publisher(publisher_id) on delete cascade,
foreign key(category_id) references category(category_id) on delete cascade);
create table order_details(order_no int,book_id int,quantity int, primary key(order_no),
foreign key(book_id) references catalog(book_id));

insert into author values('1001','TERAS CHAN','CA','USA');
insert into author values('1002','STEVENS','ZOMBI','UGANDA');
insert into author values('1003','M MANO','CAIR','CANADA');
insert into author values('1004','KARTHIK BP','NEW YORK','USA');
insert into author values('1005','STRALLINGS','LAS VEGAS','USA');
COMMIT;
SELECT * FROM AUTHOR;
insert into publisher values(1,'PEARSON','NEW YORK','USA');
insert into publisher values(2,'EEE','S VALES','USA');
insert into publisher values(3,'PHI','DELHI','INDIA');
insert into publisher values(4,'WILLEY','BERLIN','GERMANY');
insert into publisher values(5,'MGH','NEW YORK','USA');
COMMIT;
SELECT * FROM PUBLISHER;
insert into category values(1001,'CSE');
insert into category values(1002,'ADA');
insert into category values(1003,'ECE');
insert into category values(1004,'PROGRAMING');
insert into category values(1005,'OS');
COMMIT;
SELECT  *FROM Category; 
insert into catalog values(11,'unixsysprg',1001,1,1001,2000 ,251);
insert into catalog values(12,'DS',1002,2,1003, 2001 ,425);
insert into catalog values(13,'LD',1003,3,1002, 1999 ,225);
insert into catalog values(14,'server prg',1004,4,1004, 2001 ,333);
insert into catalog values(15,'linux os',1005,5,1005, 2003 ,326);
insert into catalog values(16,'c++ bible',1005,5,1001, 2000 ,526);
insert into catalog values(17,'cobol HB',1005,4,1001, 2000 ,658);
commit;
select *from catalog;
insert into order_details values(1,11,5);
insert into order_details values(2,12,8);
insert into order_details values(3,13,15);
insert into order_details values(4,14,22);
insert into order_details values(5,15,3);
insert into order_details values(12,17,10);
commit;
select * from order_details;
SELECT A.NAME FROM AUTHOR A,CATALOG C,ORDER_DETAILS O WHERE A.AUTHOR_ID=C.AUTHOR_ID AND C.BOOK_ID=O.BOOK_ID AND O.QUANTITY=(SELECT MAX(QUANTITY) FROM ORDER_DETAILS);
SELECT AUTHOR_ID, NAME, CITY, COUNTRY FROM AUTHOR WHERE AUTHOR_ID IN(SELECT AUTHOR_ID FROM CATALOG WHERE YEAR = 2000 GROUP BY AUTHOR_ID  HAVING COUNT(AUTHOR_ID) >=2   );
UPDATE CATALOG SET PRICE=(PRICE+PRICE*0.1) WHERE PUBLISHER_ID=5;
select * from catalog;