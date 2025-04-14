-- Get the full name of the user consisting of fname mname lname

CREATE TABLE user_details(
 name VARCHAR(200),
 mname VARCHAR(200)
);

INSERT INTO user_details VALUES('Sachin Tendulkar','Ramesh'),
('Rahul Dravid','Sharad'),
('Sourav Ganguly','Chandidas'),
('Mahendra Dhoni','Singh');

select * from user_details;

WITH usr_cte AS
(
	select * ,CHARINDEX(' ',name) char_at,
	SUBSTRING(name,1,CHARINDEX(' ',name)-1) fname,
	SUBSTRING(name,CHARINDEX(' ',name)+1,DATALENGTH(name)) lname
	from user_details
)
	select *,CONCAT(SUBSTRING(name,1,CHARINDEX(' ',name)-1),' ',mname,' ',SUBSTRING(name,CHARINDEX(' ',name)+1,DATALENGTH(name))) Full_Name
from user_details;