# 🚀 Query Optimization Report

## 🎯 Objective
Improve the performance of a complex query that retrieves booking details along with associated user, property, and payment information.

---

## 🧾 Initial Query Overview

The initial query joins four tables: `bookings`, `users`, `properties`, and `payments`. It retrieves all relevant details and sorts results by `start_date`.

---

## 📊 Performance Analysis

### 🔍 Using `EXPLAIN ANALYZE`

```sql
EXPLAIN ANALYZE
SELECT ...
