/* Write your MySQL query statement below
  Employees can belong to multiple departments. When the employee joins other departments, they need to decide which department is their primary department.
  Note that when an employee belongs to only one department, their primary column is 'N'.
Write a solution to report all the employees with their primary department. 
  For employees who belong to one department, report their only department.*/
select employee_id , department_id
from Employee
where primary_flag ='Y'
or employee_id IN
(
    select employee_id 
    from Employee
    group by employee_id
    having count(department_id) = 1
) 
