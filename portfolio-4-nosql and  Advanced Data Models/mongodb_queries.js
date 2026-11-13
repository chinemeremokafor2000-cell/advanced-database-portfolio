
// NovaBank NoSQL Portfolio
// MongoDB queries using mongosh

// Select the database
use("novabank_nosql");

// 1. Retrieve all customers
db.customers.find();

// 2. Retrieve all transactions
db.transactions.find();

// 3. Find only transfer transactions
db.transactions.find({
  transaction_type: "Transfer"
});

// 4. Calculate total transaction value and count
db.transactions.aggregate([
  {
    $group: {
      _id: null,
      totalTransactionValue: { $sum: "$amount" },
      transactionCount: { $sum: 1 }
    }
  }
]);
