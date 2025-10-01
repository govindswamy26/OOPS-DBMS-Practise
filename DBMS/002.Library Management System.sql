
-- 1 Author(author_id PK, name, email)
create table author(author_id int primary key, name varchar(255), email varchar(255));
-- 	2. Book(book_id PK, title, author_id FK, category, publish_year, total_copies, available_copies)
create table Book(book_id int primary key, title varchar(255), author_id int, category varchar(255), 
publish_year Date, total_copies int,available_copies int, foreign key(author_id) references author(author_id));

 -- 	3. Member(member_id PK, name, email, membership_date)
alter table member add column (email varchar(155));
create table Member(member_id int primary key, name varchar(255), membership_date Date); 
-- 4. Loan(loan_id PK, book_id FK, member_id FK, issue_date, return_date, status)
create table Loan(loan_id int primary key, book_id int ,member_id int ,
 issue_date Date, return_date Date, status varchar(255), foreign key(book_id) references Book(book_id) , 
 foreign key(member_id) references Member(member_id));



---------------------------------------------------
-- Insert Authors (3 authors)
---------------------------------------------------
INSERT INTO Author VALUES
(1, 'J.K. Rowling', 'jkrowling@example.com'),
(2, 'George R.R. Martin', 'grrm@example.com'),
(3, 'Agatha Christie', 'achristie@example.com');

---------------------------------------------------
-- Insert Books (5 books)
---------------------------------------------------
INSERT INTO Book VALUES
(1, 'Harry Potter and the Philosopher''s Stone', 1, 'Fantasy', '2001-06-26', 5, 5),
(2, 'Harry Potter and the Chamber of Secrets', 1, 'Fantasy', '2002-07-02', 4, 4),
(3, 'A Game of Thrones', 2, 'Fantasy', '1996-08-06', 6, 6),
(4, 'Murder on the Orient Express', 3, 'Mystery', '1934-01-01', 3, 3),
(5, 'And Then There Were None', 3, 'Mystery', '1939-11-06', 4, 4);

---------------------------------------------------
-- Insert Members (4 members)
---------------------------------------------------
INSERT INTO Member (member_id, name, membership_date, email) VALUES
(1, 'Alice', '2025-01-10', 'alice@example.com'),
(2, 'Bob', '2025-01-12', 'bob@example.com'),
(3, 'Charlie', '2025-01-15', 'charlie@example.com'),
(4, 'David', '2025-01-20', 'david@example.com');

---------------------------------------------------
-- Insert Loans (5 loans)
---------------------------------------------------
INSERT INTO Loan VALUES
(1, 1, 1, '2025-09-20', '2025-09-30', 'Issued'),
(2, 3, 2, '2025-09-21', '2025-10-01', 'Issued'),
(3, 4, 3, '2025-09-22', '2025-10-02', 'Issued'),
(4, 2, 4, '2025-09-23', '2025-10-03', 'Returned'),
(5, 5, 1, '2025-09-24', '2025-10-04', 'Issued');

-- 	1. List all currently issued books.

select b.title from 
Book b join Loan l on b.book_id = l.book_id
where l.status = 'Issued';

-- 	2. Show members who borrowed more than 3 books.

select m.member_id from
Member m join Loan l on m.member_id = l.member_id
where l.status = 'Issued' group by m.member_id having count(l.book_id) > 3;

-- 	3. Display books along with author names.
select distinct b.title, a.name
 from Book b join Author a on a.author_id = b.author_id;


--  4. Count number of books per category.
select category , count(category)
from Book group by category;

