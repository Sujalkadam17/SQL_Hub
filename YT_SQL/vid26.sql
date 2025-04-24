
CREATE TABLE student_info(
 seat_id INT,
 student_name VARCHAR(100)
);

INSERT INTO student_info VALUES(1,'Parvati'),
(2,'Rajesh'),
(3,'Aryan'),
(4,'Supriya'),
(5,'Prakash');

select * from student_info;

WITH cte AS
(
select	seat_id,student_name,
		LAG(student_name) OVER(ORDER BY seat_id) prev_emp,
		LEAD(student_name,1,student_name) OVER(ORDER BY seat_id) nxt_emp
		from student_info
	)
select seat_id, CASE WHEN seat_id%2=0 THEN prev_emp ELSE nxt_emp END student_name
from cte;