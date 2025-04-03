-- 1211. Queries Quality and Percentage
-- Write a solution to find each query_name, the quality and poor_query_percentage.
-- Both quality and poor_query_percentage should be rounded to 2 decimal places.

select query_name,
       round(
          sum(rating / position) / count(query_name),
          2
       ) as quality,
       round(
          count(
             case
                when rating < 3 then
                   1
                else null
             end
          ) / count(query_name) * 100,
          2
       ) as poor_query_percentage
  from queries
 group by query_name;
