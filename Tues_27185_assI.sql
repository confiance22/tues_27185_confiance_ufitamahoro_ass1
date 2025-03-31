//SQL PLUS

    
SQL*Plus: Release 21.0.0.0.0 - Production on Tue Feb 25 22:35:23 2025
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Enter user-name: sys as sysdba
Enter password:

Connected to:
Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> ALTER SESSION SET CONTAINER = TUE_27185_PDB_ASS1;

Session altered.

SQL> GRANT DBA TO TUE27185PDBASS1;

Grant succeeded.

SQL> ALTER USER TUE27185PDBASS1 QUOTA UNLIMITED ON USERS;

User altered.

SQL> GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE PROCEDURE, CREATE SEQUENCE, CREATE TRIGGER TO TUE27185PDBASS1;

Grant succeeded.

SQL> SELECT username, tablespace_name, bytes, max_bytes
  2  FROM dba_ts_quotas
  3  WHERE username = 'TUE27185PDBASS1';

USERNAME
--------------------------------------------------------------------------------
TABLESPACE_NAME                     BYTES  MAX_BYTES
------------------------------ ---------- ----------
TUE27185PDBASS1
USERS                             2097152         -1


SQL> show pdbs;

    CON_ID CON_NAME                       OPEN MODE  RESTRICTED
---------- ------------------------------ ---------- ----------
         2 PDB$SEED                       READ ONLY  NO
         3 TUE_27185_PDB_ASS1             READ WRITE NO

/////////////////////////////////////////////////////////////////////////////////////////////////////////

//CREATING TABLES

CREATE TABLE Books (
    BookID NUMBER PRIMARY KEY,
    Title VARCHAR2(100),
    PublishedDate DATE
);

CREATE TABLE Members (
    MemberID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Email VARCHAR2(100),
    JoinDate DATE
);

CREATE TABLE Borrowings (
    BorrowID NUMBER PRIMARY KEY,
    BookID NUMBER REFERENCES Books(BookID),
    MemberID NUMBER REFERENCES Members(MemberID),
    BorrowDate DATE,
    ReturnDate DATE
);

CREATE TABLE Fines (
    FineID NUMBER PRIMARY KEY,
    BorrowID NUMBER REFERENCES Borrowings(BorrowID),
    Amount NUMBER(10, 2),
    PaidStatus VARCHAR2(10)
);

//GRANT SELECT PRIVILLAGES

GRANT SELECT ON Books TO TUE27185PDBASS1;
GRANT SELECT ON Fines TO TUE27185PDBASS1;
GRANT SELECT ON Borrowings TO TUE27185PDBASS1;
GRANT SELECT ON Books TO TUE27185PDBASS1;

//INSERTING RECORDS

INSERT INTO Books (BookID, Title, PublishedDate) VALUES (1, 'PL/SQL',TO_DATE('2025-02-10', 'YYYY-MM-DD'));
INSERT INTO Books (BookID, Title, PublishedDate) VALUES (2, 'Operating System',TO_DATE('2025-02-10', 'YYYY-MM-DD'));
INSERT INTO Books (BookID, Title, PublishedDate) VALUES (3, 'Software Engineering',TO_DATE('2025-02-14', 'YYYY-MM-DD'));
INSERT INTO Books (BookID, Title, PublishedDate) VALUES (4, 'Computer Maintenance',TO_DATE('2025-02-20', 'YYYY-MM-DD'));
INSERT INTO Books (BookID, Title, PublishedDate) VALUES (5, 'General English',TO_DATE('2025-02-25', 'YYYY-MM-DD'));
INSERT INTO Books (BookID, Title, PublishedDate) VALUES (6, 'General English',TO_DATE('2025-02-28', 'YYYY-MM-DD'));
INSERT INTO Books (BookID, Title, PublishedDate) VALUES (7, 'General English',TO_DATE('2025-02-24', 'YYYY-MM-DD'));


INSERT INTO Members (MemberID, Name, Email, JoinDate) VALUES (1, 'confiance', 'confiance@gmail.com', TO_DATE('2024-11-01', 'YYYY-MM-DD'));
INSERT INTO Members (MemberID, Name, Email, JoinDate) VALUES (2, 'eric', 'eric@gmail.com', TO_DATE('2023-07-11', 'YYYY-MM-DD'));
INSERT INTO Members (MemberID, Name, Email, JoinDate) VALUES (3, 'kevin', 'kevin@gmail.com', TO_DATE('2022-11-21', 'YYYY-MM-DD'));
INSERT INTO Members (MemberID, Name, Email, JoinDate) VALUES (4, 'prince', 'prince@gmail.com', TO_DATE('2020-12-31', 'YYYY-MM-DD'));
INSERT INTO Members (MemberID, Name, Email, JoinDate) VALUES (5, 'fabrice', 'fabrice@gmail.com', TO_DATE('2019-06-15', 'YYYY-MM-DD'));


INSERT INTO Borrowings (BorrowID, BookID, MemberID, BorrowDate, ReturnDate) VALUES (1, 1, 1, TO_DATE('2024-11-02', 'YYYY-MM-DD'), TO_DATE('2024-11-07', 'YYYY-MM-DD'));  
INSERT INTO Borrowings (BorrowID, BookID, MemberID, BorrowDate, ReturnDate) VALUES (2, 2, 2, TO_DATE('2023-07-12', 'YYYY-MM-DD'), TO_DATE('2023-07-16', 'YYYY-MM-DD'));  
INSERT INTO Borrowings (BorrowID, BookID, MemberID, BorrowDate, ReturnDate) VALUES (3, 3, 3, TO_DATE('2022-11-22', 'YYYY-MM-DD'), TO_DATE('2022-11-26', 'YYYY-MM-DD'));  
INSERT INTO Borrowings (BorrowID, BookID, MemberID, BorrowDate, ReturnDate) VALUES (4, 4, 4, TO_DATE('2021-01-03', 'YYYY-MM-DD'), TO_DATE('2021-01-08', 'YYYY-MM-DD'));  
INSERT INTO Borrowings (BorrowID, BookID, MemberID, BorrowDate, ReturnDate) VALUES (5, 5, 5, TO_DATE('2019-06-16', 'YYYY-MM-DD'), TO_DATE('2019-06-20', 'YYYY-MM-DD'));  
INSERT INTO Borrowings (BorrowID, BookID, MemberID, BorrowDate, ReturnDate) VALUES (6, 1, 1, SYSDATE - 5, SYSDATE - 2);  
INSERT INTO Borrowings (BorrowID, BookID, MemberID, BorrowDate, ReturnDate) VALUES (7, 1, 1, SYSDATE - 3, SYSDATE - 1);  
INSERT INTO Borrowings (BorrowID, BookID, MemberID, BorrowDate, ReturnDate) VALUES (8, 1, 1, SYSDATE - 6, SYSDATE - 4); 
INSERT INTO Borrowings (BorrowID, BookID, MemberID, BorrowDate, ReturnDate) VALUES (9, 2, 2, SYSDATE - 4, SYSDATE - 2);  
INSERT INTO Borrowings (BorrowID, BookID, MemberID, BorrowDate, ReturnDate) VALUES (10, 2, 2, SYSDATE - 2, SYSDATE - 1);  

INSERT INTO Fines (FineID, BorrowID, Amount, PaidStatus) VALUES (1, 1, 00.00, 'Paid');
INSERT INTO Fines (FineID, BorrowID, Amount, PaidStatus) VALUES (2, 2, 10.00, 'Paid');
INSERT INTO Fines (FineID, BorrowID, Amount, PaidStatus) VALUES (3, 3, 00.00, 'not Paid');
INSERT INTO Fines (FineID, BorrowID, Amount, PaidStatus) VALUES (4, 4, 15.00, 'Paid');
INSERT INTO Fines (FineID, BorrowID, Amount, PaidStatus) VALUES (5, 5, 00.00, 'not Paid');

//SELECTING * RECORDS

SELECT * FROM Books;
SELECT * FROM Borrowings;
SELECT * FROM Fines;
SELECT * FROM Members;

//UPDATE RECORD

UPDATE Members SET Email = 'confiance@gmail.com' WHERE MemberID = 1;
UPDATE Fines SET Paidstatus = 'not paid' WHERE FineID = 1;

//DELETING RECORDS

DELETE FROM Fines WHERE FineID = 5;


//JOINING TABLES

SELECT b.Title, m.Name, br.BorrowDate, br.ReturnDate
FROM Borrowings br
JOIN Books b ON br.BookID = b.BookID
JOIN Members m ON br.MemberID = m.MemberID;

//Subquery

SELECT Name FROM Members WHERE MemberID IN (SELECT MemberID FROM Borrowings WHERE ReturnDate IS NULL);

//Records Added in the Past 7 Days:

SELECT *
FROM BOOKS
WHERE PUBLISHEDDATE >= SYSDATE - 7;

//Top 5 Highest Values:

SELECT * FROM Books ORDER BY PublishedDate DESC FETCH FIRST 5 ROWS ONLY;

//Entities with More Than 3 Transactions:

SELECT BookID, COUNT(*) AS TransactionCount
FROM Borrowings
GROUP BY BookID
HAVING COUNT(*) > 3;
