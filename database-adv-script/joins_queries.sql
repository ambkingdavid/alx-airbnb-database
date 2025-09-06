-- This query retrieves all bookings along with the associated user details.
SELECT 
    bookings.booking_id,
    bookings.start_date,
    bookings.end_date,
    bookings.total_price,
    users.user_id,
    users.first_name,
    users.last_name,
    users.email
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id;
ORDER BY bookings.start_date DESC;


-- This query retrieves all properties along with their reviews, including properties without reviews.
SELECT 
    properties.property_id,
    properties.name,
    properties.location,
    reviews.review_id,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id;
ORDER BY properties.name ASC;


SELECT 
    users.user_id,
    users.first_name,
    users.last_name,
    bookings.booking_id,
    bookings.start_date,
    bookings.end_date,
    bookings.total_price
FROM users
FULL OUTER JOIN bookings ON users.user_id = bookings.user_id;
ORDER BY users.user_id NULLS LAST;
