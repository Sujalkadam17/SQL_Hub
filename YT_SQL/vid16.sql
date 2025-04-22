CREATE TABLE quiz(
 quizDate date,
 empId int,
 empName varchar(100),
 result varchar(10),
 score int
);

INSERT INTO quiz VALUES('2022-04-01',45,'Ram Singh','Fail',20),
('2022-04-02',49,'Kiran Deol','Pass',87),
('2022-04-09',45,'Ram Singh','Pass',49),
('2022-04-18',23,'Shruti Badajena','Fail',33),
('2022-04-03',49,'Kiran Deol','Pass',98),
('2022-08-22',23,'Shruti Badajena','Fail',34),
('2022-05-06',44,'Mayank Nigam','Pass',39),
('2022-06-06',44,'Mayank Nigam','Fail',30),
('2022-08-23',23,'Shruti Badajena','Fail',30);

select * from quiz;

WITH emp_cte AS
(
select empId ,MIN(quizDate) comment
from quiz
WHERE result='Pass'
GROUP BY empId
)
select q.*,
	CASE WHEN comment is null or q.quizDate<= e.comment THEN 'Valid' ELSE 'Invalid' END comment
from quiz q left join emp_cte e
on q.empId=e.empId
order by empName,quizDate;
