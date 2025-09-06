
-- This query retrieves the average rating for each property.SELECT 
    user_id,
    COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id
ORDER BY total_bookings DESC;

-- This query retrieves users who have made more than 3 bookings.
SELECT 
    property_id,
    booking_count,
    ROW_NUMBER() OVER (ORDER BY booking_count DESC) AS row_num
FROM (
    SELECT 
        property_id,
        COUNT(*) AS booking_count
    FROM bookings
    GROUP BY property_id
) AS ranked_properties;
