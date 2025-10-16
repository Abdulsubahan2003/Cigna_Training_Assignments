CREATE TABLE Dept (
 Deptno NUMBER PRIMARY KEY,
 Dname VARCHAR2(20),
 Loc VARCHAR2(100)
);

CREATE TABLE Emps(
 Empno NUMBER PRIMARY KEY,
 Ename VARCHAR2(20),
 Jobname VARCHAR2(100),
 Sal NUMBER,
 Deptno  NUMBER(20) NOT NULL,
 CONSTRAINT fk_dept FOREIGN KEY (Deptno) REFERENCES Dept(Deptno) ON DELETE CASCADE
);

ALTER TABLE Emps MODIFY Deptno NUMBER NULL;

INSERT INTO Dept VALUES (1,'HR','BLR');
INSERT INTO Dept VALUES (2,'IT','Chennai');
INSERT INTO Dept VALUES (3,'Sales','Mumbai');
INSERT INTO Dept VALUES (4,'Marketing','Pune');
INSERT INTO Dept VALUES (5,'Accounting','Kovai');
INSERT INTO Dept VALUES (6,'Admin','Hong Kong');

--SELECT * FROM Emps;
INSERT INTO Emps VALUES (101,'Max','HARBP',80000,1);
INSERT INTO Emps VALUES (102,'Fayaz','It Support',90000,2);
INSERT INTO Emps VALUES (103,'Surya','Sales Assciate',60000,3);
INSERT INTO Emps VALUES (104,'Paavan','Product Marketing',60000,4);
INSERT INTO Emps VALUES (105,'Ekchit','Auditing',100000,5);
INSERT INTO Emps (Empno,Ename,Sal) VALUES (106,'Aden',60000);
INSERT INTO Emps VALUES (107,'Mark','It Support',100000,2);
INSERT INTO Emps VALUES (108,'Zuck','It Support',100000,2);
INSERT INTO Emps VALUES (109,'Poonam','It Support',100000,2);



--1.Display employee names along with their department names.
SELECT Emps.Ename,Dept.Dname 
from Dept
INNER JOIN Emps ON Dept.Deptno=Emps.Deptno;

--2.List all employees with their job titles and the location of their department.
SELECT Emps.Jobname, Dept.Loc
From Dept
INNER JOIN Emps ON Dept.Deptno=Emps.Deptno;

--3.Display employees who work in the SALES department.
SELECT Emps.* FROM Dept 
INNER JOIN Emps ON Dept.Deptno=Emps.Deptno
WHERE Dname='Sales';

--4.List all employees along with their department name and location, including departments that have no employees.
SELECT e.*,d.Dname,d.Loc 
FROM Dept d 
LEFT JOIN Emps e ON d.Deptno=e.Deptno; 

--5.Display all departments and employees, even if some employees are not assigned to any department.
SELECT d.Dname, e.Ename 
FROM Dept d 
RIGHT JOIN Emps e ON d.Deptno=e.Deptno;

--6.Show each department name and  total salary paid to its employees.
SELECT d.Dname, sum(e.Sal) AS Total_Sal
FROM Dept d
INNER JOIN Emps e ON d.Deptno=e.Deptno
GROUP BY d.Dname;

--7. Find departments that have more than 3 employees.  Display dname and no. of employees.
SELECT d.Dname , COUNT(*) 
FROM dept d INNER JOIN Emps e ON d.Deptno=e.Deptno
GROUP BY d.Dname
HAVING COUNT(*) >= 3;

--8.Display employees who work in the same location as the ACCOUNTING department.

SELECT e.Ename 
FROM Emps e 
INNER JOIN Dept d ON e.Deptno=d.Deptno
WHERE d.Loc=(SELECT Loc FROM Dept WHERE Dname='Accounting');

--9.For each department, display the employee who has the highest salary.
SELECT e.Ename,d.Dname,e.Sal FROM Emps e INNER JOIN Dept d ON e.Deptno=d.Deptno 
WHERE e.Sal IN(SELECT MAX(e.Sal) FROM Emps e
INNER JOIN Dept d ON e.Deptno=d.Deptno
GROUP BY d.DName);

--10.List employees whose salary is greater than the average salary of their department.

