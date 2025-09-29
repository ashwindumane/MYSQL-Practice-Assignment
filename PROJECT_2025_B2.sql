--06/07/2025 SQL Session 2
--To create table structure we used CREATE statment
CREATE TABLE EMPLOYEE1
(
NAME VARCHAR(20),
MOB NUMBER(10),
ADDRESS VARCHAR(50)
);

SELECT * FROM EMPLOYEE1;
commit;
--how to insert the data in table

INSERT INTO EMPLOYEE1 VALUES('A','12345','Pune');
INSERT INTO EMPLOYEE1 VALUES('B','678910','MUMBAI');

INSERT INTO EMPLOYEE1(MOB,NAME,ADDRESS)VALUES('678911','C','Nashik');

--12/07/2025 SQL Session 3 
CREATE TABLE EMP
       (EMPNO NUMBER(4),
        ENAME VARCHAR2(10),
        JOB VARCHAR2(9),
        MGR NUMBER(4),
        HIREDATE DATE,
        SAL NUMBER(7, 2),
        COMM NUMBER(7, 2),
        DEPTNO NUMBER(2)
        );

INSERT INTO EMP VALUES
        (7369, 'SMITH',  'CLERK',     7902,
        TO_DATE('17-DEC-1980', 'DD-MON-YYYY'),  800, NULL, 20);
INSERT INTO EMP VALUES
        (7499, 'ALLEN',  'SALESMAN',  7698,
        TO_DATE('20-FEB-1981', 'DD-MON-YYYY'), 1600,  300, 30);
INSERT INTO EMP VALUES
        (7521, 'WARD',   'SALESMAN',  7698,
        TO_DATE('22-FEB-1981', 'DD-MON-YYYY'), 1250,  500, 30);
INSERT INTO EMP VALUES
        (7566, 'JONES',  'MANAGER',   7839,
        TO_DATE('2-APR-1981', 'DD-MON-YYYY'),  2975, NULL, 20);
INSERT INTO EMP VALUES
        (7654, 'MARTIN', 'SALESMAN',  7698,
        TO_DATE('28-SEP-1981', 'DD-MON-YYYY'), 1250, 1400, 30);
INSERT INTO EMP VALUES
        (7698, 'BLAKE',  'MANAGER',   7839,
        TO_DATE('1-MAY-1981', 'DD-MON-YYYY'),  2850, NULL, 30);
INSERT INTO EMP VALUES
        (7782, 'CLARK',  'MANAGER',   7839,
        TO_DATE('9-JUN-1981', 'DD-MON-YYYY'),  2450, NULL, 10);
INSERT INTO EMP VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        TO_DATE('09-DEC-1982', 'DD-MON-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        TO_DATE('17-NOV-1981', 'DD-MON-YYYY'), 5000, NULL, 10);
INSERT INTO EMP VALUES
        (7844, 'TURNER', 'SALESMAN',  7698,
        TO_DATE('8-SEP-1981', 'DD-MON-YYYY'),  1500,    0, 30);
INSERT INTO EMP VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        TO_DATE('12-JAN-1983', 'DD-MON-YYYY'), 1100, NULL, 20);
INSERT INTO EMP VALUES
        (7900, 'JAMES',  'CLERK',     7698,
        TO_DATE('3-DEC-1981', 'DD-MON-YYYY'),   950, NULL, 30);
INSERT INTO EMP VALUES
        (7902, 'FORD',   'ANALYST',   7566,
        TO_DATE('3-DEC-1981', 'DD-MON-YYYY'),  3000, NULL, 20);
INSERT INTO EMP VALUES
        (7934, 'MILLER', 'CLERK',     7782,
        TO_DATE('23-JAN-1982', 'DD-MON-YYYY'), 1300, NULL, 10);
INSERT INTO EMP VALUES
        (7934, 'Harish_B', 'AAAA',     7782,
        TO_DATE('23-JAN-1982', 'DD-MON-YYYY'), 1300, NULL, 10);

Select * from EMP;

Select * from EMP
WHERE deptno=20;

Select EMPNO,ENAME,JOB from EMP;

SELECT EMPNO ENAME FROM EMP;

SELECT ENAME Employee_Name FROM EMP;
SELECT ENAME AS Employee_Name FROM EMP;

SELECT ENAME AS Employee_Name,JOB JOB_title FROM EMP;

SELECT ENAME AS "Employee_NAME",JOB JOB_title FROM EMP;

SELECT EMPNO,ENAME,JOB,SAL FROM EMP
WHERE JOB='CLERK';

SELECT EMPNO,ENAME,JOB AS Designation,SAL FROM EMP
WHERE JOB='CLERK';

SELECT EMPNO,ENAME,JOB AS Designation,SAL FROM EMP
WHERE Designation='CLERK';--gives error as invalid identifier

--Note we can't use Alias in where clause.

CREATE TABLE DEPT
       (DEPTNO NUMBER(2) Primary key,
        DNAME VARCHAR2(14),
        LOC VARCHAR2(13)
        );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

--SQL Query with clause and it's execution sequence
Select "Column_names" from "Table_name" 
where "Condition"
Group by "Column_names"
Having "Condition"
oder by  "Column_names"
----------------------------------------------------------------------
--13/07/2025 SQL Session 4
--operator: <, >, =, <=, >=, <>, !=, LIKE,NOT LIKE, BETWEEN, IN,EXIST(sub-query), AND, OR, IS NULL, IS NOT NULL
--NVL function : to handdle null value in records

SELECT * from EMP
WHERE SAL > 1000;

SELECT * from EMP
WHERE SAL < 1000;

SELECT * from EMP
WHERE SAL <= 1000;

SELECT * from EMP
WHERE SAL >= 1000;

SELECT ENAME, SAL from EMP
where sal=800 OR sal=3000;

SELECT ENAME, SAL from EMP
where sal= 1600 or sal=6000 or sal=5000 or sal=7000;

SELECT ENAME, SAL from EMP
where sal BETWEEN 1000 and 5000;

SELECT ENAME, SAL from EMP
where sal>=1000 and sal<=5000;

SELECT ENAME, SAL from EMP
where sal>1000 and sal<5000;

SELECT ENAME, SAL from EMP
where sal=1000 or sal=5000 or sal=1600;

SELECT ENAME, SAL from EMP
where sal IN(1000,5000,1600);
--------------------------------------------------------
--19/07/2025 SQL Session 5
SELECT * FROM EMP;
--I want employees whose sal is 800 and 1000
SELECT ENAME, SAL from EMP
where sal=800 AND sal=1000;

--Note
--That is impossible for a single row. A column (SAL) can have only one value per row — it can't be both 800 and 1000.
--It returns no rows — because no single record satisfies that impossible condition.

--Display the manager records whose sal is more than 2500
SELECT * FROM EMP
WHERE JOB='MANAGER' AND Sal>2500;


--Display the detail of employee whose salary greater than 1000 from dept 30
SELECT * FROM EMP
WHERE SAL < 1000 AND DEPTNO=30;

SELECT SAL,COMM, SAL+COMM AS TOTAL_EARNING FROM EMP;

--Note: Before processing any data, you must handle nulll values
--NVL(Col_name,Value)

--IS NULL and IS NOT NULL is operators. NVL is function to hnadle null values

SELECT SAL,COMM,NVL(COMM,0),SAL+NVL(COMM,0)AS TOTAL_EARNING FROM EMP;

SELECT * FROM EMP
WHERE COMM IS NULL;

SELECT * FROM EMP
WHERE COMM IS NOT NULL;

--LIKE Operator
--DISPLAY the employee detail whose name start with K
SELECT * FROM EMP
WHERE ENAME LIKE 'K%';

--I want those employees whose name start with "S"
Select ENAME from emp where ename like 'S%'; 

--I want those employees whose name end with "N"
Select * from EMP where ename like '%N';

--I want those employees whose name contains "R"
Select * from EMP where ename LIKE '%R%';

--I want those employees whose name contains "A" at 2nd position
Select * from EMP where ename like '_A%';

--I want those employees whose name contains "R" at 2nd position from end
Select * from EMP where ename like '%R_';

--I want those employees whose name only four letter
Select * from EMP where ename like '_____';

/*  LIKE Operators : _ is used to indicate single charecters
        % is used to indicate group of characters  */ 
/*
NOTE: All Keyword and Column name are not case sensitive but
Data in the tables are case sensitive
*/

SELECT ENAME, SAL from EMP
where sal=3000 and ename like 'F%' or ename like 'N%' ;

SELECT ENAME, SAL from EMP
where ename like 'F%' and sal=5000 or sal=3000;

SELECT ENAME, SAL from EMP
where ename like 'F%' and sal=3000 or ename like 'S%' AND sal=3000;

SELECT ENAME, SAL from EMP
where ename like 'F%' and sal=3000 or sal=5000;

-------------------------------------------------------------------------------
--27/07/2025 SQL Session 6

--------NUMERIC FUNCTION
SELECT POWER(3,3) FROM DUAL;
SELECT MOD(11,2) FROM DUAL;
SELECT SQRT(25) FROM DUAL;
SELECT POWER(2,3) FROM DUAL;
SELECT ROUND(678.59),ROUND(678.893,1),ROUND(34.45),ROUND(72.98,-2) FROM DUAL;
SELECT TRUNC(678.89),TRUNC(678.8922,2),TRUNC(34.80),TRUNC(78.98,-1) FROM DUAL;
SELECT CEIL(47.20) FROM DUAL;
SELECT FLOOR(45.80) FROM DUAL; 
SELECT SIGN(-90) FROM DUAL;
SELECT SIGN(45) FROM DUAL;
SELECT SIGN(0) FROM DUAL;

SELECT POWER(2,2) AS Numerical_OP FROM DUAL;

/*
Notes:

ROUND(arg1,arg2)==> 
arg1--> is number which need to round off
arg2--> if 
 0 would round to the nearest whole number.
-1 rounds to the nearest tens place.
-2 rounds to the nearest hundreds place, and so on.
 1 Positive values (like 1) mean the rounding occurs to the right of the decimal point. 
  
 
CEIL(45.23) returns the next highest integer, which is 46.
FLOOR(45.23) returns the next lowest integer, which is 45.
 
 SIGN(arg)==>
Returns 1 if the number is positive.
Returns -1 if the number is negative.
Returns 0 if the number is zero.
*/
 
SELECT ename,LENGTH(ENAME)as Number_of_char FROM EMP;
 
------STRING FUNCTION(Very Important)
SELECT LENGTH(' MAYUR ') FROM DUAL;
SELECT LENGTH('THIS AND THAT') FROM DUAL;

--Note: LENGTH function count space as well

SELECT SUBSTR('Hello World',7,5) FROM DUAL;

SELECT SUBSTR('THIS AND THAT',6,1) FROM DUAL;
--arg1=> input string
--arg2=> from where to start picking up the string
--arg3=> how many characters

SELECT INSTR('THIS AND THAT','H',-1,2) FROM DUAL;
SELECT INSTR('THIS AND THAT','H',-1) FROM DUAL;
--------------------------------------------------------------------------------
--02/08/2025 SQL Session7

--Input string: "I am working as Data Engineer" output:"Data Engineer"
SELECT SUBSTR('I am working as Data Engineer',INSTR('I am working as Data Engineer',' ',1,4)+1) FROM DUAL;

Select INSTR('I am working as Data Engineer',' ',1,4)+1 AS Start_Position from dual;

--arg1=> input string
--arg2=> serching pattern
--arg3=> from where to start search
--arg4=> which occurance

Select SUBSTR('input string',from which position to start,how many char) from Dual;

SELECT Upper(SUBSTR('We ETL Developer used Oracle_SQL for Data pipeline',INSTR('We ETL Developer used Oracle_SQL for Data pipeline',' ',1,4)+1,10)) as Result FROM DUAL;
------------------------------------------------------------------------------------
--03/08/2025 SQL Session 8

SELECT REPLACE('THIS AND THAIT','AND','OR') FROM DUAL;

SELECT LOWER('THIS AND THAIT') FROM DUAL;
SELECT UPPER('this and that') FROM DUAL;

SELECT initcap('this and that') FROM DUAL;

SELECT * FROM EMP;
SELECT EMPNO,ENAME, LPAD(EMPNO,10,'*') FROM EMP;
SELECT ENAME,Sal, RPAD(SAL,12,'*') FROM EMP;

SELECT LENGTH(TRIM(' HHH KJKJ  ')) FROM DUAL;

SELECT LENGTH('HHH KJKJ') FROM DUAL;

SELECT TRIM('  HHH KJKJ ') FROM DUAL;

SELECT LENGTH('Mayur Ashtikar') FROM DUAL;

SELECT LTRIM(' HHHKJKJ  ') FROM DUAL;
SELECT RTRIM(' HHHKJKJ  ') FROM DUAL;

SELECT LENGTH('HHHKJKJ') FROM DUAL;


------DATE FUNCTION
----DD-MON-YY oracle default date formate
SELECT SYSDATE FROM DUAL;

SELECT SYSDATE+10 FROM DUAL;

SELECT SYSDATE-30 FROM DUAL;

SELECT LAST_DAY(SYSDATE) FROM DUAL;

SELECT NEXT_DAY(SYSDATE,'MONDAY') FROM DUAL;

SELECT NEXT_DAY('08-08-25','MONDAY') FROM DUAL;

SELECT NEXT_DAY(to_date('08-08-25','DD-MM-YY'),'MONDAY') FROM DUAL;

SELECT MONTHS_BETWEEN(SYSDATE,'25-JAN-2003') FROM DUAL;

SELECT MONTHS_BETWEEN(SYSDATE,'25-JAN-2003')/12 AS YEAR FROM DUAL;

SELECT EXTRACT(YEAR FROM SYSDATE) FROM DUAL;
SELECT EXTRACT(MONTH FROM SYSDATE) FROM DUAL;
SELECT EXTRACT(DAY FROM SYSDATE) FROM DUAL;


--------------------------------------------------------------------------------
--09/08/2025 SQL Session 9
/*
-->DDL(Data Defination Language) : CREATE , ALTER , DROP, RENAME , TRUNCATE [all DDL commands are auto-commited] --rollback is not work here
-->DML(Data Manupulation Language) : INSERT , UPDATE ,DELETE  [all DML Commands are not auto-commited]
-->TCL(Transaction Control Language) : COMMIT , ROLLBACK 
-->DQL(Data Query Language)/Data Retrival: SELECT
*/

SELECT * FROM EMP;

COMMIT;

ROLLBACK;

Delete from EMP
where empno=7934;
COMMIT;

ROLLBACK;


TRUNCATE TABLE EMP;

ROLLBACK;

DROP TABLE EMP;


ROLLBACK;
Delete from EMP
where empno=7934;

--Note:
--Drop: delete complete table[with rows and col]
--Truncate will delete all the rows from table[col will remain]
--delete will used to delete any perticular records with where condition
    --but if you use the delete without where condition then it will work same as truncate.


rollback;

RENAME old_table_name TO new_table_name;

RENAME EMPLOYEE2 TO EMPLOYEE1;

--------------------------------------
SELECT * FROM EMP;
--Example 1: Add a New Column to a Table
ALTER TABLE EMP
ADD (ADDRESS Varchar2(100));

--Example 2: Modify an Existing Column
ALTER TABLE EMP
MODIFY (sal NUMBER(10, 2));

--Example 3: Drop a Column from a Table
ALTER TABLE EMP
DROP COLUMN ADDRESS;

--Example 4: Rename a Column
ALTER TABLE EMP
RENAME COLUMN JOB TO DESIGNATION;

SELECT EMPNO,JOB AS DESIGNATION FROM EMP;
SELECT * FROM EMP;

----------------------------------------------
--UPDATE:
SELECT * FROM EMP;
--Example 1: Update a Single Row
UPDATE EMP
SET sal = 5500
WHERE empno = 7369;

rollback;

--Example 2: Update Multiple Columns for a Row
UPDATE EMP
SET sal = 6000, DESIGNATION= 'IT_PROG', COMM=500
WHERE empno = 7369;
rollback; 

--Example 3: Update Multiple Rows Based on a Condition
UPDATE EMP
SET deptno = 40
WHERE DESIGNATION = 'MANAGER';

--Example 4: Update All Rows in a Table
UPDATE EMP
SET sal = sal +500;
rollback;
------------------------------------------------------------
--Session 10 [16/08/2025]
--Group By FUnctions
Select * from EMP;

Select ENAME,SAL from EMP
where SAL>2000;

Select count(*) from EMP;

Select ENAME,SAL from EMP
where SAL>2000;

Select COUNT(*) from EMP
where SAL>2000;

SELECT SUM(SAL),AVG(SAL),MAX(SAL),MIN(SAL) FROM EMP;

SELECT * FROM EMP;

SELECT DEPTNO,COUNT(*) AS EMP_COUNT FROM EMP
GROUP By DEPTNO ORDER BY DEPTNO;

SELECT MAX(SAL) FROM EMP;

SELECT SAL AS SALARY FROM EMP
WHERE SAL>2000;

SELECT deptno,MAX(SAL)AS Highest_paid FROM EMP
group by deptno order by deptno;

SELECT designation AS JOB,MAX(SAL)AS Highest_paid FROM EMP
group by designation order by designation;

SELECT designation AS JOB,MAX(SAL)AS Highest_paid FROM EMP
group by designation order by JOB;

Select ENAME,SAL from EMP
where SAL>1500;


Select count(*) from EMP;
Select count(1) from EMP;

Select count(*),count(1),count(82369),count(ename),count(comm) from EMP;

Select count(*),count(1),count(comm) from EMP;
Select * from EMP;
--5*100=500  1*100=100

Select MAX(SAL)from EMP;
Select MIN(SAL)from EMP;
Select AVG(SAL)from EMP;
Select COUNT(*)from EMP;

Select COUNT(*),MAX(SAL),MIN(SAL),AVG(SAL),SUM(SAL)from EMP;

Select DISTINCT DEPTNO from EMP;
Select deptno,MAX(COMM)from EMP group by deptno;

--I want count of all employees departmentwise
Select deptno,count(*) from EMP group by deptno;

--I want sum of sal of all employees departmentwise
Select deptno,job,SUM(SAL) from EMP group by deptno,job;

--I want sum of sal of all employees jobwise
Select job,SUM(SAL) from EMP group by job;

Select comm,deptno,designation,SUM(SAL) from EMP group by designation,deptno,comm;

--Note:when we are going to use group by functions, all columns in select statment other than group function column must be mention in group by clause.

-----------------------------------------------------------------------------------
--Session 11 [17/08/2025]
--group by with having clause

--I want Sum of sal departmentwise and sum of sal is greater than 10k
SELECT deptno,SUM(SAL)AS Total_Salary FROM EMP
group by deptno having SUM(SAL)>10000 order by deptno;

Select deptno As D_no,Sum(sal) as Total from EMP group by deptno;

--Note: we can not use alies in WHERE, HAVING and GROUP BY
--Note: We can use Alies in ORDER BY

SELECT DEPTNO,DESIGNATION,SUM(SAL) FROM EMP GROUP BY DEPTNO,DESIGNATION ORDER BY DEPTNO;
SELECT DEPTNO,DESIGNATION,SUM(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO,DESIGNATION);
SELECT DEPTNO,DESIGNATION,SUM(SAL) FROM EMP GROUP BY ROLLUP(DESIGNATION,DEPTNO);

SELECT DEPTNO,DECODE(JOB,null,'Dept_Total',JOB),SUM(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO,JOB);
SELECT DEPTNO,DESIGNATION,SUM(SAL) FROM EMP GROUP BY CUBE(DESIGNATION,DEPTNO);

--Write a query to display the first hire date from the employees table and calculate the date 24 months after that hire date.

Select Add_Months(MIN(hiredate), 24) Next_Date From EMP;

==============================================================================
--30-08-2025 [SQL Session 13]
SELECT * FROM EMP;
SELECT 
ENAME,
DESIGNATION,
SAL,
DECODE(SAL,
       5000,'Best Salary',
       3000,'Good Salary',
       2975,'Average Salary',
      'Poor Salary')As Sal_Category
FROM EMP;

/*
Decode will work like this:
If(Sal=5000)
then ==>Best Salary
else if (Sal=3000)
then Good Salary
else if (Sal=2975)
then Average salary
else Pooor Salary
*/

SELECT ENAME,DESIGNATION,SAL, 
CASE SAL
  WHEN 5000 THEN
   'GOOD SAL'
  WHEN 3000 THEN
     'NOT BAD SAL'
  WHEN 2975 THEN
     'BAD SAL'
  ELSE
   'POOR'
END AS SALARY_CATAGORY
FROM EMP;

SELECT 
    empno,
    deptno,
    sal,
    designation,
    CASE
        WHEN sal > 1000 AND deptno =10 THEN 'High Salary in Dept 10'
        WHEN sal BETWEEN 500 AND 3000 AND deptno IN (20, 30) THEN 'Mid Salary in Depts 20/30'
        WHEN sal < 5000 OR deptno = 20 THEN 'Low Salary or Dept 20'
        WHEN designation = 'CLERK' AND NOT (sal > 4000) THEN 'Clerk with Good Salary'
        ELSE 'Other'
    END AS salary_category
FROM 
    emp;

Select * from EMP;
---------------------------------------------------
--To_Date() and To_char() function

SELECT to_date('01-Jan-2025') AS CHANGE_DATE_FORMAT FROM DUAL;

SELECT to_char(to_date('01-Jan-2025'),'DD-MM-YYYY') AS CHANGE_DATE_FORMAT FROM DUAL;

--Extracting Fiscal Year (Assuming Fiscal Year Starts April)
--You can use TO_CHAR and CASE statements to create fiscal year labels.
SELECT 
    TO_CHAR(hiredate, 'YYYY') AS calendar_year,
    CASE 
        WHEN TO_CHAR(hiredate, 'MM') >= '04' THEN TO_CHAR(hiredate, 'YYYY') || '-' || (TO_CHAR(hiredate, 'YYYY') + 1)
        ELSE (TO_CHAR(hiredate, 'YYYY') - 1) || '-' || TO_CHAR(hiredate, 'YYYY')
    END AS fiscal_year
FROM EMP;
--To_Date and To_Char Function
/*
Note:
Syntax: To_Date(Date String,'Same format of Date string')===> Date value
Syntax: To_char(Date value,'the format we want');
*/
=====================================================================================
--31/08/2025 [SQL Session 14]
05 Jan 2024
Select Sysdate from Dual;

SHOW PARAMETER NLS_DATE_FORMAT;

 Create table Date_format 
 (
 ID Number(2),
 DT  Date
 );
 
Insert into Date_format values(1,'05jan2024');
Insert into Date_format values(2,to_date('05jan2024','DD-MM-YYYY')); ---[best practice said use explicity conversion]
Insert into Date_format values(3,to_date('05/Feb/24','DD-Mon-YYYY'));
Insert into Date_format values(4,to_char(to_date('05/Feb/24','DD-Mon-YYYY'),'DD-MM-YYYY'));
Insert into Date_format values(4,'02-12-1999');
Insert into Date_format values(7,to_char(to_date('03-11-1998'),'DD-MM-YY'));   
Insert into Date_format values(6,to_char(to_date('03-11-1999'),'DD-MM-YY'));

Select * from Date_format;
 
Select to_date(String_date,'DD-MM-YYYY') from DUAL;

Select to_char(to_Date('05-Jan-2024','DD-MON-YYYY'),'DD-MM-YY')As Date_FT from Dual;
Select to_char(sysdate,'DD-MON-YYYY')As Date_FT from Dual;
Select SYSDATE from Dual;
----------------------------------------------------------------------------
--07/09/2025
--Joins
create table A
(
id number(5)
);
--drop table A;
Insert into A values(1);
Insert into A values(2);
Insert into A values(3);
Insert into A values(NULL);

select * from A;

create table B
(
id number(5)
);

Insert into B values(NULL);
Insert into B values(4);
Insert into B values(3);
Insert into B values(NULL);
Insert into B values(1);
Insert into B values(1);
Insert into B values(2);

select * from B;

select Count(*) from A x inner join B z on x.id = z.id;
select Count(*) from A left outer join B on A.id = B.id;
select Count(*) from A right outer join B on A.id = B.id;
select Count(*) from A full outer join B on A.id = B.id;

select A.id, B.id from A inner join B on A.id = B.id;
select A.id, B.id from A left outer join B on A.id = B.id;
select A.id, B.id from A right outer join B on A.id = B.id;
select A.id, B.id from A full outer join B on A.id = B.id;

select Count(*) from B inner join A on B.id = A.id;
select Count(*) from B left outer join A on B.id = A.id;
select Count(*) from B right outer join A on B.id = A.id;
select Count(*) from B full outer join A on B.id = A.id;



create table C
(
id number(5)
);

Insert into C values(1);
Insert into C values(1);
Insert into C values(1);
Insert into C values(NULL);

select * from C;
--drop table c;
create table D
(
id number(5)
);

Insert into D values(1);
Insert into D values(1);
Insert into D values(1);
Insert into D values(NULL);
Insert into D values(NULL);

select * from D;

select Count(*) from C inner join D on C.id = D.id;
select Count(*) from C left outer join D on C.id = D.id;
select Count(*) from C right outer join D on C.id = D.id;
select Count(*) from C full outer join D on C.id = D.id;


select Count(*) from D inner join C on D.id = C.id;
select Count(*) from D left outer join C on D.id = C.id;
select Count(*) from D right outer join C on D.id = C.id;
select Count(*) from D full outer join C on D.id = C.id;

--Self Join
--Q. Display the name of Employees with his Manager name 
Select e.empno, e.ename, f.ename as Manager from EMP e ,EMP f where e.mgr=f.empno;
================================================================================
--SQL Session 18 [20/09/2025]
--Sub-Query
SELECT * FROM EMP;
SELECT MAX(SAL) FROM EMP; --5000

--Q1: DISPLAY 2ND HIGHEST SALARY
SELECT MAX(SAL) FROM EMP where sal<(SELECT MAX(SAL) FROM EMP);

--Q2: DISPLAY 3RD HIGHEST SALARY
Select MAX(SAL) FROM EMP;--5000

SELECT MAX(SAL) FROM EMP WHERE SAL< 5000;--3000

SELECT MAX(SAL) FROM EMP WHERE SAL< 3000;

SELECT MAX(SAL) FROM EMP WHERE SAL<(SELECT MAX(SAL) FROM EMP WHERE SAL< (Select MAX(SAL) FROM EMP));

--Q3: DISPLAY NAME OF EMPLOYEE , WHOSE JOB as SAME AS JOB OF 2ND HIGHEST SALARY EMPLOYEE 

SELECT MAX(SAL) FROM EMP;
SELECT MAX(SAL) FROM EMP where sal<(SELECT MAX(SAL) FROM EMP);

SELECT DESIGNATION FROM EMP where SAL=(SELECT MAX(SAL) FROM EMP where sal<(SELECT MAX(SAL) FROM EMP));

SELECT ENAME FROM EMP where DESIGNATION IN(SELECT DESIGNATION FROM EMP where SAL=(SELECT MAX(SAL) FROM EMP where sal<(SELECT MAX(SAL) FROM EMP)));

--Q4: DISPLAY NAME OF EMPLOYEE , WHOSE JOB IS SAME AS JOB OF HIGHEST PAID EMPLOYEE OF DEPT 20

 SELECT MAX(SAL) FROM EMP WHERE DEPTNO=20;
 
 SELECT DESIGNATION FROM EMP where Sal=(SELECT MAX(SAL) FROM EMP WHERE DEPTNO=20);

SELECT ENAME FROM EMP WHERE DESIGNATION IN(SELECT DESIGNATION FROM EMP where Sal=(SELECT MAX(SAL) FROM EMP WHERE DEPTNO=20));

--Q5:DISPLAY NAME OF MANAGER
SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL;

SELECT ENAME FROM EMP where EMPNO IN(SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL);

--Q6. DISPLAY NAME OF WORKERS
SELECT ENAME FROM EMP where EMPNO NOT IN(SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL);

-------------------------------------------------------------------------
--SQL Session 19 [21/09/2025]
--ROWNUM: is assign during retrival or while selecting record. meaning it generated runtime
--Note: you can not use rownum=2, =3 =4... and > [we can use only rownum=1 & rownum< anynumber]
--ROWID: is permanent. It is created when we insert the records in table.It is physical address of record.

SELECT ROWNUM,ROWID,e.* FROM EMP e WHERE SAL> 1000;

--Display top records
SELECT SAL FROM EMP ORDER BY SAL DESC;
SELECT ROWNUM,SAL FROM EMP ORDER BY ROWNUM;

SELECT ROWNUM,SAL FROM(SELECT SAL FROM EMP ORDER BY SAL DESC)
WHERE ROWNUM <4;

--Display bottom records
SELECT SAL FROM EMP ORDER BY SAL ASC;

SELECT ROWNUM,SAL FROM(SELECT SAL FROM EMP ORDER BY SAL ASC)
WHERE ROWNUM <4;

--Display Highest sal
SELECT SAL FROM (SELECT SAL FROM EMP ORDER BY SAL DESC)
where rownum=1;

--DISPLAY the 2nd Highest sal
SELECT SAL FROM (SELECT SAL FROM EMP ORDER BY SAL DESC)
where rownum<=2
MINUS
SELECT SAL FROM (SELECT SAL FROM EMP ORDER BY SAL DESC)
where rownum=1;

--Display the 3rd Highest record
SELECT SAL FROM (SELECT DISTINCT SAL FROM EMP ORDER BY SAL DESC)
where rownum<=3
MINUS
SELECT SAL FROM (SELECT DISTINCT SAL FROM EMP ORDER BY SAL DESC)
where rownum<=2;

--4th highest
SELECT SAL FROM (SELECT DISTINCT SAL FROM EMP ORDER BY SAL DESC)
where rownum<=4
MINUS
SELECT SAL FROM (SELECT DISTINCT SAL FROM EMP ORDER BY SAL DESC)
where rownum<=3;

--nth highest
SELECT SAL FROM (SELECT DISTINCT SAL FROM EMP ORDER BY SAL DESC)
where rownum<=&num1
MINUS
SELECT SAL FROM (SELECT DISTINCT SAL FROM EMP ORDER BY SAL DESC)
where rownum<=&num2;

--lowest record
SELECT SAL FROM (SELECT DISTINCT SAL FROM EMP ORDER BY SAL ASC)
where rownum=1;

--DISPLAY the 2nd lowest sal
SELECT SAL FROM (SELECT DISTINCT SAL FROM EMP ORDER BY SAL ASC)
where rownum<=2
MINUS
SELECT SAL FROM (SELECT DISTINCT SAL FROM EMP ORDER BY SAL ASC)
where rownum=1;

----ROWID
CREATE TABLE DUPLICATE_TEST
(

NAME VARCHAR(50)
);
SELECT * FROM DUPLICATE_TEST;


SELECT DISTINCT NAME FROM DUPLICATE_TEST;

SELECT NAME, ROWID FROM DUPLICATE_TEST;

SELECT MAX(ROWID),NAME FROM DUPLICATE_TEST group by NAme;

SELECT MIN(ROWID),NAME FROM DUPLICATE_TEST group by NAme;

SELECT MAX(ROWID) FROM DUPLICATE_TEST group by NAme;

DELETE FROM DUPLICATE_TEST WHERE ROWID NOT IN(SELECT MAX(ROWID) FROM DUPLICATE_TEST group by NAme);

SELECT NAME,COUNT(*) FROM DUPLICATE_TEST group by name
having COUNT(*)>1;

SELECT COUNT(*) AS COUNT FROM DUPLICATE_TEST group by name
having COUNT(*)>1;


