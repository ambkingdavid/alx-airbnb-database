-- 🧑 User Table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(10) CHECK (role IN ('guest', 'host', 'admin')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_users_email ON users(email);

-- 🏠 Property Table
CREATE TABLE properties (
    property_id SERIAL PRIMARY KEY,
    host_id INTEGER NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_host ON properties(host_id);

-- 📅 Booking Table
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    property_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(10) CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_bookings_user ON bookings(user_id);
CREATE INDEX idx_bookings_property ON bookings(property_id);
CREATE INDEX idx_bookings_dates ON bookings(start_date, end_date);

-- 💳 Payment Table
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    booking_id INTEGER NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE
);

CREATE INDEX idx_payments_booking ON payments(booking_id);

-- ⭐ Review Table
CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    property_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_reviews_property ON reviews(property_id);
CREATE INDEX idx_reviews_user ON reviews(user_id);

-- 💬 Message Table
CREATE TABLE messages (
    message_id SERIAL PRIMARY KEY,
    sender_id INTEGER NOT NULL,
    recipient_id INTEGER NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_messages_sender ON messages(sender_id);
CREATE INDEX idx_messages_recipient ON messages(recipient_id);
