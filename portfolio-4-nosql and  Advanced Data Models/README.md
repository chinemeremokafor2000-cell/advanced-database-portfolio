# Portfolio 4: NoSQL and Advanced Data Models

## 1. Introduction

This activity explores NoSQL database concepts using MongoDB Atlas for the NovaBank Digital Banking System. The exercise demonstrates document-oriented data modelling, embedded documents, data retrieval and aggregation.

## 2. MongoDB Environment

- Database platform: MongoDB Atlas
- Cluster: NovaBankCluster
- MongoDB version: 8.0.37
- Deployment: Replica Set – 3 nodes
- Database: novabank_nosql

## 3. Database Implementation

Two collections were created:

| Collection | Documents | Purpose |
|---|---:|---|
| customers | 3 | Stores customer details, embedded accounts and beneficiaries |
| transactions | 3 | Stores deposit, withdrawal and transfer records |

The customer collection uses embedded documents and arrays to store related account and beneficiary information within customer records.

The transactions collection stores transaction references, customer identifiers, transaction types, amounts, descriptions, statuses and timestamps.

## 4. Query and Aggregation Exercises

### 4.1 Document Retrieval

MongoDB queries were used to retrieve customer and transaction records.

### 4.2 Filtered Query

A query filtering transactions by transaction type was executed:

`{ transaction_type: "Transfer" }`

**Result:** One matching transfer document was returned, with reference NVB-NOSQL-003.

### 4.3 Aggregation

The MongoDB aggregation framework was used with `$group` and `$sum` to calculate the total transaction value and transaction count.

**Observed result:**
- Total transaction value: ₦175,000
- Transaction count: 3

## 5. Why MongoDB Fits the Use Case

MongoDB's document model allows related customer information, such as accounts and beneficiaries, to be embedded within a single document. This can reduce the need for multiple joins when retrieving customer information.

The flexible document structure also supports different transaction attributes and evolving data requirements.

However, a banking system still requires careful validation, access controls and transaction consistency mechanisms. A document database does not automatically replace the need for strong financial transaction controls.

## 6. Conclusion

The exercise demonstrated the use of MongoDB Atlas to create a NoSQL database, store customer and transaction documents, retrieve filtered records and perform aggregation. It also demonstrated how embedded documents provide an alternative to the relational table structure implemented in Portfolio 1.

## 7. Evidence and Files

The `evidence` folder contains screenshots of the MongoDB database, inserted documents, filtered query and aggregation result.

Supporting files:
- `mongodb_customers.json`
- `mongodb_transactions.json`
- `mongodb_queries.js`