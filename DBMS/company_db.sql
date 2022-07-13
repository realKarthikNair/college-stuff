create database company;
use company;

select DATABASE();

create table employee(
    fname varchar(15) not null,
    minit char,
    lname varchar(15) not null,
    ssn char(9) not null primary key,
    bdate date,
    address varchar(30),
    sex char,
    salary decimal(10,2),
    super_ssn char(9),
    dno int not null
);
 
create table department(
    dname varchar(15) not null unique,
    dnumber int not null primary key,
    mgr_ssn char(9) not null,
    mgr_start_date date
);


 alter table employee add foreign key (super_ssn) references employee(ssn);
 alter table employee add foreign key (dno) references department(dnumber);
 alter table department add foreign key (mgr_ssn) references employee(ssn);
 
create table dept_locations(
    dnumber int not null,
    dlocation varchar(15) not null,
    primary key (dnumber, dlocation)
);


create table project(
    pname varchar(15) not null unique,
    pnumber int not null primary key,
    plocation varchar(15),
    dnum int not null
);


alter table project add constraint foreign key (dnum) references department(dnumber);
alter table dept_locations add constraint foreign key (dnumber) references department(dnumber);
 
create table works_on(
    essn char(9) not null,
    pno int not null,
    hours decimal(3,1) not null,
    primary key (essn,pno)
);


alter table works_on add constraint foreign key (essn) references employee(ssn);
alter table works_on add constraint foreign key (pno) references project (pnumber);

create table dependent(
    essn char(9) not null,
    dependent_name varchar(15) not null,
    sex char,
    bdate date,
    relationship varchar(8),
    primary key (essn,dependent_name)
);


alter table dependent add constraint foreign key (essn) references employee (ssn); 

INSERT INTO employee (Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
VALUES ('John','B','Smith','123456789','1965-01-09','731 Fondren, Houston,
TX','M',30000,'333445555',5);
INSERT INTO employee (Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
VALUES ('Franklin','T','Wong','333445555','1955-12-08','638 Boss, Houston,
TX','M',40000,'888665555',5);
INSERT INTO employee (Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
VALUES ('Alicia','J','Zelaya','999887777','1968-01-19','3321 Castle, Spring,
TX','F',25000,'987654321',4);
INSERT INTO employee (Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
VALUES ('Jennifer','S','Wallace','987654321','1941-06-20','291 Berry, Bellaire,
TX','F',43000,'888665555',4);
INSERT INTO employee (Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
VALUES ('Ramesh','K','Narayan','666884444','1962-09-15','975 Fire Oak, Humble,
TX','M',38000,'333445555',5);
INSERT INTO employee (Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
VALUES ('Joyce','A','English','453453453','1972-07-31','5631 Rice, Houston,
TX','F',25000,'333445555',5);
INSERT INTO employee (Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
VALUES ('Ahmad','V','Jabbar','987987987','1969-03-29','980 Dallas, Houston,
TX','M',25000,'987654321',4);
INSERT INTO employee (Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
VALUES ('James','E','Borg','888665555','1937-11-10','450 Stone, Houston, TX','M',55000,null,1);

INSERT INTO department VALUES 
('Headquarters',1,'888665555','1981-06-19'),
('Administration',4,'987654321','1995-01-01'),
('Research',5,'333445555','1988-05-22');

INSERT INTO dept_locations (Dnumber,Dlocation) VALUES (1,'Houston');
INSERT INTO dept_locations (Dnumber,Dlocation) VALUES (4,'Stafford');
INSERT INTO dept_locations (Dnumber,Dlocation) VALUES (5,'Bellaire');
INSERT INTO dept_locations (Dnumber,Dlocation) VALUES (5,'Houston');
INSERT INTO dept_locations (Dnumber,Dlocation) VALUES (5,'Sugarland');

INSERT INTO project (Pname,Pnumber,Plocation,Dnum) VALUES ('ProductX',1,'Bellaire',5);
INSERT INTO project (Pname,Pnumber,Plocation,Dnum) VALUES ('ProductY',2,'Sugarland',5);
INSERT INTO project (Pname,Pnumber,Plocation,Dnum) VALUES ('ProductZ',3,'Houston',5);
INSERT INTO project (Pname,Pnumber,Plocation,Dnum) VALUES
('Computerization',10,'Stafford',4);
INSERT INTO project (Pname,Pnumber,Plocation,Dnum) VALUES
('Reorganization',20,'Houston',1);
INSERT INTO project (Pname,Pnumber,Plocation,Dnum) VALUES
('Newbenefits',30,'Stafford',4);

INSERT INTO works_on (Essn,Pno,Hours) VALUES ('123456789',1,32.5);
INSERT INTO works_on (Essn,Pno,Hours) VALUES ('123456789',2,7.5);
INSERT INTO works_on (Essn,Pno,Hours) VALUES ('333445555',2,10);
INSERT INTO works_on (Essn,Pno,Hours) VALUES ('333445555',3,10);
INSERT INTO works_on (Essn,Pno,Hours) VALUES ('333445555',10,10);
INSERT INTO works_on (Essn,Pno,Hours) VALUES ('333445555',20,10);
INSERT INTO works_on (Essn,Pno,Hours) VALUES ('453453453',1,20);
INSERT INTO works_on (Essn,Pno,Hours) VALUES ('453453453',2,20);
INSERT INTO works_on (Essn,Pno,Hours) VALUES ('666884444',3,40);
INSERT INTO works_on (Essn,Pno,Hours) VALUES ('987654321',20,15);
INSERT INTO works_on (Essn,Pno,Hours) VALUES ('987654321',30,20);
INSERT INTO works_on (Essn,Pno,Hours) VALUES ('987987987',10,35);
INSERT INTO works_on (Essn,Pno,Hours) VALUES ('987987987',30,5);
INSERT INTO works_on (Essn,Pno,Hours) VALUES ('999887777',10,10);
INSERT INTO works_on (Essn,Pno,Hours) VALUES ('999887777',30,30);   
INSERT INTO works_on (Essn,Pno,Hours) VALUES ('888665555',20,00);

INSERT INTO dependent (Essn,Dependent_name,Sex,Bdate,Relationship) VALUES
('123456789','Alice','F','1988-12-30','Daughter');
INSERT INTO dependent (Essn,Dependent_name,Sex,Bdate,Relationship) VALUES
('123456789','Elizabeth','F','1967-05-05','Spouse');
INSERT INTO dependent (Essn,Dependent_name,Sex,Bdate,Relationship) VALUES
('123456789','Michael','M','1988-01-04','Son');
INSERT INTO dependent (Essn,Dependent_name,Sex,Bdate,Relationship) VALUES
('333445555','Alice','F','1986-04-05','Daughter');
INSERT INTO dependent (Essn,Dependent_name,Sex,Bdate,Relationship) VALUES
('333445555','Joy','F','1958-05-03','Spouse');
INSERT INTO dependent (Essn,Dependent_name,Sex,Bdate,Relationship) VALUES
('333445555','Theodore','M','1983-10-25','Son');
INSERT INTO dependent (Essn,Dependent_name,Sex,Bdate,Relationship) VALUES
('987654321','Abner','M','1942-02-28','Spouse');

select * from employee;

select bdate, address from employee where fname = 'Franklin' and minit = 'T' and lname = 'Wong';

select distinct salary from employee;

select fname from employee where address like '%Bellaire%';

select * from employee where bdate between '1950-01-01 00:00:00' and '1959-12-31 23:59:59';

select * from employee where dno = '5' and salary between '50000' and '60000';

select fname from employee where super_ssn is NULL; 

select sum(salary), max(salary), min(salary), avg(salary) from employee;


select sum(salary) as SUM_of_Salary, max(salary) as Highest_Salary, 
min(salary) as Lowest_Salary, avg(salary) as Average_Salary from employee;


/* select fname, address from employee where department.dname = 'Research' join department.super_ssn on employee.ssn; */
select fname, address from employee a,department b  where b.dname = 'Research' and b.dnumber = a.dno;



# 11.


select project.pname, project.pnumber, project.dnum, employee.lname,
employee.address, employee.bdate from project inner join department,
employee where plocation = "Stafford" and dnum = department.dnumber 
and department.mgr_ssn = employee.ssn;

# 12.


update employee set salary=salary+(salary*15/100);
select fname,salary from employee;

# 13.
update employee inner join project on employee.dno=project.dnum 
set salary=salary+(salary*15/100) where project.pname="ProductX";
select fname,salary from employee 
inner join project on employee.dno=project.dnum where project.pname="ProductX";


# 14 

select dno,fname,pname from employee,project 
where employee.dno=project.dnum order by employee.dno,fname;

# 15.


select distinct(works_on.essn) from project inner join works_on 
where pnumber=works_on.pno and (plocation = "Bellaire" 
or plocation = "Houston" or plocation = "Stafford");

# 16.

select fname from employee where dno = 10 
group by salary, fname having salary>avg(salary);

# 17.
select dnumber as Dept_No, 
(select count(dno) from employee where department.dnumber=employee.dno) 
as Number_of_Employees, (select avg(salary) from employee where 
department.dnumber=employee.dno) as Avg_Salary from department;

/*select dno,count(dno),avg(salary) from employee group by dno;*/

# 18.


update employee set dno=4, salary=50000 where 
fname="Franklin" and minit="T" and lname="Wong";
select * from employee where fname="Franklin";

update employee set salary=50000,dno=4 where fname="Franklin";
select * from employee where fname="Franklin";


# 19.


insert into project values("NewProject", 63, "Toronto", 11);

insert into department values(
"Science", 11, 987987987, '1984-02-05');

insert into project values("NewProject", 63, "Toronto", 11);

# 20.

/*alter table employee drop hours;*/


alter table employee add hours decimal(3,1) not null;
alter table employee add foreign key (hours) references works_on(hours);
alter table employee drop foreign key dno;
