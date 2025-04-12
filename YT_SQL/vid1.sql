CREATE TABLE visit_log(
 user_id int,
 user_name varchar(20),
 user_visit_location varchar(20),
 user_visit_time datetime DEFAULT current_timestamp
);

INSERT INTO visit_log(user_id,user_name,user_visit_location,user_visit_time) VALUES(108,'Shivangi Kumari','Bengaluru','2022-08-01 01:15:00.980'),
(123,'Yuvraj Sinha','Jaipur','2022-08-25 03:55:00.050'),
(108,'Shivangi Kumari','Pune','2022-08-06 09:23:00.510'),
(108,'Shivangi Kumari','Mumbai','2022-08-06 22:00:05.100'),
(159,'Priti Dubey','Lucknow','2022-08-28 10:20:00.260'),
(123,'Yuvraj Sinha','Bengaluru','2022-08-25 20:13:00.110'),
(159,'Priti Dubey','Chennai','2022-08-20 06:00:00.560'),
(120,'Jai Dixit','Delhi','2022-08-11 08:25:00.430');

select * from visit_log;

select	user_id,user_name,user_visit_location,user_visit_time
from
(
select *,rank() over(Partition by user_id,datepart(day,user_visit_time)order by user_visit_time desc) rnk
from visit_log
) t
where rnk=1;

