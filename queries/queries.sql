ALTER TABLE room_categories ADD COLUMN price REAL;

ALTER TABLE departments ADD COLUMN num_employees INTEGER;

CREATE TRIGGER send_review_notification AFTER INSERT ON reviews
FOR EACH ROW BEGIN
    SELECT send_email(
        "hotel.management@example.com",
        "New guest review",
        CONCAT("A new review has been left by ", (SELECT first_name FROM guests WHERE guest_id = NEW.guest_id), " ", (SELECT last_name FROM guests WHERE guest_id = NEW.guest_id), ": ", NEW.review)
    );
END;

alter table service_bookings
add column total_amount_due;

CREATE TRIGGER update_total_amount_due AFTER INSERT ON service_bookings
FOR EACH ROW BEGIN
    UPDATE bookings
    SET total_amount_due = (SELECT SUM(amount) FROM bills WHERE guest_id = NEW.guest_id AND date BETWEEN check_in_date AND check_out_date)
    WHERE guest_id = NEW.guest_id;
END;

SELECT AVG(strftime(check_out_date - check_in_date)) as Average_nights FROM bookings;

SELECT rc.name, COUNT(r.room_id) AS num_bookings
FROM rooms r
INNER JOIN room_categories rc ON r.category_id = rc.category_id
GROUP BY rc.name
ORDER BY num_bookings DESC
LIMIT 1;

SELECT SUM(b.amount) AS total_revenue
FROM bills b
WHERE b.service_id IS NULL;

SELECT g.first_name, g.last_name, r.room_number
FROM guests g
INNER JOIN bookings b ON g.guest_id = b.guest_id
INNER JOIN rooms r ON b.room_id = r.room_id
WHERE r.category_id IN (SELECT category_id FROM room_categories WHERE name IN ("Standard", "Deluxe"))
GROUP BY g.guest_id
HAVING COUNT(DISTINCT r.category_id) = 1;

SELECT g.first_name, g.last_name
FROM guests g
WHERE EXISTS (
    SELECT 1
    FROM bookings b
    INNER JOIN rooms r ON b.room_id = r.room_id
    WHERE b.guest_id = g.guest_id
    AND r.category_id IN (SELECT category_id FROM room_categories WHERE name = 'Standard')
)
AND NOT EXISTS (
    SELECT 1
    FROM bookings b
    INNER JOIN rooms r ON b.room_id = r.room_id
    WHERE b.guest_id = g.guest_id
    AND r.category_id IN (SELECT category_id FROM room_categories WHERE name = 'Suite')
);

SELECT g.first_name, g.last_name, r.room_number
FROM guests g
INNER JOIN bookings b ON g.guest_id = b.guest_id
INNER JOIN rooms r ON b.room_id = r.room_id
INNER JOIN service_bookings sb ON b.guest_id = sb.guest_id
WHERE r.category_id IN (SELECT category_id FROM room_categories WHERE name like 'Standard')
AND sb.service_id IN (SELECT service_id FROM services WHERE name like 'Massage');

SELECT SUM(bi.amount) AS total_price
FROM bills bi
INNER JOIN bookings b ON b.guest_id = bi.guest_id AND bi.date BETWEEN b.check_in_date AND b.check_out_date
WHERE b.guest_id = 123;

ALTER TABLE reviews
DROP COLUMN check_in_date;

ALTER TABLE payments
ADD COLUMN payment_date;

alter  table employees drop column job_title;

alter table employees add