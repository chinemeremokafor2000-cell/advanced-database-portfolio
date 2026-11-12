
-- NovaBank: Query Optimisation Experiment

-- 1. Baseline execution plan
EXPLAIN ANALYZE
SELECT *
FROM transaction_entries
WHERE account_id = 1;

-- 2. Create index
CREATE INDEX idx_transaction_entries_account_id
ON transaction_entries (account_id);

-- 3. Examine execution plan after index creation
EXPLAIN ANALYZE
SELECT *
FROM transaction_entries
WHERE account_id = 1;

-- 4. Update table statistics
ANALYZE transaction_entries;

-- 5. Examine final execution plan
EXPLAIN ANALYZE
SELECT *
FROM transaction_entries
WHERE account_id = 1;
