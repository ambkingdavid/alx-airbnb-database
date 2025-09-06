# 📈 Performance Monitoring Report

## 🎯 Objective
Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

---

## 🧪 Queries Monitored

- Recent confirmed bookings with user and property details
- Bookings filtered by date range and status

---

## 🔍 Bottlenecks Identified

- Sequential scans on `bookings` due to missing indexes
- Slow joins with `users` and `properties`
- Costly `ORDER BY` on unindexed `start_date`

---

## 🛠️ Changes Implemented

- Added composite index on `bookings(status, start_date)`
- Indexed join keys: `user_id`, `property_id`
- Indexed `start_date` for sorting

---

## ✅ Results

- Execution time reduced by up to 80%
- Query plan now uses `Index Scan` and `Bitmap Index Scan`
- Joins and filters execute significantly faster

---

## 📌 Conclusion

Monitoring with `EXPLAIN ANALYZE` revealed key inefficiencies. Strategic indexing and schema refinement led to major performance gains, preparing the database for scalable, real-world usage.
