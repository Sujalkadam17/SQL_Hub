/*1378. Replace Employee ID With The Unique Identifier
Write a solution to show the unique ID of each user, 
If a user does not have a unique ID replace just show null.*/

select eu.unique_id , e.name
from  EmployeeUNI eu 
right join Employees e 
on e.id = eu.id;
