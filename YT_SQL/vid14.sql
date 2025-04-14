CREATE TABLE user_det(
 name VARCHAR(100),
 place VARCHAR(100),
 age INT
);

INSERT INTO user_det VALUES('Kishan','Jaipur',54),
('Jiya','Chennai',17),
('Sayan','Kolkata',34),
('Mousami','Agra',27),
('MSD','Ranchi',40),
('Aryan','Hyderabad',78);


INSERT INTO user_det VALUES('ishan','Jaipur',54),
('LEO','Chennai',17),
('Sham','Kolkata',34),
('Monty','Agra',27),
('Monu','Ranchi',40),
('Ayush','Hyderabad',78);

select * from user_det;

select *,CONCAT(
	REPLACE(TRANSLATE(name,'aeiou','@@@@@'),'@',''),('-'),
	REPLICATE('0',6-len(ROW_NUMBER() OVER(order BY name))),
	ROW_NUMBER() OVER(order BY (select null))) user_id
	from user_det;