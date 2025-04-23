CREATE TABLE exams(
 student_id INT,
 student_name VARCHAR(500),
 physics INT,
 chemistry INT,
 maths INT
);

INSERT INTO exams VALUES(10,'Yashwant Muley',80,45,78),
(11,'Samaksh Sharma',98,79,85),
(20,'Neha Mishra',80,45,78),
(15,'Rishabh Upadhyay',76,91,83),
(18,'Suman Pathak',83,61,86),
(26,'Abhi Das',90,80,85),
(12,'Manish Gurunule',99,41,71),
(23,'Vinay Reddy',96,59,86);

select * from exams;

WITH rnk_cte as
(
select *, DENSE_RANK() OVER(ORDER BY physics DESC) phys_rnk,
DENSE_RANK() OVER(ORDER BY chemistry DESC) chem_rnk,
DENSE_RANK() OVER(ORDER BY maths DESC) maths_rnk
from exams
),top_cte as
(
select *, CASE WHEN phys_rnk=1 THEN 'Y' ELSE '' END phy_topper,
		CASE WHEN chem_rnk=1 THEN 'Y' ELSE '' END chem_topper,
		CASE WHEN maths_rnk=1 THEN 'Y' ELSE '' END math_topper
from rnk_cte
)
select student_id,student_name,physics,chemistry,maths,phy_topper,chem_topper,math_topper
from top_cte
where phy_topper='Y' or chem_topper='Y' or math_topper='Y' ;