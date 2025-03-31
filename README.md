# Assignment II - SQL Query Execution

## Student Information
- **Student ID:** 27185
- **Name:** Confiance UFITAMAHORO
- **Departement:** Software Engineering
- **Course:** Database Development with PL/SQL

## Problem Statement
This database manages a **Library Management System**. It tracks books, members, borrowings, and fines.

## SQL Commands Executed
- Created tables: Books, Members, Borrowings, Fines.
- Inserted, updated, and deleted data.
- Performed joins and subqueries.
- Retrieved records added in the past 7 days.
- Found the top 5 highest values in each category.
- Identified entities with more than 3 related transactions.

## Screenshots

## CREATING PDB AND ADMIN-USER
![Screenshot (331)](https://github.com/user-attachments/assets/bfd9c4ec-d72f-4b54-9e5f-edc6097748d7)

## Allowing User Full Access
- Switch to the PDB where you want to grant access
-  Grant Unlimited Tablespace Quota
-  Check the tablespace quota
  
![image](https://github.com/user-attachments/assets/fca370cc-6d01-40ec-ac49-31fa904c882a)


## Created tables: Books, Members, Borrowings, Fines.
- Books(BookID, Title, PublishedDate)
- Members(MemberID, Name, Email, JoinDate)
- Borrowings(BorrowID, BookID, MemberID, BorrowDate, ReturnDate)
- Fines(FineID, BorrowID, Amount, PaidStatus)
  
![Screenshot (383)](https://github.com/user-attachments/assets/fada97bb-750c-4012-8e65-65f69670f3dc)

## Grant user Select Privillage
![GRANT SELECT PRIVILLAGE ON USER](https://github.com/user-attachments/assets/b7e6c003-4bb3-46f4-ad23-112e80f905ab)

## Diagram illustrating the tables with relationships
## Tables & Constraints

## Books Table

Stores details of books available in the library.
Primary Key: BookID (Ensures unique book identification).
Attributes: Title, PublishedDate.

## Members Table

Manages registered library members.
Primary Key: MemberID (Ensures unique identification).
Attributes: Name, Email, JoinDate.

## Borrowings Table

Tracks book borrowing transactions.
Primary Key: BorrowID (Ensures unique transaction records).
Foreign Keys:
BookID → References Books(BookID).
MemberID → References Members(MemberID).
Attributes: BorrowDate, ReturnDate.

## Fines Table

Records fines imposed for overdue books.
Primary Key: FineID (Ensures unique fine records).
Foreign Key: BorrowID → References Borrowings(BorrowID).
Attributes: Amount, PaidStatus.

![image](https://github.com/user-attachments/assets/61d4fbd4-2e35-4ef0-98b4-64774a32e472)


## **Key Implementations**  
### ✅ **Database Creation & Privileges**  
- Created a **Pluggable Database (PDB)** and an admin user.  
- Granted **full access and tablespace quotas** for efficient management.  
- Verified privileges to ensure proper security and access control.  

### ✅ **Table Creation & Constraints**  
- Defined primary keys to ensure unique identification of records.  
- Used foreign keys to maintain **relational integrity** between tables.  
- Designed a conceptual diagram illustrating table relationships.  

### ✅ **SQL Queries Executed**  
- **Data Manipulation:** Inserted, updated, and deleted records.  
- **Advanced Queries:**  
  - Retrieved records added in the past **7 days**.  
  - Found **top 5 highest values** in each relevant category.  
  - Identified **entities with more than 3 transactions**.  
- **Joins & Subqueries:** Extracted meaningful insights by linking multiple tables.  

### ✅ **Privilege Management**  
- Granted **SELECT privileges** to ensure controlled access for users.  

## **ER Diagram**  
A conceptual diagram illustrates the **relationships** between tables, ensuring a well-structured database design.   

## **Conclusion**  
This project effectively demonstrates SQL skills, including **database creation, data management, optimization, and security**. The queries implemented provide valuable insights into the system, ensuring smooth and efficient library operations.  

---  
**📌 Author:** Confiance UFITAMAHORO  
**📚 Course:** Database Development with PL/SQL  






