# BDA Project Execution Checklist

## 1. Environment Setup

- [ ] Verify Ubuntu and Java versions on each lab system.
- [ ] Verify Hadoop version on the master and worker systems.
- [ ] Configure hostnames and network connectivity.
- [ ] Configure SSH access between required systems.
- [ ] Configure Hadoop worker nodes.
- [ ] Start HDFS and YARN successfully.
- [ ] Verify the DataNodes and NodeManagers.

## 2. Dataset Preparation

- [ ] Obtain the Dunnhumby Complete Journey dataset.
- [ ] Verify the actual CSV filenames and column names.
- [ ] Check delimiters, headers, missing values, and data types.
- [ ] Upload the required dataset files to HDFS.
- [ ] Verify file availability and HDFS permissions.

## 3. Hive Analysis

- [ ] Create the project database.
- [ ] Create tables matching the actual dataset schemas.
- [ ] Load or query the validated transaction data.
- [ ] Calculate total sales and quantities.
- [ ] Analyze product-level sales.
- [ ] Analyze household spending.
- [ ] Analyze weekly sales.
- [ ] Examine discounts and coupon activity.
- [ ] Save successful query outputs for the report.

## 4. TextFile vs RCFile

- [ ] Create the TextFile table.
- [ ] Create the RCFile table with a compatible SerDe and storage configuration.
- [ ] Confirm that both tables contain equivalent records.
- [ ] Compare record counts and query results.
- [ ] Measure storage sizes.
- [ ] Measure query execution times under comparable conditions.
- [ ] Record actual observations and limitations.

## 5. MongoDB

- [ ] Verify that the MongoDB service is running.
- [ ] Import the intended dataset or selected records.
- [ ] Verify document counts.
- [ ] Execute and save relevant aggregation queries.
- [ ] Record successful outputs and any errors.

## 6. Final Report and GitHub

- [ ] Document the actual lab configuration and node roles.
- [ ] Add terminal outputs or screenshots where permitted.
- [ ] Complete the experimental results table with measured values.
- [ ] Explain limitations and troubleshooting steps.
- [ ] Check all README links and SQL filenames.
- [ ] Ensure no passwords, private keys, or sensitive data are committed.
- [ ] Verify that every claimed result is supported by evidence.

## Status Legend

- **Completed:** Successfully executed and verified.
- **Pending:** Not yet executed or not yet verified.
- **Blocked:** Requires troubleshooting or lab access.

Do not mark a task complete merely because its instructions or code have been added to GitHub.
