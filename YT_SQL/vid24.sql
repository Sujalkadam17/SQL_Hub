CREATE TABLE state_info(
 name VARCHAR(100),
 capital VARCHAR(100),
 literacy_rate DECIMAL(5,2)
);

INSERT INTO state_info VALUES
('Rajasthan','Jaipur',69.7),
('Tripura','Agartala',87.75),
('Chhattisgarh','Raipur',77.3),
('Goa','Panaji',87.4),
('Mizoram','Aizawl',91.58),
('Gujarat','Gandhinagar',79.31),
('Haryana','Chandigarh',80.4),
('West Bengal','Kolkata',80.5),
('Nagaland','Kohima',80.11),
('Uttar Pradesh','Lucknow',87.6),
('Assam','Dispur',85.9),
('Jharkhand','Ranchi',74.3),
('Uttarakhand','Dehradun',73),
('Karnataka','Bengaluru',77.2),
('Arunachal Pradesh','Itanagar',66.95),
('Kerala','Thiruvananthapuram',96.2),
('Madhya Pradesh','Bhopal',73.7),
('Sikkim','Gangtok',82.2),
('Maharashtra','Mumbai',84.8),
('Manipur','Imphal',79.85),
('Bihar','Patna',70.9),
('Meghalaya','Shillong',75.48),
('Orissa','Bhubaneswar',77.3),
('Punjab','Chandigarh',83.7),
('Andhra Pradesh','Amaravathi',66.4),
('Telangana','Hyderabad',72.8),
('Tamil Nadu','Chennai',82.9),
('Himachal Pradesh','Shimla',86.6);

select * from state_info;

select *
from state_info
order by CASE WHEN name ='GOA' THEN '1' 
			WHEN name ='TAMIL NADU' THEN '2'	
			ELSE '3' END, name;