# Portfolio 2: Query Processing and Optimisation

## 1. Objective

This activity examines how PostgreSQL executes SQL queries and how indexing and table statistics influence query planning and performance.

The NovaBank Digital Banking System was used as the case study. The experiment focused on retrieving transaction entries associated with a specific account.

## 2. Baseline Query

The following query was executed before creating an index:

```sql
EXPLAIN ANALYZE
SELECT *
FROM transaction_entries
WHERE account_id = 1;
```

### Baseline execution plan

- Scan method: Sequential Scan
- Rows returned: 2
- Planning time: 2.315 ms
- Execution time: 0.066 ms

PostgreSQL scanned the transaction_entries table and applied a filter to identify records belonging to account 1.

## 3. Index Creation

An index was created on the account_id column to support queries filtering transaction entries by account.

```sql
CREATE INDEX idx_transaction_entries_account_id
ON transaction_entries (account_id);
```

PostgreSQL successfully created the index.

The same EXPLAIN ANALYZE query was executed again.

### Execution plan after index creation

- Scan method: Sequential Scan
- Rows returned: 2
- Planning time: 3.485 ms
- Execution time: 0.094 ms

The query planner continued to use a sequential scan rather than the newly created index.

## 4. Table Statistics Update

The ANALYZE command was executed to update PostgreSQL's statistics about the table.

```sql
ANALYZE transaction_entries;
```

The original query was then executed again.

### Final execution plan

- Scan method: Sequential Scan
- Rows returned: 2
- Planning time: 1.187 ms
- Execution time: 0.052 ms

## 5. Performance Comparison

| Measurement | Before Index | After Index | After ANALYZE |
|---|---:|---:|---:|
| Scan method | Sequential | Sequential | Sequential |
| Planning time | 2.315 ms | 3.485 ms | 1.187 ms |
| Execution time | 0.066 ms | 0.094 ms | 0.052 ms |

## 6. Analysis and Findings

The experiment demonstrated that creating an index does not automatically result in an index scan or improved query performance.

The transaction_entries table contains only a small number of sample records. PostgreSQL's query planner determined that scanning the table directly was less costly than using the index.

Although the final measured execution time was lower, the execution plan remained unchanged. Therefore, the reduction cannot be attributed to index usage. The small dataset and execution-time variability limit the conclusions that can be drawn from this test.

The ANALYZE command updated the table statistics, allowing PostgreSQL to use current information when evaluating query execution options.

For a larger transaction dataset, the index may become more beneficial because it could reduce the number of records PostgreSQL needs to inspect.

## 7. Conclusion

The exercise demonstrated the use of EXPLAIN ANALYZE, index creation and table statistics management in PostgreSQL.

The findings highlight the importance of understanding query execution plans before assuming that an index has improved performance. Indexing decisions should be based on query patterns, table size and actual execution evidence.
