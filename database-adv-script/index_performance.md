# 🚀 Indexing Strategy and Performance Analysis

## 🎯 Objective
Improve query performance in the Airbnb Clone database by identifying high-usage columns and creating appropriate indexes. Measure the impact using `EXPLAIN` and `ANALYZE`.

---

## 🔍 High-Usage Columns Identified

| Table       | Column(s)                     | Reason for Indexing                          |
|-------------|-------------------------------|----------------------------------------------|
| `users`     | `email`, `user_id`            | Used in login, joins with bookings/messages  |
| `bookings`  | `user_id`, `property_id`, `start_date` | Used in joins, filters, and sorting         |
| `properties`| `host_id`, `location`, `property_id` | Used in joins, filters, and search queries  |
| `reviews`   | `property_id`                 | Used in joins with properties                |
