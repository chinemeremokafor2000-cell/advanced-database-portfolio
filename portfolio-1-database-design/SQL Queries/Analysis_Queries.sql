
-- NOVA BANK DATABASE
-- Analytical and Reporting Queries

-- 1. Retrieve customer and account details
SELECT
    customers.first_name,
    customers.last_name,
    accounts.account_number,
    accounts.account_type,
    accounts.current_balance
FROM customers
INNER JOIN accounts
    ON customers.customer_id = accounts.customer_id
ORDER BY customers.customer_id;


-- 2. Calculate total customer balances
SELECT
    SUM(current_balance) AS total_customer_balances
FROM accounts;


-- 3. Calculate total balance per customer
SELECT
    customers.customer_id,
    customers.first_name,
    customers.last_name,
    SUM(accounts.current_balance) AS total_balance
FROM customers
INNER JOIN accounts
    ON customers.customer_id = accounts.customer_id
GROUP BY
    customers.customer_id,
    customers.first_name,
    customers.last_name
ORDER BY total_balance DESC;


-- 4. Count total bank accounts
SELECT
    COUNT(*) AS total_accounts
FROM accounts;


-- 5. Retrieve accounts with balances above 250,000
SELECT
    account_number,
    account_type,
    current_balance
FROM accounts
WHERE current_balance > 250000
ORDER BY current_balance DESC;


-- 6. Summarise successful transactions by type
SELECT
    transaction_type,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount
FROM transactions
WHERE transaction_status = 'Successful'
GROUP BY transaction_type
ORDER BY transaction_type;


-- 7. Retrieve details of a specific account
SELECT
    account_number,
    account_type,
    current_balance
FROM accounts
WHERE account_id = 1;


-- 8. Retrieve transaction entries for a specific transaction
SELECT *
FROM transaction_entries
WHERE transaction_id = 2;
