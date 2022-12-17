CREATE TABLE service_bookings (
    service_booking_id INTEGER PRIMARY KEY,
    service_id INTEGER,
    guest_id INTEGER,
    date DATE,
    FOREIGN KEY (service_id) REFERENCES services(service_id),
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id)
);