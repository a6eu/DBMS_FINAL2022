CREATE TABLE reviews (
    review_id INTEGER PRIMARY KEY,
    guest_id INTEGER,
    rating INTEGER,
    review TEXT,
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id)
);