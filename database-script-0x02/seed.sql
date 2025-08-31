-- 👤 Sample Users
INSERT INTO users (first_name, last_name, email, password_hash, phone_number, role)
VALUES
('Alice', 'Johnson', 'alice@example.com', 'hashed_pw_1', '08012345678', 'guest'),
('Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '08023456789', 'host'),
('Carol', 'Lee', 'carol@example.com', 'hashed_pw_3', '08034567890', 'guest'),
('David', 'Brown', 'david@example.com', 'hashed_pw_4', '08045678901', 'admin');

-- 🏠 Sample Properties
INSERT INTO properties (host_id, name, description, location, price_per_night)
VALUES
(2, 'Cozy Cottage', 'A peaceful retreat in the countryside.', 'Ibadan, Nigeria', 150.00),
(2, 'Urban Loft', 'Modern loft in the heart of the city.', 'Lagos, Nigeria', 250.00),
(2, 'Beach House', 'Oceanfront property with stunning views.', 'Lekki, Nigeria', 300.00);

-- 📅 Sample Bookings
INSERT INTO bookings (property_id, user_id, start_date, end_date, total_price, status)
VALUES
(1, 1, '2025-09-10', '2025-09-12', 300.00, 'confirmed'),
(2, 3, '2025-09-15', '2025-09-18', 750.00, 'pending'),
(3, 1, '2025-09-20', '2025-09-22', 600.00, 'confirmed');

-- 💳 Sample Payments
INSERT INTO payments (booking_id, amount, payment_date, payment_method)
VALUES
(1, 300.00, '2025-09-05', 'credit_card'),
(3, 600.00, '2025-09-18', 'paypal');

-- ⭐ Sample Reviews
INSERT INTO reviews (property_id, user_id, rating, comment)
VALUES
(1, 1, 5, 'Absolutely loved the cottage! Peaceful and clean.'),
(2, 3, 4, 'Great location, but a bit noisy at night.'),
(3, 1, 5, 'Perfect beach getaway. Highly recommend!');

-- 💬 Sample Messages
INSERT INTO messages (sender_id, recipient_id, message_body)
VALUES
(1, 2, 'Hi Bob, is the cottage available next weekend?'),
(2, 1, 'Hi Alice, yes it is. Let me know if you want to book.'),
(3, 2, 'Hey Bob, can I get a discount on the loft?');
