
-- Portfolio 3: Concurrency Test
-- Session B: Second transaction

BEGIN;

UPDATE public.accounts
SET current_balance = current_balance - 30000
WHERE account_id = 1;

-- This UPDATE waits while Session A holds the row lock.
-- It proceeds after Session A commits.

COMMIT;
