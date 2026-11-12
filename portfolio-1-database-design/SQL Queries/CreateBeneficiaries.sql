CREATE TABLE beneficiaries (
    beneficiary_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    customer_id BIGINT NOT NULL,

    beneficiary_name VARCHAR(150) NOT NULL,

    beneficiary_account_number VARCHAR(20) NOT NULL,

    bank_name VARCHAR(100) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_beneficiary_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT unique_customer_beneficiary
        UNIQUE (customer_id, beneficiary_account_number, bank_name)
        );