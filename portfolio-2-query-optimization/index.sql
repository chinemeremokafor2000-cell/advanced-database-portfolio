CREATE INDEX idx_transaction_entries_account_id
ON public.transaction_entries (account_id);

ANALYZE public.transaction_entries;