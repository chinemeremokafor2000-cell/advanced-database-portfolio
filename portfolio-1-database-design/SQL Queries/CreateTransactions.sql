
CREATE TABLE transactions (
    transaction_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    transaction_reference VARCHAR(50) UNIQUE NOT NULL,

    transaction_type VARCHAR(20) NOT NULL
        CHECK (transaction_type IN ('Deposit', 'Withdrawal', 'Transfer')),

    amount NUMERIC(15,2) NOT NULL
        CHECK (amount > 0),

    description TEXT,

    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    transaction_status VARCHAR(20) DEFAULT 'Pending'
        CHECK (transaction_status IN ('Pending', 'Successful', 'Failed', 'Reversed'))
        );