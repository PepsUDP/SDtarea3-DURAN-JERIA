-- Load data from HDFS
traces = LOAD '/user/data/branch_trace.csv' USING PigStorage(',') AS (
    branch_addr: chararray,
    branch_type: chararray,
    taken: int,
    target: chararray
);

-- Total number of entries
total_entries = FOREACH (GROUP traces ALL) GENERATE COUNT(traces) AS total_entries;
DUMP total_entries;