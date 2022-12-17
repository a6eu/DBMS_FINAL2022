CREATE TABLE bookings (
    booking_id INTEGER PRIMARY KEY,
    guest_id INTEGER,
    room_id INTEGER,
    check_in_date DATE,
    check_out_date DATE,
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);
