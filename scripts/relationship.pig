-- Load data from HDFS
traces = LOAD '/user/data/branch_trace.csv' USING PigStorage(',') AS (
    branch_addr: chararray,
    branch_type: chararray,
    taken: int,
    target: chararray
);

relationship = FOREACH (GROUP traces BY branch_type) {
    taken_sum = SUM(traces.taken);
    taken_avg = AVG(traces.taken);
    GENERATE group AS branch_type:chararray, taken_sum AS taken_sum:long, taken_avg AS taken_avg:double;
};
DUMP relationship;