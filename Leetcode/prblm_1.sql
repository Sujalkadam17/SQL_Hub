--1757. Recyclable and Low Fat Products
--Write a solution to find the ids of products that are both low fat and recyclable.
select product_id 
from Products
where low_fats = 'Y' and recyclable = 'Y';
