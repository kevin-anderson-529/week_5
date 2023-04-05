-- Create customers table
CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  phone_number VARCHAR(20) UNIQUE NOT NULL
);

-- Create concessions table
CREATE TABLE concessions (
  item_id SERIAL PRIMARY KEY,
  item_name VARCHAR(50) NOT NULL,
  item_price NUMERIC NOT NULL
);

-- Create concession_sales table
CREATE TABLE concession_sales (
  sale_id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(customer_id),
  item_id INTEGER REFERENCES concessions(item_id),
  quantity INTEGER NOT NULL,
  sale_time TIME NOT NULL
);

-- Create tickets table
CREATE TABLE tickets (
  ticket_id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(customer_id),
  movie_id INTEGER REFERENCES movies(movie_id),
  movie_time TIME NOT NULL,
  seat_name VARCHAR(10) NOT NULL
);

-- Create movies table
CREATE TABLE movies (
  movie_id SERIAL PRIMARY KEY,
  movie_title VARCHAR(50) NOT NULL,
  movie_duration NUMERIC NOT NULL,
  movie_genre VARCHAR(20) NOT NULL,
  movie_rating VARCHAR(10) NOT NULL
);

-- Insert data

-- Insert into customers table
INSERT INTO customers (first_name, last_name, phone_number)
VALUES ('Kevin', 'Anderson', '555-321-1234'),
       ('Samantha', 'Stevens', '555-954-2601');

-- Insert into concessions table
INSERT INTO concessions (item_name, item_price)
VALUES ('Soda', 4.99),
       ('Popcorn', 8.99);

-- Insert into concession_sales table
INSERT INTO concession_sales (customer_id, item_id, quantity, sale_time)
VALUES (1882, 18653, 2, '18:35:00'),
       (2452, 26378, 1, '19:45:00');

-- Insert sample data into movies table
INSERT INTO movies (movie_title, movie_duration, movie_genre, movie_rating)
VALUES ('SQL: The Movie', 122, 'Documentary', 'PG-13'),
       ('The Coding Warrior', 135, 'Drama', 'R');

-- Insert into tickets table
INSERT INTO tickets (customer_id, movie_id, movie_time, seat_name)
VALUES (1882, 625, '19:00:00', 'A32'),
       (2452, 627, '20:00:00', 'B27');