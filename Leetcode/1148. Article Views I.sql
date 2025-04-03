/*1148. Article Views I
Write a solution to find all the authors that viewed at least one of their own articles.*/

select distinct(author_id) as id
from Views
where author_id = viewer_id
order by author_id;
