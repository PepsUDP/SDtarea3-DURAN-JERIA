SELECT 
    branch_type, 
    COUNT(*) AS count_records,
    (COUNT(*) * 1.0 / total_entries.total_count) AS frequency
FROM 
    branch_trace,
    (SELECT COUNT(*) AS total_count FROM branch_trace) total_entries
GROUP BY 
    branch_type, 
    total_entries.total_count;