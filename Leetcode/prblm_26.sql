-- 1731. The Number of Employees Which Report to Each Employee
-- Write a solution to report the ids and the names of all managers, 
-- the number of employees who report directly to them, 
-- and the average age of the reports rounded to the nearest integer.
-- Return the result table ordered by employee_id.

with cte as (
    select e.employee_id , e.name , e1.employee_id as emp_id, e1.age
    from Employees e
    inner join Employees e1
    on e1.reports_to = e.employee_id
)
select employee_id , name , count(emp_id) as reports_count , round(avg(age)) as average_age
        from cte
        group by employee_id
        order by employee_id;