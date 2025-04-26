CREATE TABLE file_details(
 file_id INT,
 file_location VARCHAR(1000)
);

INSERT INTO file_details VALUES(100,'D:\Movies\Kantara.mp4'),
(105,'D:\FabList\books\The Leader who had no title.pdf'),
(201,'E:\Programs\sql\fibo_script.sql'),
(511,'E:\Programs\sql\random.sql'),
(233,'D:\Movies\Watched\Voltage 420.mp4'),
(80,'D:\FabList\books\Tuesdays with Morrie.pdf');

select * ,LEFT(file_location,LEN(file_location) - CHARINDEX('\',REVERSE(file_location))+1) file_path,
		RIGHT(file_location,CHARINDEX('.',REVERSE(file_location))) extension,
		RIGHT(file_location,CHARINDEX('\',REVERSE(file_location))-1) file_name
from file_details;