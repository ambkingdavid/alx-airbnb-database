# 📘 Entity-Relationship Diagram: AirBnB Database

## 🧩 Entities and Attributes

### 1. User
- `user_id` (Primary Key)
- `first_name`
- `last_name`
- `email` (Unique)
- `password_hash`
- `phone_number`
- `role` (ENUM: guest, host, admin)
- `created_at`

### 2. Property
- `property_id` (Primary Key)
- `host_id` (Foreign Key → User)
- `name`
- `description`
- `location`
- `price_per_night`
- `created_at`
- `updated_at`

### 3. Booking
- `booking_id` (Primary Key)
- `property_id` (Foreign Key → Property)
- `user_id` (Foreign Key → User)
- `start_date`
- `end_date`
- `total_price`
- `status` (ENUM: pending, confirmed, canceled)
- `created_at`

### 4. Payment
- `payment_id` (Primary Key)
- `booking_id` (Foreign Key → Booking)
- `amount`
- `payment_date`
- `payment_method` (ENUM: credit_card, paypal, stripe)

### 5. Review
- `review_id` (Primary Key)
- `property_id` (Foreign Key → Property)
- `user_id` (Foreign Key → User)
- `rating` (1–5)
- `comment`
- `created_at`

### 6. Message
- `message_id` (Primary Key)
- `sender_id` (Foreign Key → User)
- `recipient_id` (Foreign Key → User)
- `message_body`
- `sent_at`

---

## 🔗 Relationships

- **User ↔ Booking**: One user can make many bookings. Each booking is made by one user.
- **User ↔ Property**: One user (host) can own many properties. Each property is hosted by one user.
- **Property ↔ Booking**: One property can be booked many times. Each booking is for one property.
- **Booking ↔ Payment**: One booking has one payment. Each payment is linked to one booking.
- **User ↔ Review ↔ Property**: One user can leave many reviews. Each review is for one property.
- **User ↔ Message ↔ User**: Users can send messages to each other. Each message has a sender and a recipient.

---

## 🛠️ Diagram Instructions

To visualize this ERD:
1. Use [Draw.io](https://draw.io) or any ER diagram tool.
2. Create rectangles for each entity with attributes listed.
3. Use diamonds or labeled connectors for relationships.
4. Indicate cardinality (e.g., 1:N, N:M) and foreign key constraints.

---

> ✅ This ERD forms the foundation for normalization, schema creation, and seeding tasks in your AirBnB database project.
