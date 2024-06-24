-- Load data from HDFS
traces = LOAD '/user/data/branch_trace.csv' USING PigStorage(',') AS (
    branch_addr: chararray,
    branch_type: chararray,
    taken: int,
    target: chararray
);

-- Sample a subset of data
sampled_data = SAMPLE traces 0.6;

-- Sample 10% of the data randomly
-- sampled_data = FILTER traces BY RANDOM() <= 0.1;

-- Frequency of each type of branch in the sampled data
branch_type_frequency = FOREACH (GROUP sampled_data BY branch_type) GENERATE
    group AS branch_type,
    COUNT(sampled_data) AS frequency;
DUMP branch_type_frequency;