-- Start transaction
BEGIN;

-- Create author table
CREATE TABLE author (
  authorid SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  status VARCHAR(8) NOT NULL
);

-- Insert data into author table
INSERT INTO author (name, status) VALUES
('Alan Forbes', 'Enable'),
('Lynn Beighley', 'Enable');

-- Create book table
CREATE TABLE book (
  bookid SERIAL PRIMARY KEY,
  categoryid INT NOT NULL,
  authorid INT NOT NULL,
  rackid INT NOT NULL,
  name TEXT NOT NULL,
  picture VARCHAR(250) NOT NULL,
  publisherid INT NOT NULL,
  isbn VARCHAR(30) NOT NULL,
  no_of_copy INT NOT NULL,
  status VARCHAR(8) NOT NULL,
  added_on TIMESTAMP WITHOUT TIME ZONE DEFAULT current_timestamp,
  updated_on TIMESTAMP WITHOUT TIME ZONE DEFAULT current_timestamp
);

-- Insert data into book table
INSERT INTO book (categoryid, authorid, rackid, name, picture, publisherid, isbn, no_of_copy, status, added_on, updated_on) VALUES
(2, 2, 2, 'The Joy of PHP Programming', 'joy-php.jpg', 8, 'B00BALXN70', 10, 'Enable', '2022-06-12 11:12:48', '2022-06-12 11:13:27'),
(2, 3, 2, 'Head First PHP & MySQL', 'header-first-php.jpg', 9, '0596006306', 10, 'Enable', '2022-06-12 11:16:01', '2022-06-12 11:16:01'),
(2, 2, 1, 'dsgsdgsd', '', 7, 'sdfsd2334', 23, 'Enable', '2022-06-12 13:29:14', '2022-06-12 13:29:14'),
(1, 2, 0, 'eeeeeebook', '', 2, 'hfdfhdfhd', 2, '', '2023-03-19 16:27:17', '2023-03-19 16:27:17'),
(1, 2, 0, 'aaaaaaaaaaaaaa', '', 2, 'bbbbbbbbbbbbbbbbbb', 2, '', '2023-03-19 17:37:56', '2023-03-19 17:37:56'),
(1, 2, 1, 'bbbbbbbbbbbbbb', '', 2, '4346436463463', 2, 'Enable', '2023-03-25 14:44:18', '2023-03-25 14:44:18');

-- Create category table
CREATE TABLE category (
  categoryid SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  status VARCHAR(8) NOT NULL
);

-- Insert data into category table
INSERT INTO category (name, status) VALUES
('Web Design', 'Enable'),
('Programming', 'Enable'),
('Commerce', 'Enable'),
('Math', 'Enable'),
('Web Development', 'Enable');

-- Create issued_book table
CREATE TABLE issued_book (
  issuebookid SERIAL PRIMARY KEY,
  bookid INT NOT NULL,
  userid INT NOT NULL,
  issue_date_time TIMESTAMP WITHOUT TIME ZONE DEFAULT current_timestamp,
  expected_return_date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  return_date_time TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  status VARCHAR(10) NOT NULL
);

-- Insert data into issued_book table
INSERT INTO issued_book (bookid, userid, issue_date_time, expected_return_date, return_date_time, status) VALUES
(2, 2, '2022-06-12 15:33:45', '2022-06-15 16:27:59', '2022-06-16 16:27:59', 'Not Return'),
(1, 2, '2022-06-12 18:46:07', '2022-06-30 18:46:02', '2022-06-12 18:46:14', 'Returned'),
(7, 2, '2023-03-25 14:32:57', '2023-03-25 14:32:47', '2023-03-26 14:32:51', 'Issued');

-- Create publisher table
CREATE TABLE publisher (
  publisherid SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  status VARCHAR(8) NOT NULL
);

-- Insert data into publisher table
INSERT INTO publisher (name, status) VALUES
('Amazon publishing', 'Enable'),
('Penguin books ltd.', 'Enable'),
('Vintage Publishing', 'Enable'),
('Macmillan Publishers', 'Enable'),
('Simon & Schuster', 'Enable'),
('HarperCollins', 'Enable'),
('Plum Island', 'Enable'),
('O’Reilly', 'Enable');

-- Create rack table
CREATE TABLE rack (
  rackid SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  status VARCHAR(8) NOT NULL DEFAULT 'Enable'
);

-- Insert data into rack table
INSERT INTO rack (name, status) VALUES
('R1', 'Enable'),
('R2', 'Enable');

-- Create user table
CREATE TABLE "user" (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255),
  password VARCHAR(64) NOT NULL,
  role VARCHAR(5) DEFAULT 'admin'
);

-- Insert data into user table
INSERT INTO "user" (id, first_name, last_name, email, password, role) VALUES
(2, 'Mark', 'Wood', 'mark@webdamn.com', '123', 'user'),
(3, 'George', 'Smith', 'goerge@webdamn.com', '123', 'admin'),
(4, 'Adam', NULL, 'adam@webdamn.com', '123', 'admin'),
(6, 'aaa', 'bbbbb', 'ab@webdamn.com', '123', 'user');

-- End transaction
COMMIT;
