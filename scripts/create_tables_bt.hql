CREATE TABLE branch_type_frequency (
    branch_type STRING,
    frequency INT
);

CREATE TABLE branch_type_relationship (
    branch_type STRING,
    taken_sum INT,
    taken_avg DOUBLE
);

CREATE TABLE branch_trace (
    branch_addr STRING,
    branch_type STRING,
    taken INT,
    target STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;
LOAD DATA INPATH '/user/data/branch_trace.csv' INTO TABLE branch_trace;