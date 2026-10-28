# Retail Customer Analytics Using Big Data
### Dunnhumby – The Complete Journey Dataset

**A distributed Big Data Analytics project for exploring retail transactions, customer shopping behavior, and product purchasing patterns.**

## 1. Project Overview

Retail transaction datasets contain valuable information about customer purchases, product popularity, and shopping trends. Processing this data at scale requires suitable storage, data-processing, and analytical technologies.

This project uses the Dunnhumby Complete Journey retail dataset to explore a Big Data processing workflow using Hadoop, Hive, MapReduce, Pig, and MongoDB.

The project was developed in an Ubuntu Linux lab environment, with Hadoop configured for distributed processing across networked lab machines.

> **Project status:** The repository documents the implementation and experiments. Each technology, query, and benchmark should be marked complete only after its execution has been verified.

## 2. Objectives

- Configure a multi-node Hadoop environment with a master and worker node or nodes.
- Store and manage retail data using Hadoop Distributed File System (HDFS).
- Analyze structured transaction data using Apache Hive.
- Explore batch processing with Hadoop MapReduce.
- Transform and analyze data using Apache Pig.
- Explore document-based storage and aggregation using MongoDB.
- Compare Hive storage formats, including RCFile, using a consistent experimental method.
- Document installation, execution, outputs, and troubleshooting for reproducibility.

## 3. Dataset

**Dataset:** Dunnhumby – The Complete Journey

The dataset contains retail shopping transactions and supporting information about products, households, campaigns, coupons, and related retail activities.

Commonly distributed files include:

| File | Description |
|---|---|
| `transaction_data.csv` | Transaction and purchase records |
| `product.csv` | Product information |
| `hh_demographic.csv` | Household demographic information |
| `campaign_desc.csv` | Campaign descriptions |
| `campaign_table.csv` | Household campaign associations |
| `causal_data.csv` | Product and store causal information |
| `coupon.csv` | Coupon information |
| `coupon_redempt.csv` | Coupon redemption records |

The exact filenames and columns depend on the dataset release.

### Dataset preparation

1. Obtain the dataset from an authorized source.
2. Extract the files into a local data directory.
3. Inspect column names, data types, delimiters, and missing values.
4. Identify the files required for each experiment.
5. Upload the required data to HDFS and prepare the appropriate tables or collections.

**Data policy:** The raw dataset is not included in this repository. Follow the provider's terms and attribution requirements.

## 4. Technology Stack

| Technology | Role |
|---|---|
| Ubuntu Linux | Operating system |
| Java 11 | Java runtime and MapReduce development |
| Apache Hadoop 3.3.6 | Distributed storage and processing |
| HDFS | Distributed file storage |
| Apache Hive 4.0.1 | SQL-based data analysis |
| Apache Pig 0.18.0 | Data transformation using Pig Latin |
| MongoDB | Document storage and aggregation |
| Git and GitHub | Version control and project documentation |

Versions above reflect the lab setup where recorded. Confirm the versions on each machine before reproducing the project.

## 5. System Architecture

```text
           Dunnhumby Dataset
                   |
                   v
         Data Preparation
                   |
                   v
        +--------------------+
        | Hadoop Master Node |
        | NameNode / YARN    |
        +--------------------+
                   |
          Networked Workers
                   |
                   v
         Hadoop Distributed
          File System (HDFS)
                   |
       +-----------+-----------+
       |           |           |
       v           v           v
     Hive       MapReduce      Pig
       |           |           |
       +-----------+-----------+
                   |
           Analysis Results

       MongoDB Analytics Path
       Dataset -> Import -> Queries
```

The diagram illustrates the intended processing workflow. The final implementation should document the services actually running on each machine and whether MongoDB was used independently or integrated into the broader workflow.

## 6. Installation and Environment Setup

### 6.1 Prerequisites

- Ubuntu Linux on the master and worker machines.
- Network connectivity between cluster machines.
- Java installed with a consistent version.
- Apache Hadoop configured on every participating node.
- SSH access for Hadoop's remote service management.
- Apache Hive and Pig configured as required by the experiments.
- MongoDB installed on the machine used for the document database experiment.
- Sufficient storage for the dataset, temporary files, and query outputs.

### 6.2 Install Java

Check the Java version:

```bash
java -version
```

Install OpenJDK 11 on Ubuntu if it is not installed:

```bash
sudo apt update
sudo apt install openjdk-11-jdk
```

Set the Java home path for the lab environment:

```bash
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
```

Verify the configuration:

```bash
echo $JAVA_HOME
java -version
```

Add the environment variables to `~/.bashrc` if they should persist across terminal sessions.

### 6.3 Configure Hadoop

Extract the Hadoop distribution and configure the environment variables. For the recorded lab installation:

```bash
export HADOOP_HOME=$HOME/hadoop-3.3.6
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH
```

Verify the installation:

```bash
hadoop version
```

Configure the Hadoop XML files for the actual cluster:

- `core-site.xml`
- `hdfs-site.xml`
- `mapred-site.xml`
- `yarn-site.xml`

Configure the workers file with the real worker hostnames. Set the correct hostname, IP address, NameNode directory, DataNode directory, and resource-manager settings for the lab network.

Enable passwordless SSH for the appropriate lab account if required by the cluster startup procedure. Do not publish private keys or credentials.

### 6.4 Start and verify Hadoop

On the designated master node, use the configured Hadoop scripts to start HDFS and YARN:

```bash
start-dfs.sh
start-yarn.sh
```

Check the HDFS report:

```bash
hdfs dfsadmin -report
```

Check the node processes:

```bash
jps
```

Check the web interfaces using the ports configured in the lab:

- NameNode web interface: commonly port `9870`
- ResourceManager web interface: commonly port `8088`

Confirm that the expected DataNodes and NodeManagers are active before running distributed jobs.

**Important:** Do not format the NameNode again on an existing cluster just to restart Hadoop. Formatting can destroy access to existing HDFS metadata.

### 6.5 Configure Apache Hive

Set the Hive environment variables according to the actual installation directory:

```bash
export HIVE_HOME=$HOME/apache-hive-4.0.1-bin
export PATH=$HIVE_HOME/bin:$PATH
```

Check the installation:

```bash
hive --version
```

Configure the required Hive settings and metastore for your environment. Ensure Hive can access the configured Hadoop installation and HDFS.

For repeatable use, document the actual metastore configuration, execution engine, and startup method used in the lab.

### 6.6 Configure Apache Pig

Set the environment variables according to the actual Pig installation path:

```bash
export PIG_HOME=/path/to/pig
export PATH=$PIG_HOME/bin:$PATH
```

Check the version:

```bash
pig -version
```

Replace `/path/to/pig` with the real directory on the lab system. Confirm compatibility with the Hadoop installation before running Pig scripts.

### 6.7 Verify MongoDB

Check the MongoDB service:

```bash
sudo systemctl status mongod
```

Start it if necessary and permitted:

```bash
sudo systemctl start mongod
```

Connect to the database shell:

```bash
mongosh
```

MongoDB installation and service commands can vary by distribution and package source.

## 7. Dataset Upload to HDFS

Create an HDFS directory for the project:

```bash
hdfs dfs -mkdir -p /user/$USER/dunnhumby/input
```

Upload a dataset file from the local filesystem:

```bash
hdfs dfs -put transaction_data.csv \
/user/$USER/dunnhumby/input/
```

Verify the uploaded file:

```bash
hdfs dfs -ls /user/$USER/dunnhumby/input
```

Inspect a few records:

```bash
hdfs dfs -cat \
/user/$USER/dunnhumby/input/transaction_data.csv | head
```

Repeat the upload for the other files needed by the experiments. The local filename and HDFS path must match your actual dataset and account configuration.

## 8. Hive Analysis

Hive enables SQL-style querying over data stored in Hadoop.

### Workflow

1. Inspect the dataset's column names and delimiter.
2. Define a table schema that matches the actual file.
3. Load or reference the data in HDFS.
4. Validate the row count and sample records.
5. Run analytical queries.
6. Save query outputs and execution evidence.

### Example analytical questions

- Which products have the highest purchase counts?
- How many transactions occur in a given period?
- Which households have the highest transaction activity?
- How do product purchasing patterns differ across time periods?

The SQL scripts should include the actual table definitions and tested queries. Do not assume a table schema without checking the dataset headers.

## 9. MapReduce Processing

Hadoop MapReduce supports distributed batch-processing jobs.

A typical job follows this workflow:

1. Read input data from HDFS.
2. Process records in the mapper.
3. Aggregate or reorganize intermediate records in the reducer.
4. Write results to HDFS.
5. Validate the output against a small sample or independent calculation.

Include the Java source files, compilation instructions, job command, and verified output in the `mapreduce/` directory.

Record any failed jobs and their resolution in the development notes rather than presenting unsuccessful output as a completed experiment.

## 10. Apache Pig Processing

Pig Latin provides a high-level approach to data transformation.

A typical workflow includes:

1. Load the required dataset.
2. Define fields and data types.
3. Filter invalid or irrelevant records.
4. Group or aggregate records.
5. Store the output in the selected destination.
6. Compare the result with a known sample.

Include the actual `.pig` scripts and the commands used to execute them.

## 11. MongoDB Analysis

MongoDB provides document-oriented storage and aggregation capabilities.

The workflow includes:

1. Select the relevant transaction data.
2. Import records using an appropriate import procedure.
3. Verify the collection and document count.
4. Create aggregation queries for retail analysis.
5. Validate the query results.
6. Record any indexes used and compare query behavior where relevant.

Example commands for a collection inspection:

```javascript
show dbs
use dunnhumby
show collections
db.transaction_data.countDocuments({})
```

These commands assume that the database is named `dunnhumby` and the collection is named `transaction_data`. Change the names to match the actual import.

Document the import command and any field-type conversions in the MongoDB section of the repository.

## 12. Hive Storage Format Experiment: RCFile

The project includes a planned comparison of Hive RCFile storage with a baseline format, such as text-based storage, if that is what the lab experiment uses.

### Experimental procedure

1. Use the same source records and schema.
2. Create equivalent tables with the selected storage formats.
3. Run the same analytical queries against each table.
4. Record the storage size and query execution time.
5. Repeat measurements under comparable conditions.
6. Compare the results and explain possible causes of the differences.

| Metric | Baseline format | RCFile |
|---|---|---|
| Storage size | Measure experimentally | Measure experimentally |
| Query execution time | Measure experimentally | Measure experimentally |
| Data-loading time | Measure experimentally | Measure experimentally |
| Query correctness | Validate results | Validate results |

Do not fill this table with estimated numbers. Include the actual measurements, query definitions, and environment details in the report.

## 13. Validation and Results

For every completed experiment, record:

- Input file and row count.
- Table or collection schema.
- Command or query executed.
- Output sample and row count.
- Execution status and errors.
- Runtime and storage measurements where applicable.
- Screenshot or log evidence.

All performance claims must be supported by measurements collected from the lab environment.

## 14. Repository Structure

```text
dunnhumby-customer-shopping-analytics/
├── README.md
├── .gitignore
├── docs/
│   ├── project-report.md
│   ├── architecture.md
│   └── rcfile-comparison.md
├── hive/
│   ├── create_tables.sql
│   ├── analysis_queries.sql
│   └── rcfile_experiment.sql
├── mapreduce/
│   ├── src/
│   └── README.md
├── pig/
│   ├── analysis.pig
│   └── README.md
├── mongodb/
│   ├── import_instructions.md
│   └── aggregation_queries.js
└── screenshots/
    ├── hadoop-cluster/
    ├── hive/
    ├── mapreduce/
    ├── pig/
    └── mongodb/
```

Create only the folders and files that are relevant to the actual project. Add a file-level README wherever setup instructions need to be explained separately.

## 15. Troubleshooting

### Hadoop workers are not visible

- Check network connectivity and hostnames.
- Verify SSH access.
- Inspect the workers configuration.
- Check NameNode, DataNode, ResourceManager, and NodeManager logs.

### Hive cannot access HDFS

- Verify Hadoop environment variables.
- Check that HDFS is running.
- Verify file permissions and the configured Hive execution environment.

### MongoDB import fails

- Check the input path and delimiter.
- Verify the field types and import options.
- Inspect the database logs and import output.

### MapReduce job fails

- Check the Java compilation and runtime versions.
- Inspect the job logs.
- Confirm that the HDFS input and output paths are correct.
- Check whether the output directory already exists.

## 16. Learning Outcomes

This project provides practical experience in:

- Distributed storage and cluster configuration.
- Hadoop and HDFS operations.
- SQL-based data analytics using Hive.
- Batch processing with MapReduce.
- Data transformation using Pig.
- Document-based querying using MongoDB.
- Experimental evaluation of data storage formats.
- Technical documentation and reproducible workflows.

## Project Documentation

Explore the documentation and scripts below.

| File | Description |
|---|---|
| [`docs/INSTALLATION.md`](docs/INSTALLATION.md) | Environment installation and setup guide |
| [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) | Project architecture and workflow |
| [`docs/RCFILE_VS_TEXTFILE.md`](docs/RCFILE_VS_TEXTFILE.md) | Comparison of Hive storage formats |
| [`docs/EXECUTION_CHECKLIST.md`](docs/EXECUTION_CHECKLIST.md) | Project execution and verification checklist |
| [`data/README.md`](data/README.md) | Dunnhumby dataset guide |
| [`hive/create_tables.sql`](hive/create_tables.sql) | Starter Hive table definition |
| [`hive/analysis_queries.sql`](hive/analysis_queries.sql) | Hive retail analytics queries |
| [`mongodb/analysis_queries.js`](mongodb/analysis_queries.js) | MongoDB aggregation queries |
| [`results/README.md`](results/README.md) | Experimental results and observations |

## Project Status

- **Documentation:** Prepared in the repository.
- **Hive and MongoDB scripts:** Added as starter scripts; verify against the actual data and schema.
- **TextFile vs RCFile experiment:** Measurements pending verification.
- **Distributed Hadoop execution:** Record the actual lab configuration and successful test evidence before claiming completion.

## Reproducibility

Commands, table schemas, and query scripts must be checked against the installed software versions and actual dataset structure. Report only results that have been successfully reproduced and verified.

## Future Improvements

- Add verified query outputs and screenshots.
- Record storage-size and query-time measurements.
- Add troubleshooting notes for Hadoop, Hive, and MongoDB.
- Document the actual master and worker configurations used in the lab.
## 17. References

- [Apache Hadoop Documentation](https://hadoop.apache.org/docs/)
- [Apache Hive Documentation](https://hive.apache.org/)
- [Apache Pig Documentation](https://pig.apache.org/)
- [MongoDB Documentation](https://www.mongodb.com/docs/)
- Dunnhumby – The Complete Journey dataset documentation and applicable usage terms.

---

**Project category:** Big Data Analytics | Data Engineering | Distributed Computing

**Author:** Arpitha T R 
