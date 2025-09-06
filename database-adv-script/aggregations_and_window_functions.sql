
-- This query retrieves the average rating for each property.SELECT 
    user_id,
    COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id
ORDER BY total_bookings DESC;

-- This query retrieves the top 5 properties with the highest average ratings.
SELECT 
    property_id,
    COUNT(*) AS booking_count,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM bookings
GROUP BY property_id;
