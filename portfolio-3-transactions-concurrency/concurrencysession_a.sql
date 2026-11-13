
-- Portfolio 3: Concurrency Test
-- Session A: First transaction

BEGIN;

UPDATE public.accounts
SET current_balance = current_balance - 50000
WHERE account_id = 1;

-- Session A holds the row lock until COMMIT.
-- Execute COMMIT after Session B is waiting.

COMMIT;
