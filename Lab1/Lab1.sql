create database Insurance;
use Insurance;
create table person(driver_id varchar(10), Name varchar(20), Address varchar(20), primary key(driver_id));
create table car(Reg_no varchar(10), model varchar(20), Year date, primary key(Reg_no));
create table Accident(Report_no int, adate date, Loaction varchar(20), primary key(Report_no));
create table Owns(driver_id varchar(10), regno varchar(10), primary key(driver_id, regno),
 foreign key(driver_id) references person(driver_id) on delete cascade,
 foreign key(regno) references car(Reg_no) on delete cascade);
create table participated(Driver_id varchar(10), Reg_no varchar(10), Report_no int,
 Damage_amt float, primary key(Driver_id),
 foreign key(Driver_id) references Owns(driver_id) on delete cascade,
 foreign key(Reg_no) references Owns(regno) on delete cascade,
 foreign key(Report_no) references Accident(Report_no) on delete cascade);
 insert into person values('McH3K2', 'Jeevan', 'Rammurthy nagar');
 select * from person;
 insert into person values('12GdV6', 'Ram', 'Yelahanka');
 insert into person values('6SdC43', 'Chatur', 'Bus Stand');
 insert into person values('csREf0', 'Rabal', 'Tin Factory');
 insert into person values('mfe3W7', 'Sheik', 'Block C');
 select * from person;
 insert into car values('A123', 'V2.0', '2020-12-01');
 insert into car values('vDr5', 'GT-TSI', '1420-10-13');
 insert into car values('lEL5', '1500D', '2018-05-13');
 insert into car values('4Q19', 'Q4', '2021-09-11');
 insert into car values('Kq32', 'Street RRRs', '2021-03-31');
 insert into Owns values('McH3K2', 'A123');
 insert into Owns values('12GdV6', 'vDr5');
 insert into Owns values('6SdC43', 'lEL5');
 insert into Owns values('csREf0', '4Q19');
 insert into Owns values('mfe3W7', 'Kq32');
 insert into Accident values('12', '01-06-02', 'M G ROAD');
 insert into Accident values('200 ', '10-12-02', 'DOUBLEROAD');
 insert into Accident values('300', ' 23-07-09', 'M G ROAD');
 insert into Accident values('25000', ' 11-08-00', ' RESIDENCY ROAD');
 insert into Accident values('26500', ' 16-09-01', 'RICHMOND ROAD');
 select * from Accident;
 commit;
 insert into participated values('McH3K2', 'A123', '12', 1350);
 insert into participated values('12GdV6', 'vDr5', '200', 30000);
 insert into participated values('6SdC43', 'lEL5', '300', 50);
 insert into participated values('csREf0', '4Q19', '25000', 200000);
 insert into participated values('mfe3W7', 'Kq32', '26500', 10004);
 select * from participated;
 update participated set damage_amt = 25000
 where report_no = 12;
 select count(*) from Accident where adate like '10-12-02'; 
 SELECT COUNT(A.REPORT_NO)
FROM ACCIDENT A, PARTICIPATED P, CAR C
WHERE A.REPORT_NO=P.REPORT_NO
AND
P.REG_NO=C.REG_NO
AND
C.MODEL='Q4';