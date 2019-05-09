CREATE OR REPLACE VIEW TopGoldMembers AS 
SELECT P.FirstName, P.LastName, G.Gold_start_date, P.PERSONID
FROM Person P, GoldMember G, Employee E
WHERE P.PersonId=E.EmployeeId AND G.GoldMemID=E.GoldMemID AND P.PersonId IN(
    SELECT B.PersonId
    FROM Borrow B, Record R 
    WHERE B.RecordId=R.RecordId AND R.DOR-R.DOI <8 AND CURRENT_DATE - DOI <366
    HAVING COUNT(*)>5
    GROUP BY B.PersonId);
      


    
CREATE OR REPLACE VIEW PopularBooks AS 
    SELECT 
        B.BookID, B.title, B.ClassType,COUNT(B.BookId) as num_books
    FROM Book B, Borrow Br
    WHERE B.BookId = Br.BookId
    GROUP BY B.BookID, B.title, B.ClassType
    ORDER BY num_books desc
    FETCH FIRST 4 ROWS WITH TIES; 


    
CREATE OR REPLACE VIEW TopLatePaymentMembers AS 
SELECT P.FirstName, P.MiddleName, P.LastName, P.PersonId, P.DOB, P.Address,Count(Py.PaymentID) as num_pay
FROM Payment Py, Person P, Borrow Br
WHERE Py.RecordId = Br.RecordId AND Br.PersonID=P.PersonID
GROUP BY P.FirstName, P.MiddleName, P.LastName, P.PersonId, P.DOB, P.Address
ORDER BY num_pay desc;


CREATE OR REPLACE VIEW  PotentialGoldMember AS
SELECT P.FirstName,  pn.phone_no, s.silvermemid, P.personID
FROM SilverMember S, PhoneNumber PN, Person P, Record R, Borrow Br
WHERE P.PersonId=PN.PersonId AND P.Personid=Pn.personID AND S.PersonId=P.PersonId AND Br.PersonID=P.PersonId AND Br.RecordId=R.RecordId AND R.DOR-R.DOI<8 AND CURRENT_DATE-30< DOI HAVING COUNT(Br.BookId)>4
group by P.FirstName, pn.phone_no, s.silvermemid,P.personID;
SELECT * FROM POTENTIALGOLDMEMBER;
//Assumhfsh 1 book per week


CREATE OR REPLACE VIEW TopPublisher As
SELECT PublisherName, Count (*) as num_books
FROM Publisher NATURAL JOIN Book 
GROUP BY PublisherName
ORDER BY num_books desc;


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


SELECT AVG (num_books) FROM (
SELECT Count (B.PersonID) as num_books
FROM Borrow B, TopGoldMembers TG
WHERE B.Personid = TG.PersonID 
GROUP BY B.PersonID);


SELECT P.PublisherName, PB.title
FROM Publisher P, PopularBooks PB 
WHERE P.bookid=pb.bookid;


SELECT DISTINCT B.title
FROM Book B
WHERE B.Bookid NOT IN (SELECT B.BookID FROM Borrow Br, Record R, Book B WHERE R.recordid=Br.recordid AND Br.Bookid=B.bookid AND CURRENT_DATE-151<R.DOI);


SELECT ClassType, Count (ClassType)
FROM Book 
WHERE BookID IN (SELECT DISTINCT BookId FROM Borrow)
Group BY ClassType;


SELECT GoldMemID, COUNT (GuestID) as Numg
FROM GuestLog 
GROUP BY GoldMEMID
ORDER BY numg desc;


SELECT EXTRACT(month from R.DOI) "Month" , EXTRACT(year from R.DOI) "Year", Count(Br.Bookid)as MaximumNumberofBooks
FROM Borrow Br, Record R
WHERE Br.RecordId=R.RecordId 
Group by EXTRACT(month from R.DOI), EXTRACT(year from R.DOI)
ORDER BY MaximumNumberofBooks desc
FETCH FIRST 2 ROWS WITH TIES; 






SELECT DISTINCT P.FirstName, P.LastName
FROM Person P, PopularBooks pb, Borrow B
WHERE P.PersonID=B.PersonID AND Pb.BookID=B.bookid;


SELECT  DISTINCT B.Title
FROM Book B, Record R, Borrow Br
WHERE B.BOOKID=BR.BOOKID AND R.RecordId=Br.RecordId AND R.DOI > (SELECT max(E.Emp_start_date)FROM EMPLOYEE E) ;


SELECT *
FROM SilverMember S, GoldMember G
WHERE S.GoldmemID=G.GoldMemId AND G.Gold_start_date-S.Silver_start_date < 32;



SELECT EXTRACT(month from R.DOI), SUM(P.penalty)
FROM PAYMENT p, Record R
WHERE P.RecordId=R.RecordId AND (EXTRACT(month from R.DOI) > EXTRACT(month from CURRENT_DATE)-3) AND (EXTRACT(year from R.DOI) = EXTRACT(year from CURRENT_DATE) AND (EXTRACT(month from R.DOI) < EXTRACT(month from CURRENT_DATE)) )
Group by EXTRACT(month from R.DOI);



SELECT P.FirstName, P.LastName, s.personid
FROM Person P, SilverMember S
WHERE P.PersonID=S.PersonID AND CURRENT_DATE-Silver_start_date > 1825;



SELECT *FROM  POTENTIALGOLDMEMBER;
SELECT * FROM  TOPGOLDMEMBERs;


SELECT PG.FirstName, Count(Br.BookID) 
FROM Borrow Br, PotentialGoldMember PG
WHERE Br.Personid=PG.Personid
GROUP By PG.firstname;
