-- INSERT OVERWRITE TABLE branch_type_frequency
-- SELECT branch_type, COUNT(*) AS frequency
-- FROM branch_trace
-- TABLESAMPLE(1000000 ROWS)
-- GROUP BY branch_type;


-- Sample 10% of the data randomly
INSERT OVERWRITE TABLE branch_type_frequency
SELECT branch_type, COUNT(*) AS frequency
FROM branch_trace
WHERE RAND() <= 0.1  -- Adjust 0.1 to the desired sampling percentage (e.g., 0.1 for 10%)
GROUP BY branch_type;