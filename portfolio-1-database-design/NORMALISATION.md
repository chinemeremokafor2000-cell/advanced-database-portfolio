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
## 7. Normalisation Validation

The NovaBank database was reviewed against the requirements of First, Second and Third Normal Forms.

| Normalisation Rule | Validation for NovaBank | Finding |
|---|---|---|
| 1NF | Attributes are stored in individual columns, and multiple accounts or transaction entries are represented as separate records. | Satisfied based on the implemented structure. |
| 2NF | Tables use single-column primary keys, with non-key attributes associated with their respective records. | No partial dependencies identified in the reviewed structures. |
| 3NF | Customer, account, card, beneficiary, transaction and audit information are maintained in separate related tables. | The design supports 3NF; functional dependencies require final verification. |

### Validation Observations

1. Customer information is maintained in the Customers table rather than repeatedly stored in account and transaction records.
2. Account information is separated from card information through the Accounts and Cards tables.
3. Transaction headers are separated from individual debit and credit entries through Transactions and Transaction_Entries.
4. Beneficiary and audit information are maintained independently and linked to customers through foreign keys.
5. Primary keys, foreign keys and additional constraints support record identification and referential integrity.

### Conclusion

The NovaBank database follows the structural principles of 1NF, 2NF and 3NF. The separation of business entities reduces unnecessary duplication and supports data consistency. The final functional dependency review is required to formally establish that every relation satisfies 3NF.