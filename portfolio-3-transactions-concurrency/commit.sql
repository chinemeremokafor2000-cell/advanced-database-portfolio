
-- NOVABANK: COMMIT DEMONSTRATION

-- Check original balance
SELECT account_id, current_balance
FROM public.accounts
WHERE account_id = 1;

BEGIN;

-- Simulate a deposit of ₦100,000
UPDATE public.accounts
SET current_balance = current_balance + 100000
WHERE account_id = 1;

-- Confirm updated balance inside transaction
SELECT account_id, current_balance
FROM public.accounts
WHERE account_id = 1;

-- Permanently save the change
COMMIT;

-- Verify the committed balance
SELECT account_id, current_balance
FROM public.accounts
WHERE account_id = 1;
