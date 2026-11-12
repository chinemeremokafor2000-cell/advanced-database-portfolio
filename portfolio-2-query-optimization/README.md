# Portfolio 2: Query Processing and Optimisation

## 1. Project Overview

This activity examines how PostgreSQL processes SQL queries and how indexing and database statistics influence query execution.

The NovaBank Digital Banking System was used as the case study. The experiment focused on retrieving transaction entries belonging to a specific bank account.

To create a more realistic banking workload, the database was populated with 5,000 additional synthetic transactions across 10 existing accounts, with 500 transactions generated per account. Each transaction was associated with a corresponding transaction entry.

This approach reflects a typical banking environment where a relatively small number of accounts can generate a high volume of transactions over time.

## 2. Objective

The objectives of this exercise were to:

- Examine query execution plans using PostgreSQL EXPLAIN ANALYZE.
- Understand sequential scans and index scans.
- Create an index on a frequently queried column.
- Compare query execution before and after indexing.
- Examine how PostgreSQL's query planner selects an execution strategy.
- Understand the role of database statistics in query optimisation.

## 3. Initial Query and Baseline Execution

The following query was used to retrieve transaction entries for account 1:

```sql
EXPLAIN ANALYZE
SELECT *
FROM transaction_entries
WHERE account_id = 1;
```

The initial experiment used a very small dataset. PostgreSQL selected a Sequential Scan because scanning the small table was considered less costly than using an index.

This demonstrated that indexing does not automatically improve query execution, particularly when the table contains very few records.

## 4. Expanding the Dataset

To simulate a more realistic banking workload, additional synthetic transactions were generated.

The simulation involved:

- 10 existing bank accounts.
- 500 additional transactions per account.
- 5,000 additional transaction records.
- 5,000 corresponding transaction entries.
- A mixture of deposit and withdrawal transactions.

The existing customer and account records were retained. The additional transactions were linked to existing accounts using their account identifiers.

This increased transaction volume without unnecessarily increasing the number of customers or accounts.

## 5. Index Creation

An index was created on the account_id column in the transaction_entries table.

```sql
CREATE INDEX idx_transaction_entries_account_id
ON public.transaction_entries (account_id);
```

The purpose of this index was to support queries that retrieve transaction entries belonging to a particular account.

Database statistics were updated using:

```sql
ANALYZE public.transaction_entries;
```

## 6. Execution Plan Comparison

The same query was executed against the expanded dataset, first without the index and then with the index.

### 6.1 Without the Index

PostgreSQL selected a Sequential Scan.

Observed results:

- Execution method: Sequential Scan.
- Rows returned: 502.
- Rows removed by filter: 4,701.
- Planning time: 0.389 ms.
- Execution time: 0.404 ms.

The database scanned the table and applied the account_id filter to identify the matching records.

### 6.2 With the Index

After creating the index, PostgreSQL selected a Bitmap Heap Scan supported by a Bitmap Index Scan.

Observed results:

- Execution method: Bitmap Heap Scan.
- Index used: idx_transaction_entries_account_id.
- Rows returned: 502.
- Index searches: 1.
- Planning time: 0.296 ms.
- Execution time: 0.365 ms.

The Bitmap Index Scan located the matching account entries through the index, while the Bitmap Heap Scan retrieved the corresponding records from the table.

## 7. Performance Analysis

| Measurement | Without Index | With Index |
|---|---:|---:|
| Execution strategy | Sequential Scan | Bitmap Heap Scan |
| Index usage | No | Yes |
| Rows returned | 502 | 502 |
| Planning time | 0.389 ms | 0.296 ms |
| Execution time | 0.404 ms | 0.365 ms |

The measured execution time decreased from 0.404 ms to 0.365 ms after indexing.

This represents an approximately 9.7% reduction in the measured execution time for this test.

The execution plan also confirmed that PostgreSQL used the newly created index to locate matching transaction entries.

However, the measured difference is small, and execution times can vary because of caching, system activity and measurement overhead. Further repeated tests on a larger dataset would be needed to establish a consistent performance improvement.

## 8. Key Findings

The experiment demonstrated the following:

1. Sequential scans can be appropriate for small tables because the overhead of using an index may outweigh its benefits.
2. Increasing transaction volume can change the execution strategy selected by PostgreSQL.
3. Creating an index on a frequently queried column can help PostgreSQL locate matching records without scanning every row.
4. PostgreSQL may use a Bitmap Index Scan and Bitmap Heap Scan rather than a conventional Index Scan.
5. The ANALYZE command updates database statistics and supports informed query planning.
6. Query optimisation should be evaluated using actual execution plans and measured results rather than assumptions.

## 9. Conclusion

The experiment demonstrated the practical role of indexing and query execution analysis in PostgreSQL.

By expanding the NovaBank transaction dataset and comparing execution plans before and after indexing, the exercise showed how PostgreSQL can change its query execution strategy based on available indexes and estimated query costs.

The results provide practical evidence of query processing, indexing and performance evaluation in a relational database environment.