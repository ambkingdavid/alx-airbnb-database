# 🧠 Database Normalization to 3NF: AirBnB Schema

## ✅ Objective
Ensure the database schema adheres to Third Normal Form (3NF) by eliminating redundancy and ensuring all attributes are fully functionally dependent on the primary key.

---

## 📘 Step-by-Step Normalization

### 🔹 First Normal Form (1NF)
- **Rule**: Eliminate repeating groups and ensure atomicity.
- **Status**: ✅ All tables have atomic attributes (e.g., `first_name`, `email`, `price_per_night`).
- **No multivalued fields or arrays**.

### 🔹 Second Normal Form (2NF)
- **Rule**: Remove partial dependencies (i.e., no attribute should depend on part of a composite key).
- **Status**: ✅ All tables use single-column primary keys (UUIDs), so no partial dependencies exist.

### 🔹 Third Normal Form (3NF)
- **Rule**: Remove transitive dependencies (i.e., non-key attributes must depend only on the primary key).
- **Review and Adjustments**:

#### 1. **User Table**
- ✅ No transitive dependencies.
- Attributes like `role`, `email`, and `phone_number` depend only on `user_id`.

#### 2. **Property Table**
- ✅ `host_id` is a foreign key to `User`, and all other attributes depend only on `property_id`.

#### 3. **Booking Table**
- ✅ All attributes (`start_date`, `end_date`, `total_price`, `status`) depend directly on `booking_id`.

#### 4. **Payment Table**
- ✅ `amount`, `payment_date`, and `payment_method` depend only on `payment_id`.

#### 5. **Review Table**
- ✅ `rating`, `comment`, and `created_at` depend only on `review_id`.

#### 6. **Message Table**
- ✅ `sender_id` and `recipient_id` are foreign keys, and `message_body` depends only on `message_id`.

---

## 🛠️ Additional Considerations

- **ENUMs** (e.g., `role`, `status`, `payment_method`) are acceptable in 3NF if their values are fixed and not subject to frequent change. If dynamic, consider separate lookup tables.
- **Derived attributes** like `total_price` should be calculated at runtime or stored with justification (e.g., for historical accuracy).

---

## ✅ Final Verdict

The schema is **fully normalized to 3NF**:
- No repeating groups (1NF)
- No partial dependencies (2NF)
- No transitive dependencies (3NF)

This structure ensures data integrity, reduces redundancy, and improves scalability.

