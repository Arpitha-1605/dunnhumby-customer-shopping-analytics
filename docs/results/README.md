# Experimental Results and Observations

## 1. Objective

The objective is to analyze the Dunnhumby Complete Journey retail dataset using Hadoop and Hive and compare TextFile and RCFile storage formats.

## 2. Environment

| Component | Details |
|---|---|
| Operating system | Ubuntu 20.04.6 LTS |
| Java | OpenJDK 11 |
| Hadoop | Apache Hadoop 3.3.6 |
| Hive | Apache Hive 4.0.1 |
| Dataset | Dunnhumby Complete Journey |
| Storage formats | TextFile and RCFile |
| Execution environment | College lab Hadoop environment; node configuration to be verified |

## 3. Analytical Queries

The project includes queries designed to investigate:

- Total sales value and quantity.
- Number of unique households and baskets.
- Highest-selling products.
- Highest-spending households.
- Weekly sales trends.
- Retail and coupon discounts.

The queries and their results must be validated against the actual Hive table schema and loaded dataset.

## 4. TextFile vs RCFile Experiment

Both formats should contain equivalent records so the comparison is fair.

| Measurement | TextFile | RCFile |
|---|---|---|
| Record count | Pending measurement | Pending measurement |
| Storage size | Pending measurement | Pending measurement |
| Query execution time | Pending measurement | Pending measurement |
| Query result correctness | Pending verification | Pending verification |
| Compression configuration | To be recorded | To be recorded |

## 5. Experimental Procedure

1. Load the validated dataset into a Hive TextFile table.
2. Record the number of rows and storage size.
3. Create an RCFile table using a compatible Hive configuration.
4. Convert the same records into the RCFile table.
5. Verify that both tables contain equivalent data.
6. Execute the same analytical queries against both tables.
7. Record execution times and storage sizes.
8. Repeat the tests under comparable conditions.
9. Document the measured results and explain any differences.

## 6. Observation

No performance conclusion is made until the experiment has been executed and measurements have been collected. Results may depend on data volume, compression, query design, cache state, and Hadoop/Hive configuration.

## 7. Conclusion

The experiment will determine how TextFile and RCFile compare for the selected retail analytics workload. The final conclusion will be based on measured storage usage, query execution time, and result correctness.

## 8. Result Status

**Status:** Documentation prepared; experimental measurements pending verification on the lab environment.
