CREATE TABLE cards (
    card_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    account_id BIGINT NOT NULL,

    masked_card_number VARCHAR(25) NOT NULL,

    card_type VARCHAR(20) NOT NULL
        CHECK (card_type IN ('Debit', 'Credit')),

    expiry_date DATE NOT NULL,

    card_status VARCHAR(20) DEFAULT 'Active'
        CHECK (card_status IN ('Active', 'Blocked', 'Expired')),

    CONSTRAINT fk_card_account
        FOREIGN KEY (account_id)
        REFERENCES accounts(account_id)