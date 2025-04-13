/* Interview eligibility
    -- --  1) candidate should  not attended 2 or more interviews
	-- --  2) candidate last attended data should be more than 180 days

	*/

CREATE TABLE candidate(
 id int,
 name varchar(50),
 interview_date date
);

INSERT INTO candidate VALUES(1525,'Radhika Kumari','2021-05-04'),
(1525,'Radhika Kumari','2022-12-23'),
(1837,'Samarth Gupta','2022-01-29'),
(1899,'Koyal Khatri','2023-01-09'),
(1985,'Vani Mitra','2023-05-05');

select * from candidate;

with candidate_cte as
(
select id, name,COUNT(name) total_interviews ,MAX(interview_date) latest_interview_date
from candidate
group by id,name
)select *,DATEDIFF(DAY,latest_interview_date,GETDATE()) total_duration,
CASE WHEN total_interviews>=2 OR DATEDIFF(DAY,latest_interview_date,GETDATE()) <=180 THEN 'NO' ELSE 'YES' END eligibilty
from candidate_cte
ORDER BY id;




