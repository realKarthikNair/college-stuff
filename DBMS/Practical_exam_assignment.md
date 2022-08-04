1. Create the following tables S, P, J and SPJ for the Supplier-Parts-Projects Database
with the following structures:

![image](https://user-images.githubusercontent.com/78267371/182908559-06159d0f-5be8-4308-8295-7c7661df14b3.png)


**The QUERIES BELOW HAS SOME MISTAKES : I FORGOT TO PUT THE PRIMARY KEY, FOREIGN KEY AND NOT NULL CONSTRAINTS, PLUS SIZE OF COLUMNS TOO HAS MISTAKES. Change Accordingly**

```mysql
CREATE DATABASE IF NOT EXISTS `spjdatabase`;

USE `spjdatabase`;

CREATE TABLE IF NOT EXISTS `j` (
`jno` varchar(20) NOT NULL,
`jname` varchar(20) NOT NULL,
`city` varchar(20) NOT NULL
);


CREATE TABLE IF NOT EXISTS `p` (
`pno` varchar(20) NOT NULL,
`pname` varchar(20) NOT NULL,
`color` varchar(20) NOT NULL,
`pweight` int(11) NOT NULL,
`city` varchar(20) NOT NULL
);


CREATE TABLE IF NOT EXISTS `s` (
`sno` varchar(20) NOT NULL,
`sname` varchar(20) NOT NULL,
`sstatus` int(11) NOT NULL,
`city` varchar(20) NOT NULL
);


CREATE TABLE IF NOT EXISTS `spj` (
`sno` varchar(20) NOT NULL,
`pno` varchar(20) NOT NULL,
`jno` varchar(20) NOT NULL,
`qty` int(11) NOT NULL
);
```


2. Insert the following values to the tables S, P, J & SPJ.

![image](https://user-images.githubusercontent.com/78267371/182909507-9723b182-4efc-4144-924e-439c742f8fd7.png)

```mysql
INSERT INTO `spjdatabase`.`s` (
`sno` ,
`sname` ,
`sstatus` ,
`city`
)
VALUES ('S1', 'Smith', '20', 'London'),
('S2', 'Jones', '10', 'Paris'),
('S3', 'Blake', '30', 'Paris'),
('S4', 'Clark', '20', 'London'),
('S5', 'Adams', '30', 'Athens');



INSERT INTO `spjdatabase`.`p` (
`pno` ,
`pname` ,
`color` ,
`pweight` ,
`city`
)
VALUES ('P1', 'Nut', 'Red', '12', 'London'),
('P2', 'Bold', 'Green', '17', 'Paris'),
('P3', 'Screw', 'Blue', '17', 'Rome');


INSERT INTO `spjdatabase`.`j` (
`jno` ,
`jname` ,
`city`
)
VALUES ('J1', 'Sorter', 'Paris'),
('J2', 'Display', 'Rome'),
('J3', 'OCR', 'Athens'),
('J4', 'Console', 'Athens'),
('J5', 'Raid', 'London');


INSERT INTO `spjdatabase`.`spj` (
`sno` ,
`pno` ,
`jno` ,
`qty`
)
VALUES
('S1', 'P1', 'J1', '200'),
('S1', 'P1', 'J4', '700'),
('S2', 'P3', 'J1', '400'),
('S2', 'P3', 'J2', '200'),
('S2', 'P3', 'J3', '200'),
('S2', 'P3', 'J4', '500'),
('S4', 'P3', 'J5', '600'),
('S5', 'P2', 'J4', '100'),
('S5', 'P1', 'J4', '100'),
('S5', 'P3', 'J4', '200');
```
3. Get the maximum and minimum quantity for each part.

```mysql
select pno,min(qty), max(qty) from spj group by pno;
```
4. Get suppliers names who supply part p3.
```mysql
select s.sname from spj inner join s ON spj.sno = s.sno where pno='p3';
```

5. Get the supplier number, supplier names for suppliers who supply project J1.
```mysql
select s.sno,sname from spj inner join s ON spj.sno = s.sno where jno='j1';
```

6. Get part numbers of parts supplied by a supplier in London.
```mysql
select pno  from p where pno
 in(select pno from spj where sno in 
 (select sno from s where city='LONDON'));
```

7. Get part numbers of parts supplied by a supplier in London to a project in London.
Solution:
```mysql
select pno from spj where jno in
 (select jno from j where city = 'london' ) and sno in 
 (select sno from s where city= 'london'); 
```

8. Get project numbers and cities where the city has an "o" as the second letter of its name.
```mysql
select pno, city from p where city like '_o%';
```
9. Get project names for project supplied by supplier S1.
```mysql
SELECT jname FROM   j WHERE  EXISTS (SELECT * FROM   spj 
 WHERE  spj.jno = j.jno AND    sno = 'S1');
```
10. Get colors for parts supplied by supplier S1.
```mysql
 SELECT p.COLOR FROM p WHERE p.PNO IN 
 (SELECT DISTINCT PNO FROM spj WHERE SNO='S1');
```

11. Get part numbers for parts supplied to any project in London.
```mysql
select distinct pno,jno from spj where jno in 
 (select jno from j where city='london');
```

12. Get the second minimum status from suppliers.
```mysql
select min(SSTATUS) from s where SSTATUS > (select min(SSTATUS) from s) ;
```
