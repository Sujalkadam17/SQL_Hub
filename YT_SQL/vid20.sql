CREATE TABLE user_det_json(
 details VARCHAR(1000)
);

INSERT INTO user_det_json VALUES('{"name":"Akash Ahuja","address":{"state_info":{"name":"Maharashtra","short":"MH"},"city":"Pune"}}'),
('{"name":"Vishesh Deshmukh","address":{"state_info":{"name":"Gujarat","short":"GJ"},"city":"Surat"}}'),
('{"name":"Pankaj Taneja","address":{"state_info":{"name":"Tamil Nadu","short":"TN"},"city":"Madurai"}}');

select * from user_det_json;

select JSON_VALUE(details,'$.name') name,
		JSON_VALUE(details,'$.address.state_info.name') state,
		JSON_VALUE(details,'$.address.state_info.short') short,
		JSON_VALUE(details,'$.address.city') city

from user_det_json;

