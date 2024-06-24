-- Load data from HDFS
traces = LOAD '/user/data/branch_trace.csv' USING PigStorage(',') AS (
    branch_addr: chararray,
    branch_type: chararray,
    taken: int,
    target: chararray
);

-- Calculate basic statistics
stats = FOREACH (GROUP traces BY branch_type) {
    count_records = COUNT(traces);
    avg_taken = AVG(traces.taken);
    GENERATE group AS branch_type:chararray, count_records AS count_records:long, avg_taken AS avg_taken:double;
};

-- Display basic statistics
DUMP stats;
