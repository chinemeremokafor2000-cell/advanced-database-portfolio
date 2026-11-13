# Portfolio 3: Transactions and Concurrency

## 1. Introduction

This activity examines transaction management and concurrency control in the NovaBank Digital Banking System using PostgreSQL. The practical exercises demonstrate transaction rollback, savepoints, commit operations, and how PostgreSQL handles simultaneous updates to the same account.

## 2. Transaction Management Exercises

### 2.1 Rollback

A transaction was initiated to modify the balance of account 1. The changes were subsequently rolled back.

**Result:** The database returned the account balance to its original value, demonstrating that uncommitted changes can be discarded.

### 2.2 Savepoint

A transaction was used to perform two balance deductions, with a savepoint created after the first deduction. The second deduction was rolled back to the savepoint, while the transaction was eventually rolled back completely.

**Result:** The savepoint allowed the transaction to return to an earlier point without immediately cancelling the entire transaction.

### 2.3 Commit

A deposit of ₦100,000 was applied to account 1 within a transaction and committed.

**Result:** The updated balance was saved permanently in the database and remained after the transaction ended.

## 3. Concurrency Control

Two separate PostgreSQL Query Tool sessions were used to simulate concurrent transactions against account 1.

- **Session A:** Initiated a transaction and deducted ₦50,000.
- **Session B:** Initiated another transaction and attempted to deduct ₦30,000 from the same account.
- **Observed behaviour:** Session B waited while Session A held the row lock.
- **Resolution:** After Session A committed, Session B proceeded and completed its update.

**Result:** PostgreSQL's row-level locking prevented both sessions from modifying the same account row simultaneously. This demonstrated how the database manages conflicting concurrent writes.

After both transactions committed successfully, the final balance of account 1 was **₦2,811,500**, reflecting both deductions from the previous balance of ₦2,891,500.

## 4. ACID Properties Demonstrated

| Property | Practical demonstration |
|---|---|
| Atomicity | Rollback and savepoint exercises |
| Consistency | Existing database constraints, including account balance checks |
| Isolation | Concurrent updates and row-level locking |
| Durability | Committed deposit remaining in the database |

## 5. Conclusion

The exercises demonstrated how PostgreSQL manages transactions and concurrent database operations. Rollback and savepoints provided control over uncommitted changes, while commit made changes permanent. The concurrency test also showed how row-level locking helps prevent conflicting updates to the same account record.

## 6. Evidence

Screenshots of the rollback, savepoint, commit, and concurrent session exercises are included in the `evidence` folder.

## 7. SQL Files

- `rollback.sql`
- `savepoint.sql`
- `commit.sql`
- `concurrency_session_a.sql`
- `concurrency_session_b.sql`