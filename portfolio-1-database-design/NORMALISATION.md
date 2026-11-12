# Database Normalisation – NovaBank Digital Banking System

## 1. Overview

The NovaBank database was designed using the principles of relational database normalisation to minimise data duplication, maintain data consistency and improve data integrity.

The database consists of seven related tables:

1. Customers
2. Accounts
3. Cards
4. Beneficiaries
5. Transactions
6. Transaction_Entries
7. Audit_Logs

The design applies First Normal Form (1NF), Second Normal Form (2NF) and Third Normal Form (3NF).

## 2. First Normal Form (1NF)

First Normal Form requires that each table has a primary key, each field contains a single atomic value, and repeating groups are eliminated.

In the NovaBank database, customer information such as first name, last name, email and phone number is stored in separate columns. Account details, card details and transaction information are also maintained in their respective tables.

For example, a customer's accounts are stored as separate records in the Accounts table rather than as multiple account values in a single customer record.

This ensures that each field stores one value and that records can be uniquely identified.

## 3. Second Normal Form (2NF)

Second Normal Form requires that the database satisfies 1NF and that every non-key attribute depends on the whole primary key, rather than only part of a composite key.

The NovaBank tables use primary keys to identify individual records. Most tables have single-column primary keys, which eliminates partial-key dependencies.

The Beneficiaries table also uses a uniqueness constraint involving the customer and beneficiary account/bank details to prevent duplicate beneficiary records for the same customer.

This structure ensures that attributes are associated with the appropriate records.

## 4. Third Normal Form (3NF)

Third Normal Form requires that the database satisfies 2NF and that non-key attributes depend only on the primary key, not on other non-key attributes.

NovaBank achieves this by separating different business entities into related tables.

Examples include:

- Customer details are maintained in the Customers table rather than repeated in Accounts, Cards and Transactions.
- Account information is stored in the Accounts table.
- Card information is maintained separately in the Cards table and linked to an account through a foreign key.
- Transaction details are stored in Transactions, while individual debit and credit entries are maintained in Transaction_Entries.
- Beneficiary information and customer audit activities are maintained in separate tables.

These relationships reduce unnecessary duplication and make updates easier to manage.

## 5. Benefits of Normalisation

The normalised design provides the following benefits:

- Reduces unnecessary duplication of customer and account information.
- Improves consistency when customer or account details are updated.
- Helps prevent insertion, update and deletion anomalies.
- Maintains referential integrity through primary and foreign key relationships.
- Supports accurate transaction recording and reporting.
- Makes the database easier to maintain and extend.

## 6. Conclusion

The NovaBank database separates customers, accounts, cards, beneficiaries, transactions, transaction entries and audit activities into related tables.

The design follows the principles of 1NF, 2NF and 3NF by maintaining atomic values, using primary keys and separating entities according to their relationships.

This provides a structured relational database suitable for supporting the core operations of a digital banking system.