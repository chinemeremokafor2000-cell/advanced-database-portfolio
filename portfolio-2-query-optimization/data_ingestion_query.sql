
-- =====================================================
-- NOVABANK: REALISTIC TRANSACTION VOLUME SIMULATION
-- 10 existing accounts
-- 500 transactions per account
-- 5,000 transactions and 5,000 ledger entries
-- =====================================================

BEGIN;

-- Temporary mapping table for generated transactions
CREATE TEMP TABLE bulk_tx_map (
    transaction_reference VARCHAR(100) PRIMARY KEY,
    account_id BIGINT NOT NULL,
    transaction_type VARCHAR(50) NOT NULL,
    amount NUMERIC(15,2) NOT NULL,
    transaction_date TIMESTAMP NOT NULL
);

-- Generate 500 transactions for each of 10 accounts
INSERT INTO bulk_tx_map
    (transaction_reference, account_id,
     transaction_type, amount, transaction_date)
SELECT
    'NVB-BULK-' || LPAD(a.account_id::text, 4, '0')
        || '-' || LPAD(s.n::text, 6, '0'),

    a.account_id,

    CASE
        WHEN s.n % 10 < 6 THEN 'Deposit'
        ELSE 'Withdrawal'
    END,

    CASE
        WHEN s.n % 10 < 6
            THEN (5000 + (s.n % 11) * 1000)::NUMERIC(15,2)
        ELSE (1000 + (s.n % 7) * 500)::NUMERIC(15,2)
    END,

    CURRENT_TIMESTAMP - (s.n || ' hours')::INTERVAL

FROM public.accounts a
CROSS JOIN generate_series(1, 500) AS s(n)
WHERE a.account_id BETWEEN 1 AND 10;


-- Insert 5,000 transaction records
INSERT INTO public.transactions
    (transaction_reference, transaction_type,
     amount, description, transaction_date,
     transaction_status)
SELECT
    transaction_reference,
    transaction_type,
    amount,
    'Synthetic banking activity for account ' || account_id,
    transaction_date,
    'Successful'
FROM bulk_tx_map;


-- Insert corresponding ledger entries
INSERT INTO public.transaction_entries
    (transaction_id, account_id, entry_type, amount)
SELECT
    t.transaction_id,
    m.account_id,
    CASE
        WHEN m.transaction_type = 'Deposit' THEN 'Credit'
        ELSE 'Debit'
    END,
    m.amount
FROM bulk_tx_map m
JOIN public.transactions t
    ON t.transaction_reference = m.transaction_reference;


-- Update account balances to reflect the new transactions
UPDATE public.accounts a
SET current_balance =
    a.current_balance + totals.net_change
FROM (
    SELECT
        account_id,
        SUM(
            CASE
                WHEN transaction_type = 'Deposit' THEN amount
                ELSE -amount
            END
        ) AS net_change
    FROM bulk_tx_map
    GROUP BY account_id
) totals
WHERE a.account_id = totals.account_id;


COMMIT;

-- =====================================================
-- VERIFY GENERATED TRANSACTIONS
-- =====================================================

SELECT
    COUNT(*) AS generated_transactions,
    COUNT(DISTINCT account_id) AS accounts_involved,
    ROUND(SUM(amount), 2) AS total_transaction_value
FROM bulk_tx_map;
