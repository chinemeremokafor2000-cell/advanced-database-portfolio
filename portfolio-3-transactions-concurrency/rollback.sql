BEGIN;

UPDATE public.accounts
SET current_balance = current_balance - 50000
WHERE account_id = 1;

SELECT account_id, current_balance
FROM public.accounts
WHERE account_id = 1;

ROLLBACK;

SELECT account_id, current_balance
FROM public.accounts
WHERE account_id = 1;