/*595. Big Countries
Write a solution to find the name, population, and area of the big countries.*/

select name , population , area 
from World
where area >= 3000000  or population >= 25000000;