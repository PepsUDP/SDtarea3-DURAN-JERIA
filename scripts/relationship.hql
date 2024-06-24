INSERT OVERWRITE TABLE branch_type_relationship
SELECT branch_type, SUM(taken) AS taken_sum, AVG(taken) AS taken_avg 
FROM branch_trace 
GROUP BY branch_type;