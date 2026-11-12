
CREATE TABLE transaction_entries (
    entry_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    transaction_id BIGINT NOT NULL,

    account_id BIGINT NOT NULL,

    entry_type VARCHAR(10) NOT NULL
        CHECK (entry_type IN ('Debit', 'Credit')),

    amount NUMERIC(15,2) NOT NULL
        CHECK (amount > 0),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_entry_transaction
        FOREIGN KEY (transaction_id)
        REFERENCES transactions(transaction_id),

    CONSTRAINT fk_entry_account
        FOREIGN KEY (account_id)
        REFERENCES accounts(account_id)
        );

