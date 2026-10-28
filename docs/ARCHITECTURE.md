# Project Architecture

## Retail Customer Shopping Analytics Using Big Data

### 1. Architecture Diagram

```text
       Dunnhumby Complete Journey Dataset
                      |
                      v
             CSV Dataset Files
                      |
                      v
               Apache Hadoop
             Hadoop Distributed
               File System
                   (HDFS)
                      |
                      v
                  Apache Hive
             Data Tables and Queries
                      |
          +-----------+-----------+
          |           |           |
          v           v           v
     Customer      Product      Weekly
     Spending       Sales        Trends
          |           |           |
          +-----------+-----------+
                      |
                      v
            Analysis and Comparison
                      |
                      v
             TextFile vs RCFile
           Storage and Query Testing
```

### 2. Components

| Component | Purpose |
|---|---|
| Dunnhumby dataset | Provides retail transaction and customer-related data |
| Apache Hadoop | Provides the distributed storage and processing environment |
| HDFS | Stores dataset files across the Hadoop environment |
| Apache Hive | Defines tables and runs SQL-like analytical queries |
| TextFile | Provides the baseline text-based storage format |
| RCFile | Provides an alternative column-oriented storage format |
| Analysis queries | Explore sales, household spending, quantities, and weekly trends |

### 3. Project Workflow

1. Obtain and inspect the Dunnhumby dataset.
2. Configure the Hadoop environment.
3. Store the validated input data in HDFS.
4. Create Hive tables for the required dataset files.
5. Execute analytical queries.
6. Prepare compatible TextFile and RCFile tables.
7. Measure storage sizes and query execution times.
8. Document actual results and observations.

### 4. Distributed Environment

The intended lab setup uses a Hadoop master and worker systems connected to the same network. The final report should identify the actual nodes, hostnames, and roles used during testing.

**Note:** The architecture describes the intended workflow. Only mark components as implemented or tested after verifying them in the lab environment.
