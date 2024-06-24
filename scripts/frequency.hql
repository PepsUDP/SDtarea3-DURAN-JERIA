INSERT OVERWRITE TABLE branch_type_frequency
SELECT branch_type, COUNT(*) AS count_records
FROM branch_trace
GROUP BY branch_type;