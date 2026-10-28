# Installation and Execution Guide

This guide describes the setup and execution workflow for the Dunnhumby Customer Shopping Analytics project.

## 1. Project Requirements

The project uses the following technologies from the recorded college lab environment:

- Ubuntu Linux
- OpenJDK 11
- Apache Hadoop 3.3.6
- Apache Hive 4.0.1
- Apache Pig 0.18.0
- MongoDB

The original experiments were performed on college lab systems. The instructions below describe the general workflow; configuration details may need adjustment for a different computer or cluster.

## 2. Install Java

Check whether Java is installed:

```bash
java -version
```

Install OpenJDK 11 on Ubuntu if required:

```bash
sudo apt update
sudo apt install openjdk-11-jdk
```

Configure Java for the recorded lab environment:

```bash
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
```

Verify the installation:

```bash
java -version
echo $JAVA_HOME
```

## 3. Configure Hadoop

The recorded Hadoop directory was:

```text
/home/jss/hadoop-3.3.6
```

Set the environment variables for that installation:

```bash
export HADOOP_HOME=$HOME/hadoop-3.3.6
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH
```

Check the Hadoop version:

```bash
hadoop version
```

For distributed execution, configure the following files:

- `core-site.xml`
- `hdfs-site.xml`
- `mapred-site.xml`
- `yarn-site.xml`
- `workers`

The master and worker systems must have compatible Java and Hadoop installations, correct hostnames, network connectivity, and appropriate SSH access.

### Start and verify the cluster

Run the following commands on the configured master node:

```bash
start-dfs.sh
start-yarn.sh
hdfs dfsadmin -report
jps
```

Check that the expected DataNodes and NodeManagers are active.

**Warning:** Do not format an existing NameNode as part of routine startup. Formatting can make existing HDFS data inaccessible.

## 4. Upload the dataset to HDFS

Obtain the Dunnhumby Complete Journey dataset from an authorized source.

Create an input directory:

```bash
hdfs dfs -mkdir -p /user/$USER/dunnhumby/input
```

Upload a transaction file:

```bash
hdfs dfs -put transaction_data.csv \
/user/$USER/dunnhumby/input/
```

Verify the file:

```bash
hdfs dfs -ls /user/$USER/dunnhumby/input
```

Inspect a sample:

```bash
hdfs dfs -cat \
/user/$USER/dunnhumby/input/transaction_data.csv | head
```

Run these commands from a machine that has the file locally and can access the configured HDFS cluster.

## 5. Configure Apache Hive

The recorded Hive directory was:

```text
/home/jss/apache-hive-4.0.1-bin
```

Set the environment variables:

```bash
export HIVE_HOME=$HOME/apache-hive-4.0.1-bin
export PATH=$HIVE_HOME/bin:$PATH
```

Verify Hive:

```bash
hive --version
```

Configure the Hive metastore and Hadoop integration before running queries.

Example command to execute a SQL script:

```bash
hive -f hive/analysis_queries.sql
```

The command depends on the installed Hive client and configuration. Adjust the SQL file paths, table schemas, and HDFS locations to match your environment.

## 6. Configure Apache Pig

Set `PIG_HOME` to the directory where Pig was extracted:

```bash
export PIG_HOME=/path/to/pig
export PATH=$PIG_HOME/bin:$PATH
```

Verify Pig:

```bash
pig -version
```

Run a script after confirming the configuration:

```bash
pig pig/analysis.pig
```

Replace the example path with the actual Pig installation directory.

## 7. Configure MongoDB

Check the MongoDB service:

```bash
sudo systemctl status mongod
```

If MongoDB is installed and the service is stopped:

```bash
sudo systemctl start mongod
```

Open the MongoDB shell:

```bash
mongosh
```

Example commands:

```javascript
show dbs
use dunnhumby
show collections
db.transactions.countDocuments({})
```

The database and collection names must match those used during import.

## 8. Execute the Analysis

The general workflow is:

1. Inspect and prepare the source dataset.
2. Store the selected data in HDFS.
3. Create and validate Hive tables.
4. Execute SQL queries and record their outputs.
5. Run MapReduce and Pig experiments where configured.
6. Import appropriate records into MongoDB and run aggregation queries.
7. Compare Hive storage formats using identical input data and equivalent queries.
8. Document the actual results, errors, and execution times.

## 9. Reproducibility

For each experiment, record:

- Input files and row counts
- Software versions
- Commands and queries
- Execution status
- Output samples
- Runtime and storage measurements
- Any errors and their solutions

Do not report unverified commands or estimated benchmark values as completed experimental results.

## 10. Dataset and Security

The raw dataset is not included in this repository. Follow the dataset provider's terms when obtaining or redistributing it.

Never commit credentials, SSH private keys, or sensitive system configuration to GitHub.
