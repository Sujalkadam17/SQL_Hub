/*610. Triangle Judgement
Report for every three line segments whether they can form a triangle.*/
--Triangle Inequality Theorem
/*𝑎 + b > 𝑐
𝑎 + 𝑐 > 𝑏
𝑏 + 𝑐 > 𝑎*/

SELECT * , CASE WHEN x + y > z and x + z > y and y + z > x
                    then 'Yes' else 'No' END as triangle
from Triangle
