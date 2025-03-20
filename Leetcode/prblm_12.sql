-- 1280. Students and Examinations
-- Write a solution to find the number of times each student attended each exam.
-- Return the result table ordered by student_id and subject_name.

SELECT
    S.student_id
    ,S.student_name
    ,SU.subject_name
    ,COUNT(E.student_id) attended_exams
FROM Students S
CROSS JOIN Subjects SU
LEFT JOIN Examinations E
    ON S.student_id = E.student_id
    AND SU.subject_name = E.subject_name

GROUP BY S.student_id, S.student_name, SU.subject_name
ORDER BY S.student_id , SU.subject_name
;