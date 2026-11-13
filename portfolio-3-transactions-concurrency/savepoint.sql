
-- NOVABANK: SAVEPOINT DEMONSTRATION

BEGIN;

-- First withdrawal: ₦20,000
UPDATE public.accounts
SET current_balance = current_balance - 20000
WHERE account_id = 1;

-- Create savepoint
SAVEPOINT first_withdrawal;

-- Second withdrawal: ₦10,000
UPDATE public.accounts
SET current_balance = current_balance - 10000
WHERE account_id = 1;

-- Check balance after both withdrawals
SELECT account_id, current_balance
FROM public.accounts
WHERE account_id = 1;

-- Reverse only the second withdrawal
ROLLBACK TO SAVEPOINT first_withdrawal;

-- Check balance after partial rollback
SELECT account_id, current_balance
FROM public.accounts
WHERE account_id = 1;

-- Reverse the entire demonstration
ROLLBACK;

-- Confirm original balance
SELECT account_id, current_balance
FROM public.accounts
WHERE account_id = 1;
