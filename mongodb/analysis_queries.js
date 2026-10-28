// Dunnhumby Complete Journey - MongoDB Analysis
// File: mongodb/analysis_queries.js
//
// IMPORTANT:
// These examples assume a collection named transaction_data.
// Check your imported document structure and field names first.
// Run these commands in mongosh after selecting the correct database.

// 1. Select the project database
use dunnhumby_analytics

// 2. Inspect a sample document
db.transaction_data.findOne()

// 3. Count imported records
db.transaction_data.countDocuments()

// 4. Calculate total sales and total quantity
db.transaction_data.aggregate([
  {
    $group: {
      _id: null,
      totalSales: { $sum: "$sales_value" },
      totalQuantity: { $sum: "$quantity" },
      recordCount: { $sum: 1 }
    }
  }
])

// 5. Find the top 10 products by sales value
db.transaction_data.aggregate([
  {
    $group: {
      _id: "$product_id",
      totalSales: { $sum: "$sales_value" },
      totalQuantity: { $sum: "$quantity" }
    }
  },
  { $sort: { totalSales: -1 } },
  { $limit: 10 }
])

// 6. Find the 10 highest-spending households
db.transaction_data.aggregate([
  {
    $group: {
      _id: "$household_key",
      householdSpending: { $sum: "$sales_value" }
    }
  },
  { $sort: { householdSpending: -1 } },
  { $limit: 10 }
])

// 7. Calculate sales by week
db.transaction_data.aggregate([
  {
    $group: {
      _id: "$week_no",
      weeklySales: { $sum: "$sales_value" },
      weeklyQuantity: { $sum: "$quantity" }
    }
  },
  { $sort: { _id: 1 } }
])

// 8. Inspect available fields before extending the analysis
db.transaction_data.findOne({}, {
  household_key: 1,
  basket_id: 1,
  product_id: 1,
  sales_value: 1,
  quantity: 1,
  week_no: 1
})
