CREATE TABLE rooms (
    room_id INTEGER PRIMARY KEY,
    room_number TEXT,
    category_id INTEGER,
    FOREIGN KEY (category_id) REFERENCES room_categories(category_id)
);
