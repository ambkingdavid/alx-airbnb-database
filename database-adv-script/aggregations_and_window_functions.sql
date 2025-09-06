-- This query retrieves the average rating for each property.
SELECT 
    user_id,
    COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id
ORDER BY total_bookings DESC;


-- This query retrieves properties with an average rating above 4.0.
SELECT 
    property_id,
    booking_count,
    ROW_NUMBER() OVER (ORDER BY booking_count DESC) AS row_number,
    RANK() OVER (ORDER BY booking_count DESC) AS booking_rank
FROM (
    SELECT 
        property_id,
        COUNT(*) AS booking_count
    FROM bookings
    GROUP BY property_id
) AS property_stats;
