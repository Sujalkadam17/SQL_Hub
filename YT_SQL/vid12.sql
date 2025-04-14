--segregating credits and debits

CREATE TABLE retail(
 id int,
 name varchar(100),
 amt decimal(10,2)
);

INSERT INTO retail VALUES(45,'Tshirt',620),
(45,'Tshirt',-100),
(45,'Tshirt',-800),
(45,'Tshirt',150),
(89,'Shoes',1000),
(89,'Shoes',1100),
(89,'Shoes',-3800);

select * from retail;


	select id,name,SUM(CASE WHEN amt<0 THEN amt ELSE 0 END )Credit,
	SUM(CASE WHEN amt<0 THEN 0 ELSE amt END )Debit
	from  retail
	GROUP BY id,name
	ORDER BY id;
