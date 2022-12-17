BEGIN TRANSACTION;

UPDATE bills
SET amount = amount + 50
WHERE guest_id = 123;

INSERT INTO payments (bill_id, amount, payment_date)
VALUES ((SELECT bill_id FROM bills WHERE guest_id = 123 AND service_id IS NULL), 50, DATE('now'));

COMMIT;


