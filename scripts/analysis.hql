SELECT branch_type, 
       COUNT(IF(taken = 1, 1, NULL)) AS taken_1_count, 
       COUNT(*) AS total, 
       COUNT(IF(taken = 1, 1, NULL)) / COUNT(*) AS proportion
FROM branch_trace 
GROUP BY branch_type;