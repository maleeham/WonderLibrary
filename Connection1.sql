create table Person
(FirstName varchar(20)  not null,
MiddleName varchar(20),
LastName varchar(20) not null,
PersonId varchar(4) primary key CHECK (REGEXP_LIKE(PersonId, 'P{1}[0-9]{1}[0-9]{1}[0-9]{1}')),
DOB date not null CHECK DOB <01-JAN-2002,
Address varchar(50) not null); 
Alter Table Person ADD CONSTRAINT Age Check (DOB < '01-Jan-2002');


insert into person values ('Maleeha','S', 'Koul', 'P123','02-May-1990','Dallas');
insert into person values ('Shruti',' ', 'Agrawal', 'P007','02-Aug-1999','Seattle');
insert into person values ('Miley','K', 'Sam', 'P111','08-May-2000','Washington DC');
insert into person values ('Britney',' ', 'Spears', 'P112','02-May-1990','LA');
insert into person values ('Robert','S', 'Downey', 'P001','02-May-1991','Dallas');
insert into person values ('Captain','', 'America', 'P100','18-Mar-1990','SFO');
insert into person values ('Peter','H', 'Parker', 'P777','02-Sep-1998','Austin');
insert into person values ('Chandler','Muriel', 'Bing', 'P119','22-Oct-1990','NYC');
insert into person values ('Severus','P', 'Snape', 'P023','12-Aug-1988','Godric Hollow');
insert into person values ('Hermoine','P', 'Granger', 'P103','10-Jan-1997','Earth');
insert into person values ('Draco','Lucius', 'Malfoy', 'P223','03-Feb-1997','Hogwarts');
insert into person values ('Rachel','', 'Greene', 'P333','01-Dec-1971','NYC');
insert into person values ('Rachel','', 'Greene', 'P024','01-Dec-1971','NYC');

insert into person values ('Boomer','', 'Phelps', 'P025','05-May-2016','Phoenix');

select * from person;

create table PhoneNumber
(PersonId varchar(4) REFERENCES Person(PersonId),
Phone_no int , 
CONSTRAINT PK PRIMARY KEY (PersonId, Phone_no));
insert into PhoneNumber values('P123','1234567890');
insert into PhoneNumber values('P007','7766627890');
insert into PhoneNumber values('P111','1232653490');
insert into PhoneNumber values('P112','9876567890');
insert into PhoneNumber values('P001','1235387890');
insert into PhoneNumber values('P100','8997300890');
insert into PhoneNumber values('P777','7265387890');
insert into PhoneNumber values('P119','7162434890');
insert into PhoneNumber values('P023','2873797890');
insert into PhoneNumber values('P103','3726527890');
insert into PhoneNumber values('P223','8773669890');
insert into PhoneNumber values('P333','8273667890');

create table Employee
(EmployeeId varchar(10) primary key REFERENCES Person(PersonId), 
Emp_start_date date not null,
GoldMemId int REFERENCES GoldMember(GoldMemId),
Supervisor_flag char(1) not null,
Receptionist_flag char(1) not null,
Catalog_man_flag char(1) not null,
RecordId int REFERENCES Record(RecordId),
BookId int REFERENCES Book(BookId));

Insert into EMPLOYEE values ('P123','01-May-2000','001','T', 'F', 'F', '5000', '100');
Insert into EMPLOYEE values ('P007','10-Aug-2002','002','T', 'F', 'F', '5001', '102');
Insert into EMPLOYEE values ('P111','05-Dec-2000','003','F', 'T', 'F', '5002', '103');
Insert into EMPLOYEE values ('P112','01-Jan-2000','004','F', 'F', 'T', '5003', '104');
Insert into EMPLOYEE values ('P119','01-Nov-1999',NULL,'F', 'F', 'T', '5005', '105');
Insert into EMPLOYEE values ('P023','01-Jul-2005',NULL,'F', 'F', 'T', '5006', '100');

Insert into EMPLOYEE values ('P024','01-Feb-2019',NULL,'T', 'F', 'F', NULL , NULL);




create table SilverMember
(PersonId varchar(4)REFERENCES Person(PersonId), 
SilverMemId int PRIMARY KEY,
Silver_start_date date not null,
GoldMemId int REFERENCES GoldMember(GoldMemId) );

Insert into  SilverMember values('P123' , 1101, '20-AUG-2009', 001);
Insert into  SilverMember values('P103' , 1102, '20-AUG-2009', NULL );
Insert into  SilverMember values('P223' , 1103, '20-AUG-2009', NULL );
Insert into  SilverMember values('P023' , 1104, '18-AUG-2009', 002);
Insert into SilverMember values('P777' , 1105, '12-DEC-2009', 003 );
Insert into SilverMember values('P007' , 1106, '20-OCT-2009', 004 );
Insert into SilverMember values('P112' , 1107, '15-AUG-2009', 005);
Insert into SilverMember values('P333' , 1111, '15-AUG-2017', NULL);

Insert into SilverMember values('P119' , 1109, '29-Oct-2010', 007);
Select * from SilverMember;


create table GoldMember
(GoldMemId int,
Gold_start_date date not null,
PRIMARY KEY(GoldMemId));
desc GoldMember;

Insert into GoldMember values ('001','20-AUG-2010');
Insert into GoldMember values ('002','18-AUG-2010');
Insert into GoldMember values ('003','12-DEC-2010');
Insert into GoldMember values ('004','20-OCT-2010');
Insert into GoldMember values ('005','15-AUG-2010');
Insert into GoldMember values ('006','22-NOV-2010'); 
Insert into GoldMember values ('007','22-NOV-2010'); 



create table LibraryCard
(CardId int,
Membership_level char not null,
PersonId varchar(4),
DOI date not null,
PRIMARY KEY(CardId),
FOREIGN KEY(PersonId) REFERENCES Person(PersonId));
INSERT INTO LIBRARYCARD VALUES (501, 'S','P103', '20-AUG-2009');
INSERT INTO LIBRARYCARD VALUES (502, 'S','P223', '20-AUG-2009');
INSERT INTO LIBRARYCARD VALUES (503, 'G','P123', '20-AUG-2009');
INSERT INTO LIBRARYCARD VALUES (504, 'G','P023', '18-AUG-2009');
INSERT INTO LIBRARYCARD VALUES (505, 'G','P777', '12-DEC-2009');
INSERT INTO LIBRARYCARD VALUES (506, 'G','P007', '20-OCT-2009');
INSERT INTO LIBRARYCARD VALUES (507, 'G','P112', '15-AUG-2009');
INSERT INTO LIBRARYCARD VALUES (508, 'G','P100', '09-NOV-2009');




create table GuestLog
(GuestId int,
GoldMemId int,
GuestName varchar(20) not null,
GuestAddress varchar(50) not null,
GuestContact int not null,
PRIMARY KEY(GuestId, GoldMemId),
FOREIGN KEY (GoldMemId) REFERENCES GoldMember(GoldMemId));
INSERT INTO GUESTLOG VALUES (9901,002,'Leema','Delhi',98989898);
INSERT INTO GUESTLOG VALUES (9902,005,'Sayanee','Mumbai',98989777);
INSERT INTO GUESTLOG VALUES (9903,004,'Medha','Ghaziabad',98989666);
INSERT INTO GUESTLOG VALUES (9904,004,'Preetish','Bhopal',98989555);
INSERT INTO GUESTLOG VALUES (9905,005,'Dimple','Mumbai',98989444);
INSERT INTO GUESTLOG VALUES (9906,001,'Minal','Manipal',98989789);
INSERT INTO GUESTLOG VALUES (9907,001,'Adrian','Bangalore',98989444);
INSERT INTO GUESTLOG VALUES (9908,001,'Manav','Hyderabad',98989111);
INSERT INTO GUESTLOG VALUES (9909,001,'Pulkit','Hyderabad',98980000);


create table Book
(BookId int,
Title varchar(50) not null,
ClassType int not null check (ClassType =1 OR ClassType =2),
PRIMARY KEY(BookId));

insert into Book values('100','AlChemist','1');
insert into Book values('101','Veronica Decides to Die','2');
insert into Book values('102','By the River Pedro I wept','2');
insert into Book values('103','The Zaher','1');
insert into Book values('104','Kite Runner','1');
insert into Book values('105','The Spendid Sun','2');
insert into Book values('106','Harry Potter','1');
insert into Book values('107','Engineering Time','2');



create table Author
(AuthorId int,
BookId int,
AuthorName varchar(20) not null,
PRIMARY KEY(BookId, AuthorId),
FOREIGN KEY (BookId) REFERENCES Book(BookId));

insert into Author values('900','100','Paulo Coelho');
insert into Author values('901','101','Paulo Coelho');
insert into Author values('902','102','Paulo Coelho');
insert into Author values('903','103','Paulo Coelho');
insert into Author values('904','104','Khalid Hossieni');
insert into Author values('905','105','Khalid Hossieni');
insert into Author values('906','106','Rowlings');
insert into Author values('907','107','Maleeha');



create table Publisher
(PublisherId int,
BookId int,
PublisherName varchar(20) not null,
PRIMARY KEY(BookId, PublisherId),
FOREIGN KEY (BookId) REFERENCES Book(BookId));


insert into Publisher values('200','100','McGraw Hill');
insert into Publisher values('200','101','McGraw Hill');
insert into Publisher values('202','102','Penguin');
insert into Publisher values('202','103','Penguin');
insert into Publisher values('200','104','McGraw Hill');
insert into Publisher values('200','105','McGraw Hill');
insert into Publisher values('201','106','Barn and Noble');
insert into Publisher values('200','107','McGraw Hill');


create table Payment 
(PaymentId int,
Penalty int not null,
RecordId int,
PRIMARY KEY(PaymentId),
FOREIGN KEY (RecordId) REFERENCES Record(RecordId));
Insert into Payment values (8101001, 500, 5002);
Insert into Payment values (8101002, 1500, 5004);
Insert into Payment values (8101003, 750, 5006);

create table Record
(RecordId int,
DOI date not null,
DOR date not null,
PRIMARY KEY(RecordId));

insert into Record values('5000','09-Jan-2019','02-Feb-2019');
update record set DOI= '10-Apr-2002', DOR = '16-Apr-2002' where recordid='5000';
insert into Record values('5001','10-Apr-2019','16-Apr-2019');
insert into Record values('5002','20-Mar-2018','30-Apr-2018');
insert into Record values('5003','09-Feb-2018','17-Feb-2018');
insert into Record values('5004','01-Jan-2019','07-Mar-2019');
insert into Record values('5005','02-Aug-2018','07-Aug-2018');
insert into Record values('5006','10-Nov-2019','25-Dec-2019');
insert into Record values('5007','01-Jan-2019','02-Feb-2019');
insert into Record values('5008','03-Jan-2019','10-Jan-2019');

insert into Record values('5009','13-Jan-2019','16-Jan-2019');
insert into Record values('5010','20-Mar-2019','21-Mar-2019');
insert into Record values('5011','03-Jun-2019','10-Jun-2019');
insert into Record values('5014','12-Apr-2019','15-Apr-2019');
insert into Record values('5013','12-Apr-2019','15-Apr-2019');
insert into Record values('5015','01-Feb-2019','15-Apr-2019');

insert into Record values('5016','13-Jan-2019','16-Jan-2019');
insert into Record values('5017','20-Mar-2019','21-Mar-2019');
insert into Record values('5018','03-Jun-2019','10-Jun-2019');
insert into Record values('5019','12-Apr-2019','15-Apr-2019');
insert into Record values('5020','12-Apr-2019','15-Apr-2019');






create table Borrow
(PersonId varchar(4),
BookId int,
RecordId int,
PRIMARY KEY(PersonId, RecordId, BookId),
FOREIGN KEY(PersonId) REFERENCES Person(PersonId),
FOREIGN KEY (RecordId) REFERENCES Record(RecordId),
FOREIGN KEY (BookId) REFERENCES Book(BookId));

INSERT INTO BORROW VALUES ('P103',100,5000);
INSERT INTO BORROW VALUES ('P103',101,5001);
INSERT INTO BORROW VALUES ('P103',103,5002);
INSERT INTO BORROW VALUES ('P103',106,5003);
INSERT INTO BORROW VALUES ('P103',101,5004);
INSERT INTO BORROW VALUES ('P103',103,5005);
INSERT INTO BORROW VALUES ('P103',107,5006);
INSERT INTO BORROW VALUES ('P103',106,5006);
INSERT INTO BORROW VALUES ('P103',105,5006);

INSERT INTO BORROW VALUES ('P007',103,5007);
INSERT INTO BORROW VALUES ('P112',106,5008);
INSERT INTO BORROW VALUES ('P007',101,5009);
INSERT INTO BORROW VALUES ('P112',103,5010);
INSERT INTO BORROW VALUES ('P007',107,5011);
INSERT INTO BORROW VALUES ('P123',106,5012);
INSERT INTO BORROW VALUES ('P123',105,5013);

INSERT INTO BORROW VALUES ('P007',103,5014);
INSERT INTO BORROW VALUES ('P007',106,5015);
INSERT INTO BORROW VALUES ('P007',101,5016);
INSERT INTO BORROW VALUES ('P007',103,5017);
INSERT INTO BORROW VALUES ('P123',101,5018);
INSERT INTO BORROW VALUES ('P123',106,5019);
INSERT INTO BORROW VALUES ('P123',105,5020);

Delete from borrow where bookid=106 and recordid=5006;
Delete from borrow where bookid=105 and recordid=5006;


INSERT INTO BORROW VALUES ('P123',103,5014);
INSERT INTO BORROW VALUES ('P123',107,5009);
INSERT INTO BORROW VALUES ('P111',106,5010);
INSERT INTO BORROW VALUES ('P111',105,5011);
INSERT INTO BORROW VALUES ('P111',107,5013);
INSERT INTO BORROW VALUES ('P111',107,5015);


CREATE OR REPLACE VIEW PopularBooks AS 
    SELECT 
        B.BookID, B.title, B.ClassType,COUNT(B.BookId) as num_books
    FROM Book B, Borrow Br
    WHERE B.BookId = Br.BookId
    GROUP BY B.BookID, B.title, B.ClassType
    ORDER BY num_books desc;  
    
    

  
  




CREATE OR REPLACE VIEW TopLatePaymentMembers AS 
SELECT P.FirstName, P.MiddleName, P.LastName, P.PersonId, P.DOB, P.Address,Count(Py.PaymentID) as num_pay
FROM Payment Py, Person P, Borrow Br
WHERE Py.RecordId = Br.RecordId AND Br.PersonID=P.PersonID
GROUP BY P.FirstName, P.MiddleName, P.LastName, P.PersonId, P.DOB, P.Address
ORDER BY num_pay desc;
    
    


CREATE OR REPLACE VIEW TopGoldMembers AS 
SELECT P.FirstName, P.LastName, G.Gold_start_date, P.PERSONID
FROM Person P, GoldMember G, Employee E
WHERE P.PersonId=E.EmployeeId AND G.GoldMemID=E.GoldMemID AND P.PersonId IN(
    SELECT B.PersonId
    FROM Borrow B, Record R 
    WHERE B.RecordId=R.RecordId AND R.DOR-R.DOI <8 AND CURRENT_DATE - DOI <366
    HAVING COUNT(*)>1
    GROUP BY B.PersonId);



SELECT * 
FROM RECORD
WHERE yearweek(DOI) IN yearweek(CURRENT_DATE -1, CURRENT_DATE -2,CURRENT_DATE -3,CURRENT_DATE -4);


CREATE VIEW TopPublisher As
SELECT PublisherName, Count (*) as num_books
FROM Publisher NATURAL JOIN Book 
GROUP BY PublisherName
ORDER BY num_books desc;

CREATE VIEW  PotentialGoldMember AS
SELECT *
FROM SilverMember S, PhoneNumber PN, Person P, Record R, Borrow Br
WHERE P.PersonId=PN.PersonId AND S.PersonId=P.PersonId AND Br.PersonID=P.PersonId AND Br.RecordId=R.RecordId AND R.DOR-R.DOI<8 AND CURRENT_DATE-30< DOI;





SELECT FirstName, LastName, Address,
    CASE
        WHEN Supervisor_flag ='T' 
        Then 'SUPERVISOR'
        WHEN Catalog_man_flag ='T'
        Then 'CATALOG MANAGER'
        WHEN Receptionist_flag ='T'
        THEN 'RECEPTIONIST'
    END as ClassType
FROM EMPLOYEE, PERSON WHERE employeeID=PersonID;


SELECT P.FirstName, P.LastName, Bo.Title
FROM EMPLOYEE E, Person P, Borrow B, SilverMember S, Book bo, Record R
WHERE S.PersonID = E.EMPLOYEEID AND E.EMPLOYEEID=P.PERSONID AND B.PERSONID=E.EMPLOYEEID AND Bo.Bookid=B.bookid AND R.RecordId=B.RecordId AND R.DOI>(CURRENT_DATE-30) ;


select * from TOPGOLDMEMBERS;



SELECT AVG (num_books) FROM (
SELECT Count (B.PersonID) as num_books
FROM Borrow B, TopGoldMembers TG
WHERE B.Personid = TG.PersonID 
GROUP BY B.PersonID);


SELECT DISTINCT B.title
FROM Book B
WHERE NOT EXISTS (SELECT * FROM Borrow Br, Record R, Book B WHERE R.recordid=Br.recordid AND Br.Bookid=B.bookid AND CURRENT_DATE-151<R.DOI);


SELECT ClassType, Count (ClassType)
FROM Book 
WHERE BookID IN (SELECT DISTINCT BookId FROM Borrow)
Group BY ClassType;


SELECT GoldMemID, COUNT (GuestID)
FROM GuestLog 
GROUP BY GoldMEMID;


SELECT  DISTINCT B.Title
FROM Book B, Record R, Borrow Br
WHERE B.BOOKID=BR.BOOKID AND R.RecordId=Br.RecordId AND R.DOI > (SELECT max(E.Emp_start_date)FROM EMPLOYEE E) ;

select * from record where recordid = 5000;
select * from borrow where bookid=100;

SELECT *
FROM SilverMember S, GoldMember G
WHERE S.GoldmemID=G.GoldMemId AND G.Gold_start_date-S.Silver_start_date < 32;


Select * from employee where employeeid='P119';
update employee set goldmemid=007 where employeeid='P119';

SELECT P.FirstName, P.LastName, s.personid
FROM Person P, SilverMember S
WHERE P.PersonID=S.PersonID AND CURRENT_DATE-Silver_start_date > 1825;

SELECT * FROM SILVERMEMBER;



