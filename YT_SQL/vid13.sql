CREATE TABLE employee(
 id INT,
 name VARCHAR(500),
 location VARCHAR(500)
);

CREATE TABLE employee_delhi(
 id INT,
 name VARCHAR(500)  
);

INSERT INTO employee VALUES(1,'Suraj Yadav','Bengaluru'),
(2,'Yashoda Sharma','Chennai'),
(3,'Pawan Rathore','Nagpur');

INSERT INTO employee_delhi VALUES(56,'Utkarsh Kumar'),
(57,'Deepak Vaidya');

select * from employee;
select * from employee_delhi;

select id,name,location ,5*id ticket_no from employee
 UNION ALL
select id,name , 'Delhi' ,5*id ticket_no from employee_delhi;