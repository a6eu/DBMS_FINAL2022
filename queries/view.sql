CREATE VIEW guest_stats AS
SELECT COUNT(*) AS num_guests, AVG(strftime(check_out_date - check_in_date)) AS avg_stay_duration
FROM bookings;

SELECT * FROM guest_stats;
