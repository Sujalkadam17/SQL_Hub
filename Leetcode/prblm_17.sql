-- 1075. Project Employees I
-- Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

select p.project_id,
       round(
          sum(e.experience_years) / count(p.employee_id),
          2
       ) as average_years
  from project p
  left join employee e
on p.employee_id = e.employee_id
 group by p.project_id;