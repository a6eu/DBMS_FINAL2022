CREATE TABLE payments (
    payment_id INTEGER PRIMARY KEY,
    bill_id INTEGER,
    payment_method TEXT,
    amount REAL,
    FOREIGN KEY (bill_id) REFERENCES bills(bill_id)
);