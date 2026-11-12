
CREATE TABLE accounts (
    account_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    account_number VARCHAR(20) UNIQUE NOT NULL,
    account_type VARCHAR(20) NOT NULL
        CHECK (account_type IN ('Savings', 'Current')),
    currency CHAR(3) DEFAULT 'NGN',
    current_balance NUMERIC(15,2) DEFAULT 0.00
        CHECK (current_balance >= 0),
    account_status VARCHAR(20) DEFAULT 'Active'
        CHECK (account_status IN ('Active', 'Inactive', 'Frozen', 'Closed')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_account_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

