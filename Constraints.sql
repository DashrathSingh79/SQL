use sakila ; 
create database regex1 ; 
use regex1 ;
create table test1(id int ,salary int not null);
insert into test1 values(10,900);
insert into test1 values(11,null); -- error here 

 
insert into test1 values(null,1881);
-- --------->-------------------------------------------------------------
-- defult -- > isme default value assign karte hai 
create table test2(id int default 0 ,salary int not null);
insert into test2 values(10,900);
insert into test2 (salary)values(1881); -- error here 
 
select * from test2 ;

-- unique ----------------------------------------------------------------->
create table test3(id int ,salary int default 100 unique) ; 
insert into test3 values(10,900);

insert into test3 (id)values(20012); 
insert into test3 values(10,900);
select * from test3 ;

 -- -------------------------------------------------------------------
 -- Primary Key ----
 -- -------------------------------------------------------------------
 
 create table test4(id int primary key ,salary int ) ; 
insert into test4  values(10,900);

insert into test4 values(10,90012); -- error due duplicate value 10
insert into test3 (id) values(null); -- error due to null values 


-- -------------------------------------------------------------------
-- foreign key 
-- --------------------------------------------------------------------

CREATE TABLE studentinfo (
    sid INT PRIMARY KEY,
    sname VARCHAR(20),
    courseid INT,
    FOREIGN KEY (courseid) REFERENCES courses1(course_id)
);


create table courses1(course_id int PRIMARY KEY , cname varchar(20)) ;
insert into studentinfo values(1,'tushar' , 11) ; 

select * from studentinfo ;
SELECT * FROM courses1;

INSERT INTO courses1 (course_id, cname) VALUES (11, 'Any Course');

INSERT INTO studentinfo (sid, sname, courseid)
VALUES (1, 'tushar', 11);





-- Create the first table: departments
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Create the second table: employees
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Insert data into departments
INSERT INTO departments (dept_id, dept_name)
VALUES 
    (1, 'Human Resources'),
    (2, 'Engineering');

-- Insert data into employees with foreign key references
INSERT INTO employees (emp_id, emp_name, dept_id)
VALUES 
    (101, 'Alice', 1),  -- References Human Resources
    (102, 'Bob', 2);    -- References Engineering
select * from departments;
select * from employees;
drop tables employees,departments;


-- -----------------------------------------------------

CREATE TABLE A (
    a_id INT PRIMARY KEY,
    a_name VARCHAR(50)
);

CREATE TABLE B (
    b_id INT PRIMARY KEY,
    b_name VARCHAR(50)
);


CREATE TABLE C (
    c_id INT PRIMARY KEY,         -- Primary Key
    c_name VARCHAR(50),
    a_id INT,                     -- Foreign Key referencing A
    b_id INT,                     -- Foreign Key referencing B
    FOREIGN KEY (a_id) REFERENCES A(a_id),
    FOREIGN KEY (b_id) REFERENCES B(b_id)
);


INSERT INTO A VALUES (1, 'Alpha'), (2, 'Beta');
INSERT INTO B VALUES (10, 'X'), (20, 'Y');

INSERT INTO C VALUES (100, 'Test1', 1, 10),
                     (101, 'Test2', 2, 20);
                     
select * from A ; 
select * from B ; 
select * from C ;