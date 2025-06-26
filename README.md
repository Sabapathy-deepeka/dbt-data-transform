Welcome to your new dbt project!


# DBT Data Pipeline using S3 and Snowflake


---

## Overview

- **Data Source:** [MovieLens dataset](https://grouplens.org/datasets/movielens/)
- **Cloud Storage:** Amazon S3
- **Data Warehouse:** Snowflake


### DBT Core

### Models

Materializations:
- Views -  runs on top of source data, so will always have latest records.No additional data storage. Might be slow for complex queries.
- Tables - New data in underlying source table is not automatically added, could be fast/slow depending on complexity
- Incremental - Allows to insert/update records since the last time model was run.
- Ephemeral - Not built into database(No need for table/views), instead write a logic using CTE and reuse it with the model identifier.
- Materialized Views - Stores the data, runs the query on top of source so we also get updated    latest records.(Combination of views and tables)
					 You can also do incremental loading in materialized views.

### Seeds
Seeds are utilized to quickly create a table from the local file.

## Steps

### 1. Create User and Role in Snowflake

1. **Create a Role:**
    ```sql
    CREATE ROLE movielens_role;
    ```

2. **Create a User:**
    ```sql
    CREATE USER movielens_user PASSWORD='YourSecurePassword' DEFAULT_ROLE=movielens_role MUST_CHANGE_PASSWORD=TRUE;
    ```

3. **Grant Role to User:**
    ```sql
    GRANT ROLE movielens_role TO USER movielens_user;
    ```

4. **Grant Privileges on Database and Schema:**
    ```sql
    GRANT USAGE ON DATABASE movielens_db TO ROLE movielens_role;
    GRANT USAGE ON SCHEMA movielens_db.public TO ROLE movielens_role;
    GRANT CREATE TABLE ON SCHEMA movielens_db.public TO ROLE movielens_role;
    ```

5. **Grant Privileges on Tables and Future Tables:**
    ```sql
    GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA movielens_db.public TO ROLE movielens_role;
    GRANT SELECT, INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA movielens_db.public TO ROLE movielens_role;
    ```

---

### 2. Create a Stage for S3 Data in Snowflake

Replace the placeholders with your actual S3 bucket name and AWS credentials.

```sql
CREATE STAGE stage_table_name 
  URL='s3://s3-bucket-location' 
  CREDENTIALS=(AWS_KEY_ID='YOUR_AWS_KEY' AWS_SECRET_KEY='YOUR_AWS_SECRET');
```

---

### 3. Create a Destination Table

Modify the field names and types as per your dataset.

```sql
CREATE OR REPLACE TABLE table_name (
  field1 INTEGER,
  field2 STRING,
  field3 STRING
);
```

---

### 4. Load Data from S3 Using COPY INTO

Replace `s3-key-name` with the specific object key (file name) in your S3 bucket.

```sql
COPY INTO table_name 
  FROM '@stage_table_name/s3-key-name' 
  FILE_FORMAT = (
    TYPE = 'CSV'
    SKIP_HEADER = 1
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
  );
```



### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
