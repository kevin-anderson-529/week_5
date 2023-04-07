CREATE OR REPLACE FUNCTION add_car_and_invoice(
    car_serial_id VARCHAR(50),
    make VARCHAR(50),
    model VARCHAR(50),
    year VARCHAR(20),
    salesperson_id INT,
    customer_id INT,
    purchase_date DATE
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Car (car_serial_id, make, model, year, salesperson_id, customer_id)
    VALUES (car_serial_id, make, model, year, salesperson_id, customer_id);

    INSERT INTO Invoice (car_serial_id, customer_id, salesperson_id, purchase_date)
    VALUES (car_serial_id, customer_id, salesperson_id, purchase_date);
END;
$$ LANGUAGE plpgsql;