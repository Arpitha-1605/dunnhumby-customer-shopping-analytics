# RCFile vs TextFile in Apache Hive

## 1. Introduction

Apache Hive supports different file formats for storing and processing big data in Hadoop. This project documents a comparison between TextFile and RCFile using the Dunnhumby Complete Journey retail dataset.

## 2. TextFile

TextFile stores records as plain text. It is easy to read and inspect, making it suitable for simple data exchange and initial data loading.

**Advantages**
- Simple to understand and inspect.
- Easy to create from CSV or text data.
- Useful for raw data storage and debugging.

**Limitations**
- Text data can require more storage than compressed or column-oriented formats.
- Reading large datasets may require more parsing.
- Queries that need only a few columns may read more data than necessary.

## 3. RCFile

RCFile stands for Record Columnar File. It combines row-based grouping with column-oriented storage. It was designed to improve data storage and query processing in Hive.

**Advantages**
- Supports column-oriented storage within row groups.
- Can reduce the amount of data read for queries that select only certain columns.
- Supports compression.

**Limitations**
- Less convenient to inspect manually than plain text.
- Requires compatible Hive storage and SerDe configuration.
- Performance benefits depend on the query, dataset, configuration, and compression settings.

## 4. Comparison

| Feature | TextFile | RCFile |
|---|---|---|
| Storage style | Plain text records | Column-oriented storage within row groups |
| Human readability | High | Low |
| Ease of inspection | Easy | Requires suitable tools |
| Column selection | May read and parse more data | Can improve column-oriented reads |
| Compression | Supported through suitable configurations | Supported |
| Data loading | Simple for text/CSV input | Usually requires a compatible table definition or conversion |
| Typical use | Raw data and simple interchange | Analytical workloads in compatible Hive environments |

## 5. Proposed Experiment

The Dunnhumby Complete Journey transaction dataset can be used to compare the two formats.

### Experiment procedure

1. Inspect and validate the transaction CSV.
2. Create a Hive TextFile table and load the validated data.
3. Create a compatible RCFile table.
4. Convert or insert the same records into the RCFile table.
5. Run equivalent analytical queries against both tables.
6. Record the storage sizes and query execution times.
7. Repeat queries under comparable conditions and document the results.

### Metrics to record

- Number of records stored
- Storage size of each table
- Query execution time
- Query result consistency
- Compression settings and Hive configuration

## 6. Results

No benchmark results are reported in this document yet. Actual storage sizes and query timings must be measured on the project environment before drawing conclusions.

| Metric | TextFile | RCFile |
|---|---|---|
| Record count | To be measured | To be measured |
| Storage size | To be measured | To be measured |
| Query execution time | To be measured | To be measured |
| Query result consistency | To be verified | To be verified |

## 7. Conclusion

TextFile is simple and useful for storing raw text data, while RCFile is designed to support analytical processing through a column-oriented storage approach. The best choice should be determined by running equivalent queries and measuring the actual results on the same dataset and environment.

## 8. References

- Apache Hadoop: https://hadoop.apache.org/
- Apache Hive: https://hive.apache.org/
- Dunnhumby Complete Journey dataset: https://www.dunnhumby.com/source-files/
