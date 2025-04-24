
Declare @input_date DATE;

set @input_date = '2004-9-13';

select @input_date input_date,EOMONTH(@input_date) as end_date, DATEADD(DAY,1,EOMONTH(@input_date,-1)) start_date;