SELECT student_name, grade.*
FROM student, grade
WHERE student_name = 'Brian' AND student.student_id = grade.student_id 
ORDER BY grade.score