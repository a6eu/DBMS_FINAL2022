CREATE TABLE bills (
    bill_id INTEGER PRIMARY KEY,
    guest_id INTEGER,
    room_id INTEGER,
    service_id INTEGER,
    date DATE,
    amount REAL,
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);