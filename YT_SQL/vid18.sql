CREATE TABLE sweet_customer(
 name VARCHAR(500),
 fabSweets VARCHAR(1000)
);

INSERT INTO sweet_customer VALUES('Ram Kumar','Laddoo,Sandesh'),
('Yogesh Kadam','Jalebi'),
('Vivek Rana',null),
('Palak Dubey','Mysore Pak,Barfi,Jalebi');

select * from sweet_customer;

select c.*,value
from sweet_customer c cross APPLY string_split(fabSweets,',');
