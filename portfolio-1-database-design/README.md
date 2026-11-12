# NovaBank Digital Banking System
## Portfolio 1: Database Design and Modelling

### 1. Project Overview

NovaBank is a simulated digital banking system that provides financial services to individual customers through digital banking channels.

The database is designed to support customer management, account administration, card management, beneficiary registration, deposits, transfers, transaction recording and audit activities.

The project uses PostgreSQL to implement a relational database that maintains data consistency, supports banking operations and provides a foundation for reporting and analysis.

### 2. Database Design

The database consists of seven related entities:

| Entity | Purpose |
|---|---|
| Customers | Stores customer information and account-holder details. |
| Accounts | Stores customer bank accounts, account types, balances and statuses. |
| Cards | Stores payment card information associated with accounts. |
| Beneficiaries | Stores customer-approved beneficiary details. |
| Transactions | Stores overall transaction information. |
| Transaction_Entries | Records individual debit and credit entries associated with transactions. |
| Audit_Logs | Records customer-related activities for audit purposes. |

### 3. Relationships and Keys

The database uses primary keys to uniquely identify records and foreign keys to maintain relationships between tables.

The implemented relationships include:

- Customers to Accounts: One-to-Many.
- Customers to Beneficiaries: One-to-Many.
- Customers to Audit_Logs: One-to-Many.
- Accounts to Cards: One-to-Many.
- Accounts to Transaction_Entries: One-to-Many.
- Transactions to Transaction_Entries: One-to-Many.

Primary keys and foreign keys are implemented across the seven tables to support referential integrity.

Additional constraints are used to enforce data quality, including unique customer contact details, unique account numbers, valid account and card statuses, and positive transaction-entry amounts.

### 4. Normalisation

The database design applies the principles of First Normal Form (1NF), Second Normal Form (2NF) and Third Normal Form (3NF).

- **1NF:** Attributes are stored in separate fields, and repeating groups are represented as separate records.
- **2NF:** Tables use primary keys to identify records, with non-key attributes associated with their respective records.
- **3NF:** Customer, account, card, beneficiary, transaction and audit information are separated into related tables to reduce duplication and avoid unnecessary dependencies.

A more detailed explanation is provided in `NORMALISATION.md`.

### 5. Database Implementation

The database was implemented using PostgreSQL 18.6.

The implementation includes:

- Seven relational tables.
- Primary and foreign key relationships.
- Unique, CHECK and default constraints.
- Sample customer, account, card, beneficiary, transaction, transaction-entry and audit-log records.
- SQL queries for retrieval, aggregation, filtering and reporting.

The database contains sample records to demonstrate its operations.

### 6. Sample Data and Transaction Scenarios

The sample dataset contains 21 records across the seven tables.

The implementation demonstrates deposit and transfer scenarios.

A sample deposit of ₦100,000 is recorded as a successful transaction. A subsequent ₦50,000 transfer is represented by a debit entry from the sending account and a credit entry to the receiving account.

This approach separates the overall transaction record from its individual account entries.

### 7. SQL Queries and Analysis

The project includes analytical queries demonstrating:

- SELECT statements and filtering using WHERE.
- Retrieval of customer and account information using INNER JOIN.
- Aggregation using SUM.
- Grouping using GROUP BY.
- Record counting using COUNT.
- Sorting using ORDER BY.
- Retrieval of transaction and transaction-entry information.

The queries are available in `SQL Queries/Analysis_Queries.sql`.

### 8. Project Files

| File or folder | Description |
|---|---|
| `schema.sql` | PostgreSQL database structure and constraints. |
| `data.sql` | Sample database records. |
| `Novabank_data.sql` | Original PostgreSQL data export. |
| `SQL Queries/` | Individual table creation scripts and analytical queries. |
| `ER Diagram (1).png` | Entity Relationship Diagram. |
| `NORMALISATION.md` | Explanation of the normalisation approach. |

### 9. Conclusion

The NovaBank database provides a relational structure for managing core digital banking information and operations.

The implementation demonstrates database modelling, relational table creation, key relationships, integrity constraints, sample data population and SQL-based analysis.

The design provides a foundation for the subsequent portfolio activities involving query optimisation, transaction management, NoSQL databases and distributed database concepts.
