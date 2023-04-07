CREATE TABLE Salesperson (
    salesperson_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20)
);

CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20)
);

CREATE TABLE Car (
    car_serial_id VARCHAR(50) PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    year VARCHAR(20),
    salesperson_id INT,
    customer_id INT,
    FOREIGN KEY (salesperson_id) REFERENCES Salesperson(salesperson_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Invoice (
    invoice_id SERIAL PRIMARY KEY,
    car_serial_id VARCHAR(50),
    customer_id INT,
    salesperson_id INT,
    purchase_date DATE,
    FOREIGN KEY (car_serial_id) REFERENCES Car(car_serial_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (salesperson_id) REFERENCES Salesperson(salesperson_id)
);

CREATE TABLE Mechanic (
    mechanic_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20)
);

CREATE TABLE ServiceTicket (
    ticket_id SERIAL PRIMARY KEY,
    car_serial_id VARCHAR(50),
    customer_id INT,
    mechanic_id INT,
    service_date DATE,
    FOREIGN KEY (car_serial_id) REFERENCES Car(car_serial_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (mechanic_id) REFERENCES Mechanic(mechanic_id)
);