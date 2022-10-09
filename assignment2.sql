CREATE DATABASE assignment2;
USE assignment2;

--- Create FOREX table
CREATE TABLE forex (
  from_ccy VARCHAR(3),
  to_ccy VARCHAR(3),
  trade_date DATE,
  exch_rate FLOAT(10,4) NOT NULL,
  PRIMARY KEY (from_ccy, to_ccy, trade_date)
);
--- Insert data into FOREX table
INSERT INTO forex VALUES ('CAD', 'USD', '2022-10-06', 0.7279);
INSERT INTO forex VALUES ('CAD', 'GBP', '2022-10-06', 0.6524);
INSERT INTO forex VALUES ('CAD', 'FF', '2022-10-06', 0.743);
INSERT INTO forex VALUES ('CAD', 'DM', '2022-10-06', 0.7521);
INSERT INTO forex VALUES ('CAD', 'ITL', '2022-10-06', 0.7724);
INSERT INTO forex VALUES ('USD', 'CAD', '2022-10-06', 1.3739);
INSERT INTO forex VALUES ('USD', 'GBP', '2022-10-06', 0.8964);
INSERT INTO forex VALUES ('USD', 'FF', '2022-10-06', 1.0209);
INSERT INTO forex VALUES ('USD', 'DM', '2022-10-06', 1.0394);
INSERT INTO forex VALUES ('USD', 'ITL', '2022-10-06', 1.0399);

--- Create COUNTRY table
CREATE TABLE country (
  country_code VARCHAR(2) PRIMARY KEY,
  country_name VARCHAR(60),
  currency_code VARCHAR(3)
);
--- Insert data into COUNTRY table
INSERT INTO country VALUES ('CA', 'Canada', 'CAD');
INSERT INTO country VALUES ('US', 'USA', 'USD');
INSERT INTO country VALUES ('UK', 'UK', 'GBP');
INSERT INTO country VALUES ('FR', 'France', 'FF');
INSERT INTO country VALUES ('DE', 'Germany', 'DM');
INSERT INTO country VALUES ('IT', 'Italy', 'ITL');

--- Create AIRLINE table
CREATE TABLE airline (
  carrier_code VARCHAR(2) PRIMARY KEY,
  airline_name VARCHAR(30) NOT NULL,
  country_code VARCHAR(2),
  FOREIGN KEY (country_code) REFERENCES country(country_code)
);
--- Insert data into AIRLINE table
INSERT INTO airline VALUES ('AC', 'Air Canada', 'CA');
INSERT INTO airline VALUES ('AA', 'US Airways', 'US');
INSERT INTO airline VALUES ('BA', 'British Airways', 'UK');
INSERT INTO airline VALUES ('AF', 'Air France', 'FR');
INSERT INTO airline VALUES ('LH', 'Luftansa Air', 'DE');
INSERT INTO airline VALUES ('AZ', 'Air Italia', 'IT');

--- Create AIRPORT table
CREATE TABLE airport (
  airport_code VARCHAR(3) PRIMARY KEY,
  airport_name VARCHAR (50) NOT NULL,
  city_name VARCHAR(30) NOT NULL,
  airport_tax FLOAT(10,4),
  country_code VARCHAR(2),
  FOREIGN KEY (country_code) REFERENCES country(country_code)
);
--- Insert data into AIRPORT table
INSERT INTO airport VALUES ('YHM', 'John C. Munro Hamilton', 'Toronto', 25, 'CA');
INSERT INTO airport VALUES ('YTZ', 'Billy Bishop City A/P', 'Toronto', 15, 'CA');
INSERT INTO airport VALUES ('YYZ', 'Lester B. Pearson Intl', 'Toronto', 25, 'CA');
INSERT INTO airport VALUES ('YUL', 'Pierre E.Trudeau Intl', 'Montreal', 20, 'CA');
INSERT INTO airport VALUES ('YMX', 'Mirabel Intl', 'Montreal', 18, 'CA');
INSERT INTO airport VALUES ('YHU', 'St Hubert', 'Montreal', 10, 'CA');
INSERT INTO airport VALUES ('JFK', 'John F Kennedy Intl', 'New York', 5, 'US');
INSERT INTO airport VALUES ('LGA', 'LaGuardia', 'New York', 8, 'US');
INSERT INTO airport VALUES ('EWR', 'Newark Liberty Intl', 'New York', 4.5, 'US');
INSERT INTO airport VALUES ('MDW', 'Midway International', 'Chicago', 7.5, 'US');
INSERT INTO airport VALUES ('ORD', 'O Hare International', 'Chicago', 7.5, 'US');
INSERT INTO airport VALUES ('LTN', 'Luton', 'London', 15, 'UK');
INSERT INTO airport VALUES ('LHR', 'Heathrow', 'London', 15, 'UK');
INSERT INTO airport VALUES ('LCY', 'London City', 'London', 15, 'UK');
INSERT INTO airport VALUES ('STN', 'Stansted', 'London', 15, 'UK');
INSERT INTO airport VALUES ('SEN', 'Southend', 'London', 15, 'UK');
INSERT INTO airport VALUES ('LGW', 'Gatwick', 'London', 15, 'UK');
INSERT INTO airport VALUES ('EDI', 'Edinburgh Intl', 'Edinburgh', 0, 'UK');
INSERT INTO airport VALUES ('CDG', 'Charles de Gaulle', 'Paris', 30, 'FR');
INSERT INTO airport VALUES ('ORY', 'Orly', 'Paris', 25, 'FR');
INSERT INTO airport VALUES ('BVA', 'Beauvais', 'Paris', 20, 'FR');
INSERT INTO airport VALUES ('NCE', 'Cote d Azur', 'Nice', 5, 'FR');
INSERT INTO airport VALUES ('CGN', 'Cologne Bonn Airport', 'Bonn', 3.75, 'DE');
INSERT INTO airport VALUES ('BER', 'Brandenburg', 'Berlin', 3.75, 'DE');
INSERT INTO airport VALUES ('FCO', 'Fiumicino', 'Rome', 2.5, 'IT');
INSERT INTO airport VALUES ('CIA', 'Ciampino', 'Rome', 2.5, 'IT');
INSERT INTO airport VALUES ('APF', 'Municipal', 'Naples', 0, 'IT');
INSERT INTO airport VALUES ('NAP', 'Capodichino', 'Naples', 0, 'IT');

--- Create BOOKING OFFICE table
CREATE TABLE booking_office (
  office_code VARCHAR(4),
  city_name VARCHAR(30) NOT NULL,
  country_code VARCHAR(50),
  PRIMARY KEY (office_code),
  FOREIGN KEY (country_code) REFERENCES country(country_code)
);
--- Insert data into BOOKING OFFICE table
INSERT INTO booking_office VALUES ('CA01', 'Toronto', 'CA');
INSERT INTO booking_office VALUES ('CA02', 'Montreal', 'CA');
INSERT INTO booking_office VALUES ('US01', 'New York', 'US');
INSERT INTO booking_office VALUES ('US02', 'Chicago', 'US');
INSERT INTO booking_office VALUES ('UK01', 'London', 'UK');
INSERT INTO booking_office VALUES ('UK02', 'Edinburgh', 'UK');
INSERT INTO booking_office VALUES ('FR01', 'Paris', 'FR');
INSERT INTO booking_office VALUES ('FR02', 'Nice', 'FR');
INSERT INTO booking_office VALUES ('DE01', 'Bonn', 'DE');
INSERT INTO booking_office VALUES ('DE02', 'Berlin', 'DE');
INSERT INTO booking_office VALUES ('IT01', 'Rome', 'IT');
INSERT INTO booking_office VALUES ('IT02', 'Naples', 'IT');

--- Create CUSTOMER table
CREATE TABLE customer (
  customer_id VARCHAR(12),
  last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  middle_name VARCHAR(50),
  birthdate DATE NOT NULL,
  address_street VARCHAR(45) NOT NULL,
  address_city VARCHAR(45) NOT NULL,
  address_region VARCHAR(20),
  address_country VARCHAR(2) NOT NULL,
  citizenship VARCHAR(2) NOT NULL,
  passport_no VARCHAR(30),
  PRIMARY KEY (customer_id),
  FOREIGN KEY (address_country) REFERENCES country(country_code),
  FOREIGN KEY (citizenship) REFERENCES country(country_code)
);
--- Insert data into CUSTOMER table
INSERT INTO customer VALUES('CA0000000001', 'Bouchard', 'Oliver', 'Harris', '1980-12-22', '789 Ranchero Drive NW', 'Calgary', 'T3G 1R8', 'CA', 'CA', 'AB123456');
INSERT INTO customer VALUES('CA0000000002', 'Bouchard', 'Amelia', 'Evans', '1981-10-13', '789 Ranchero Drive NW', 'Calgary', 'T3G 1R8', 'CA', 'CA', 'CD888888');
INSERT INTO customer VALUES('CA0000000003', 'Bouchard', 'Ethan', 'Evans', '2012-07-26', '789 Ranchero Drive NW', 'Calgary', 'T3G 1R8', 'CA', 'CA', 'EF999999');
INSERT INTO customer VALUES('CA0000000004', 'Bouchard', 'Jacob', 'Evans', '2017-01-08', '789 Ranchero Drive NW', 'Calgary', 'T3G 1R8', 'CA', 'CA', 'GH121212');
INSERT INTO customer VALUES('US0000000001', 'Smith', 'John', 'Adams', '1979-11-21', '123 ABC Street', 'Chicago', NULL, 'US', 'US', 'X12345678');
INSERT INTO customer VALUES('US0000000002', 'Smith', 'Jane', 'Jones', '1983-06-05', '123 ABC Street', 'Chicago', NULL, 'US', 'US', 'Y98765432');
INSERT INTO customer VALUES('UK0000000001', 'Lewis', 'Luke', NULL, '1986-02-18', '22 Downing Street', 'London', 'SW1A 2AA', 'UK', 'US', 'Z45454545');
INSERT INTO customer VALUES('UK0000000002', 'Lewis', 'Leona', NULL, '1988-04-16', '22 Downing Street', 'London', 'SW1A 2AA', 'UK', 'UK', '123456789');

--- Create PHONE table
CREATE TABLE phone (
  customer_id VARCHAR(12),
  phone_seq INT(2) NOT NULL,
  p_type ENUM('landline', 'mobile', 'fax'),
  p_country_code VARCHAR(2) NOT NULL,
  area_code VARCHAR(3) NOT NULL,
  local_number VARCHAR(8) NOT NULL,
  CONSTRAINT pk_c_phone PRIMARY KEY (customer_id,phone_seq),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
--- Insert data into PHONE table
INSERT INTO phone VALUES ('CA0000000001', '1', 'mobile', '1', '587', '1234567');
INSERT INTO phone VALUES ('CA0000000001', '2', 'fax', '1', '587', '2345678');
INSERT INTO phone VALUES ('CA0000000002', '1', 'mobile', '1', '587', '3456789');
INSERT INTO phone VALUES ('CA0000000002', '2', 'landline', '1', '587', '9876543');
INSERT INTO phone VALUES ('UK0000000001', '1', 'mobile', '44', '797', '12345678');

--- Create EMAIL table
CREATE TABLE email (
  customer_id VARCHAR(12),
  email_seq INT(2),
  email_address VARCHAR(130),
  PRIMARY KEY (customer_id, email_seq),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
--- Insert data into EMAIL table
INSERT INTO email VALUES ('CA0000000001', '1', 'oliverbouchard@gmail.com');
INSERT INTO email VALUES ('CA0000000001', '2', 'oliverbouchard1222@hotmail.com');
INSERT INTO email VALUES ('CA0000000002', '1', 'amelialovessunsets@gmail.com');
INSERT INTO email VALUES ('CA0000000003', '1', 'ethanb2012@gmail.com');
INSERT INTO email VALUES ('UK0000000001', '1', 'lukeyluke@hotmail.com');
INSERT INTO email VALUES ('UK0000000002', '2', 'lukewhoshere@gmail.com');

--- Create CLASS table
CREATE TABLE class (
  class_id VARCHAR(2) PRIMARY KEY,
  class_name VARCHAR(20) NOT NULL,
  c_multiplier FLOAT(10,4) NOT NULL
);
--- Insert data into CLASS table
INSERT INTO class VALUES ('FC', 'First Class', 1.5);
INSERT INTO class VALUES ('BC', 'Business Class', 1.25);
INSERT INTO class VALUES ('EC', 'Economy Class', 1);

--- Create FARE table
CREATE TABLE fare (
  fare_id VARCHAR(3) PRIMARY KEY,
  fare_desc VARCHAR(20) NOT NULL,
  f_multiplier FLOAT(10,4) NOT NULL
);
--- Insert data into FARE table
INSERT INTO fare VALUES ('ADT', 'Adult', 1);
INSERT INTO fare VALUES ('CHD', 'Child', 0.75);
INSERT INTO fare VALUES ('INS', 'Infant in Seat', 0.75);
INSERT INTO fare VALUES ('INF', 'Infant on Lap', 0.1);

--- Create FLIGHT ROUTE table
CREATE TABLE flight_route (
  carrier_code VARCHAR(2),
  flight_no VARCHAR(4),
  valid_from DATE,
  valid_to DATE,
  airport_dep VARCHAR(3),
  airport_arr VARCHAR(3),
  time_dep TIME NOT NULL,
  time_arr TIME NOT NULL,
  arr_nextday ENUM('Y','N'),
  aircraft VARCHAR(20),
  frequency VARCHAR(10) NOT NULL,
  duration VARCHAR(8) NOT NULL,
  seats_FC INT(4),
  seats_BC INT(4),
  seats_EC INT(4) NOT NULL,
  PRIMARY KEY (carrier_code, flight_no, valid_from, valid_to),
  FOREIGN KEY (carrier_code) REFERENCES airline(carrier_code)
);
--- Insert data into FLIGHT ROUTE table
INSERT INTO flight_route VALUES('AC', '8872', '2022-09-22', '2022-10-29', 'YYZ', 'EWR', '06:25:00', '07:58:00', 'N', 'E75', 'daily', '1h 33m', 0, 12, 64);
INSERT INTO flight_route VALUES('AC', '8872', '2022-10-30', '2022-11-04', 'YYZ', 'EWR', '12:10:00', '13:43:00', 'N', 'E75', 'MWF', '1h 33m', 0, 12, 64);
INSERT INTO flight_route VALUES('AC', '420', '2022-01-01', '2022-12-31', 'YYZ', 'YUL', '17:13:00', '18:09:00', 'N', 'A330-300', 'SSu', '0h 56m', 21, 27, 244);
INSERT INTO flight_route VALUES('AC', '874', '2022-01-01', '2022-12-31', 'YUL', 'CDG', '19:00:00', '07:45:00', 'Y', 'Boeing 777-300ER', 'daily', '6h 45m', 24, 40, 336);

--- Create FLIGHT_INSTANCE table
CREATE TABLE flight_instance (
  carrier_code VARCHAR(2),
  flight_no VARCHAR(4),
  date_dep DATE,
  date_arr DATE,
  flight_status ENUM('on-schedule','delayed','in-flight','arrived'),
  fare_basic FLOAT(10.4) NOT NULL,
  addon_seat FLOAT(10,4),
  addon_meal FLOAT(10,4),
  PRIMARY KEY (carrier_code, flight_no, date_dep, date_arr),
  FOREIGN KEY (carrier_code, flight_no) REFERENCES flight_route (carrier_code, flight_no)
);
--- Insert data into FLIGHT INSTANCE table
INSERT INTO flight_instance VALUES ('AC', '874', '2022-10-08', '2022-10-08', 'on-schedule', 999, 15, 10);
INSERT INTO flight_instance VALUES ('AC', '874', '2022-10-07', '2022-10-07', 'delayed', 945.75, 15, 10);
INSERT INTO flight_instance VALUES ('AC', '874', '2022-10-06', '2022-10-06', 'in-flight', 923, 15, 10);
INSERT INTO flight_instance VALUES ('AC', '874', '2022-10-01', '2022-10-01', 'arrived', 875.5, 15, 10);

--- Create FLIGHT_BOOKING table
CREATE TABLE flight_booking (
  booking_ref VARCHAR(10) PRIMARY KEY,
  booking_date DATETIME NOT NULL,
  booking_agent VARCHAR(90),
  booking_office VARCHAR(4) NOT NULL,
  booking_status ENUM('booked','canceled','scratched'),
  b_customer_id VARCHAR(12) NOT NULL,
  class_id VARCHAR(2) NOT NULL,
  FOREIGN KEY (booking_office) REFERENCES booking_office(office_code),
  FOREIGN KEY (b_customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (class_id) REFERENCES class (class_id)
);
--- Insert data into FLIGHT BOOKING table
INSERT INTO flight_booking VALUES ('AC01X1Y2Z3', '2022-09-01 17:32:45', 'Homer Simpson', 'CA01', 'booked', 'CA0000000001', 'EC');
INSERT INTO flight_booking VALUES ('AC23JEN456', '2022-09-15 09:18:27', 'Marge Simpson', 'CA02', 'canceled', 'CA0000000002', 'BC');
INSERT INTO flight_booking VALUES ('AC789LA9B1', '2022-10-05 22:11:00', 'Bart Simpson', 'CA01', 'scratched', 'CA0000000001', 'FC');

--- Create ITINERARY table
CREATE TABLE itinerary (
  booking_ref VARCHAR(10),
  leg_no INT(2),
  carrier_code VARCHAR(2) NOT NULL,
  flight_no VARCHAR(4) NOT NULL,
  date_dep DATE,
  date_arr DATE,
  PRIMARY KEY (booking_ref, leg_no),
  FOREIGN KEY (carrier_code, flight_no, date_dep, date_arr)
  REFERENCES flight_instance (carrier_code, flight_no, date_dep, date_arr)
);
--- Insert data into ITINERARY table
INSERT INTO itinerary VALUES ('AC01X1Y2Z3', 1, 'AC', '874', '2022-10-08', '2022-10-08');
INSERT INTO itinerary VALUES ('AC01X1Y2Z3', 2, 'AC', '875', '2022-10-31', '2022-10-31');

--- Create PASSENGER table
CREATE TABLE passenger (
  booking_ref VARCHAR(10),
  leg_no INT(2),
  passenger_seq INT(2),
  p_customer_id VARCHAR(12) NOT NULL,
  fare_id VARCHAR(12) NOT NULL,
  prem_seat ENUM('Y','N'),
  prem_meal ENUM('Y','N'),
  PRIMARY KEY (booking_ref, leg_no, passenger_seq)
);
--- Insert data into PASSENGER table
INSERT INTO passenger VALUES ('AC01X1Y2Z3', 1, 1, 'CA0000000001', 'ADT', 'Y', 'Y');
INSERT INTO passenger VALUES ('AC01X1Y2Z3', 1, 2, 'CA0000000002', 'ADT', 'Y', 'N');
INSERT INTO passenger VALUES ('AC01X1Y2Z3', 1, 3, 'CA0000000003', 'CHD', 'N', 'Y');
INSERT INTO passenger VALUES ('AC01X1Y2Z3', 1, 4, 'CA0000000004', 'CHD', 'N', 'N');
INSERT INTO passenger VALUES ('AC01X1Y2Z3', 2, 1, 'CA0000000001', 'ADT', 'N', 'N');
INSERT INTO passenger VALUES ('AC01X1Y2Z3', 2, 2, 'CA0000000002', 'ADT', 'N', 'N');
INSERT INTO passenger VALUES ('AC01X1Y2Z3', 2, 3, 'CA0000000003', 'CHD', 'N', 'N');
INSERT INTO passenger VALUES ('AC01X1Y2Z3', 2, 4, 'CA0000000004', 'CHD', 'N', 'N');

--- Create PAYMENT table
CREATE TABLE payment (
  p_trans_ref VARCHAR(20) PRIMARY KEY,
  p_date DATETIME NOT NULL,
  booking_ref VARCHAR(10) NOT NULL,
  payor VARCHAR(90) NOT NULL,
  p_method ENUM('cash','credit card','debit card','cheque','gift card'),
  p_amt FLOAT(10,2) NOT NULL,
  p_ccy VARCHAR(3),
  p_details VARCHAR(50),
  FOREIGN KEY (payor) REFERENCES customer(customer_id),
  FOREIGN KEY (p_ccy) REFERENCES forex(from_ccy)
);
--- Insert data into PAYMENT table
INSERT INTO payment VALUES ('AC01-20220901-123456', '2022-09-01 17:45:15', 'AC01X1Y2Z3', 'CA0000000001', 'credit card', 5000, 'USD', 'Mastercard ending in 0123');
INSERT INTO payment VALUES ('AC01-20220901-123457', '2022-09-01 17:59:23', 'AC01X1Y2Z3', 'CA0000000001', 'cash', 1000, 'CAD', NULL);

--- QUERY #1: Boarding Pass for a specific customer

SELECT 
  cust.last_name, cust.first_name,
  i.carrier_code, i.flight_no,
  i.date_dep, fr.time_dep, fr.airport_dep, 
  i.date_arr, fr.time_arr, fr.arr_nextday, fr.airport_arr,  
  class.class_name
FROM flight_booking fb
LEFT JOIN itinerary i
  ON fb.booking_ref = i.booking_ref
LEFT JOIN class
  ON fb.class_id = class.class_id
LEFT JOIN flight_route fr
  ON i.carrier_code = fr.carrier_code
  AND i.flight_no = fr.flight_no
  AND i.date_dep BETWEEN valid_from AND valid_to
LEFT JOIN passenger pass
  ON i.booking_ref = pass.booking_ref
  AND i.leg_no = pass.leg_no
LEFT JOIN customer cust
  ON pass.p_customer_id = cust.customer_id
WHERE
  fb.booking_status = 'booked'
  AND fb.booking_ref = 'AC01X1Y2Z3' /* given data */
  AND cust.last_name = 'Bouchard' /* given data */
  AND cust.first_name = 'Oliver' /* given data */
ORDER BY i.date_dep
;
 
--- QUERY #2: Count of passengers per class for a specific flight

SELECT 
  carrier_code, flight_no, date_dep, date_arr,
  class_name,
  COUNT(p_customer_id) AS booked_customers
FROM flight_booking fb
LEFT JOIN itinerary i
  ON fb.booking_ref = i.booking_ref
LEFT JOIN class
  ON fb.class_id = class.class_id
LEFT JOIN passenger pass
  ON i.booking_ref = pass.booking_ref
  AND i.leg_no = pass.leg_no
WHERE 
i.carrier_code = 'AC' /* given data */
AND i.flight_no = '874' /* given data */
AND i.date_dep = '2022-10-08' /* given data */
AND i.date_arr = '2022-10-08' /* given data */
GROUP BY class_name
;

--- QUERY #3: Upgrade flight from economy to first class for a customer

UPDATE flight_booking
SET class_id = 'FC'
WHERE booking_ref = 'AC01X1Y2Z3' /* given data */
;

--- QUERY #4: Check available flights for a customer

SELECT
  fi.carrier_code, fi.flight_no,
  fr.airport_dep, fi.date_dep, fr.time_dep, fr.airport_dep,
  fr.airport_arr, fi.date_arr, fr.time_arr, fr.arr_nextday, 
  fr.duration,
  fr.seats_EC AS total_seats_EC,
  COUNT(p.p_customer_id) AS booked_seats_EC
FROM flight_instance fi
LEFT JOIN flight_route fr
  ON fi.carrier_code = fr.carrier_code
  AND fi.flight_no = fr.flight_no
LEFT JOIN itinerary i
  ON fi.carrier_code = i.carrier_code
  AND fi.flight_no = i.flight_no
  AND fi.date_dep = i.date_dep
  AND fi.date_arr = i.date_arr
LEFT JOIN passenger p
  ON i.booking_ref = p.booking_ref
  AND i.leg_no = p.leg_no
LEFT JOIN flight_booking fb
  ON i.booking_ref = fb.booking_ref
WHERE
  fb.booking_status = 'booked'
  AND fb.class_id = 'EC'
  AND DATE(fi.date_dep) >= '2022-09-30'
  AND DATE(fi.date_arr) <= '2022-12-31'
  AND fr.airport_dep = 'YUL'
  AND fr.airport_arr = 'CDG'
GROUP BY fi.carrier_code, fi.flight_no,
  fr.airport_dep, fi.date_dep, fr.time_dep, fr.airport_dep,
  fr.airport_arr, fi.date_arr, fr.time_arr, fr.arr_nextday, 
  fr.duration,
  fr.seats_EC;

--- TEST for EC (no fare)
SELECT
  fi.carrier_code, fi.flight_no,
  fr.airport_dep, fi.date_dep, fr.time_dep,
  fr.airport_arr, fi.date_arr, fr.time_arr, fr.arr_nextday, 
  fr.duration,
  fr.seats_EC AS total_seats_EC,
  COUNT(p.p_customer_id) AS booked_seats_EC,
  (fr.seats_EC - COUNT(p.p_customer_id)) AS available_seats_EC
FROM flight_instance fi
LEFT JOIN flight_route fr
  ON fi.carrier_code = fr.carrier_code
  AND fi.flight_no = fr.flight_no
LEFT JOIN itinerary i
  ON fi.carrier_code = i.carrier_code
  AND fi.flight_no = i.flight_no
  AND fi.date_dep = i.date_dep
  AND fi.date_arr = i.date_arr
LEFT JOIN passenger p
  ON i.booking_ref = p.booking_ref
  AND i.leg_no = p.leg_no
LEFT JOIN flight_booking fb
  ON i.booking_ref = fb.booking_ref
WHERE
  fr.airport_dep = 'YUL'
  AND fr.airport_arr = 'CDG'
  AND DATE(fi.date_dep) >= '2022-09-30'
  AND DATE(fi.date_arr) <= '2022-12-31'
  AND DATE(fr.valid_from) <= '2022-09-30'
  AND DATE(fr.valid_to) >= '2022-12-31'
GROUP BY fi.carrier_code, fi.flight_no,
  fr.airport_dep, fi.date_dep, fr.time_dep, fr.airport_dep,
  fr.airport_arr, fi.date_arr, fr.time_arr, fr.arr_nextday, 
  fr.duration,
  fr.seats_EC;

--- TEST FOR EC with fare
SELECT
  fi.carrier_code, fi.flight_no,
  fr.airport_dep, fi.date_dep, fr.time_dep,
  fr.airport_arr, fi.date_arr, fr.time_arr, fr.arr_nextday, 
  fr.duration,
  fr.seats_EC AS total_seats_EC,
  COUNT(p.p_customer_id) AS booked_seats_EC,
  (fr.seats_EC - COUNT(p.p_customer_id)) AS available_seats_EC,
  CONCAT(f.from_ccy, " ", FORMAT(fi.fare_basic,2)) AS fare_EC1,
  CONCAT(f.to_ccy, " ", FORMAT(fi.fare_basic * f.exch_rate,2)) AS fare_EC2
FROM flight_instance fi
LEFT JOIN airline a
  ON fi.carrier_code = a.carrier_code
LEFT JOIN country c
  ON a.country_code = c.country_code
LEFT JOIN forex f
  ON c.currency_code = f.from_ccy 
LEFT JOIN flight_route fr
  ON fi.carrier_code = fr.carrier_code
  AND fi.flight_no = fr.flight_no
LEFT JOIN itinerary i
  ON fi.carrier_code = i.carrier_code
  AND fi.flight_no = i.flight_no
  AND fi.date_dep = i.date_dep
  AND fi.date_arr = i.date_arr
LEFT JOIN passenger p
  ON i.booking_ref = p.booking_ref
  AND i.leg_no = p.leg_no
LEFT JOIN flight_booking fb
  ON i.booking_ref = fb.booking_ref
WHERE
  fr.airport_dep = 'YUL'
  AND fr.airport_arr = 'CDG'
  AND DATE(fi.date_dep) >= '2022-09-30'
  AND DATE(fi.date_arr) <= '2022-12-31'
  AND DATE(fr.valid_from) <= '2022-09-30'
  AND DATE(fr.valid_to) >= '2022-12-31'
  AND f.to_ccy = 'USD'
GROUP BY fi.carrier_code, fi.flight_no,
  fr.airport_dep, fi.date_dep, fr.time_dep, fr.airport_dep,
  fr.airport_arr, fi.date_arr, fr.time_arr, fr.arr_nextday, 
  fr.duration,
  fr.seats_EC, f.exch_rate;


--- QUERY #5: Add a second number for a customer
-- Step1: Get passport number or customer's name. Verify other info to confirm identity. Determine customerID.
SELECT * FROM customer
WHERE passport_no = 'AB123456';
-- or
SELECT * FROM customer
WHERE last_name = 'Bouchard' AND first_name = 'Oliver';
-- Step2: Insert second phone record for the customer
INSERT INTO phone (customer_id,	phone_seq,	p_type,	p_country_code,	area_code,	local_number)
VALUES ('UK0000000001', '2', 'mobile', '1', '404', '9876543');

--- QUERY #6: names of all the people that will be arriving at an airport at one of the cities on a particular day
SELECT
a.city_name, i.date_arr,
a.airport_name, i.carrier_code, i.flight_no,
cust.last_name, cust.first_name, cust.middle_name
FROM customer cust
RIGHT JOIN passenger p
ON cust.customer_id = p.p_customer_id
LEFT JOIN itinerary i
ON p.booking_ref = i.booking_ref AND p.leg_no = i.leg_no 
LEFT JOIN flight_route fr
ON i.carrier_code = fr.carrier_code AND i.flight_no = fr.flight_no
LEFT JOIN airport a
ON a.airport_code = fr.airport_arr
WHERE DATE(fr.valid_to) >= '2022-10-08' 
AND a.city_name = 'Paris' AND i.date_arr = '2022-10-08'
ORDER BY cust.last_name, cust.first_name, cust.middle_name
;

--- QUERY #7: update all flights for a given city to be delayed due to bad weather
-- Update departing flights from Paris on 2022-10-31:
UPDATE flight_instance fi
LEFT JOIN flight_route fr
ON fi.carrier_code = fr.carrier_code AND fi.flight_no = fr.flight_no
LEFT JOIN airport a
ON fr.airport_dep = a.airport_code
SET fi.flight_status = 'on-schedule'
WHERE
DATE(fr.valid_to) >= '2022-10-31'
AND a.city_name ='Paris'
AND fi.date_dep = '2022-10-31'
;
-- Update arriving flights from Paris on 2022-10-08:
UPDATE flight_instance fi
LEFT JOIN flight_route fr
ON fi.carrier_code = fr.carrier_code AND fi.flight_no = fr.flight_no
LEFT JOIN airport a
ON fr.airport_arr = a.airport_code
SET fi.flight_status = 'on-schedule'
WHERE
DATE(fr.valid_to) >= '2022-10-08'
AND a.city_name ='Paris'
AND fi.date_dep = '2022-10-08'
;

--- QUERY #8: remove a flight that has booked passengers
-- Step 1: Get list of all customers for a flight with booked passengers, including email address.
-- This list will be used to notify affected customers.

SELECT i.carrier_code, i.flight_no, fr.airport_dep, i.date_dep, fr.time_dep,  
  fr.airport_arr, i.date_arr, fr.time_arr, fr.arr_nextday,
  class.class_name, c.last_name, c.first_name, e.email_address 
FROM flight_booking fb
LEFT JOIN itinerary i ON fb.booking_ref = i.booking_ref
LEFT JOIN class ON fb.class_id = class.class_id
LEFT JOIN flight_route fr
  ON i.carrier_code = fr.carrier_code
  AND i.flight_no = fr.flight_no
  AND i.date_dep BETWEEN valid_from AND valid_to
LEFT JOIN passenger p
  ON i.booking_ref = p.booking_ref
  AND i.leg_no = p.leg_no
LEFT JOIN customer c ON p.p_customer_id = c.customer_id
LEFT JOIN email e ON p.p_customer_id = e.customer_id
WHERE fb.booking_status = 'booked'
AND DATE(i.date_dep) > CURDATE();

--- Step 2: Once all passengers have been notified and any necessary action taken,
--- proceed with deletion of flight in the flight_instance table using
--- carrier code, flight number, date of departure, date of arrival

DELETE FROM flight_instance
WHERE
  carrier_code = /* carrier code */
  AND flight_no = /* flight no */
  AND date_dep = /* date of departure */
  date_arr = /* date of arrival */
;

--- QUERY #9

-- Step 1: Get total available seats for all scheduled flights for the month.
SELECT SUM(seats_EC + seats_BC + seats_FC) AS total_seats_this_month
FROM flight_instance fi
LEFT JOIN flight_route fr
  ON fi.carrier_code = fr.carrier_code AND fi.flight_no = fr.flight_no
LEFT JOIN itinerary i
  ON fi.carrier_code = i.carrier_code AND fi.flight_no = i.flight_no AND fi.date_dep = i.date_dep
WHERE
  fi.carrier_code = 'AC'
  AND DATE(fi.date_dep) BETWEEN '2022-10-01' AND '2022-10-31'
  AND DATE(fi.date_dep) BETWEEN valid_from AND valid_to;

-- Step 2: Get total booked seats for all schedule flights for the month.
-- Note: This cannot be done in the same query because the condition [booking_status = 'booked'] cannot be used for Step 1.
-- Doing so will exclude the flights where no seats have yet been sold.
-- Use results from step 1 and step 2 to get the rate of booked seats/available
SELECT COUNT(p.p_customer_id) AS booked_seats_this_month
FROM flight_instance fi
LEFT JOIN flight_route fr
  ON fi.carrier_code = fr.carrier_code AND fi.flight_no = fr.flight_no
LEFT JOIN itinerary i
  ON fi.carrier_code = i.carrier_code AND fi.flight_no = i.flight_no AND fi.date_dep = i.date_dep
LEFT JOIN flight_booking fb
  ON i.booking_ref = fb.booking_ref
LEFT JOIN passenger p
  ON i.booking_ref = p.booking_ref AND i.leg_no = p.leg_no
WHERE
  fb.booking_status = 'booked'
  AND fi.carrier_code = 'AC'
  AND DATE(fi.date_dep) BETWEEN '2022-10-01' AND '2022-10-31'
  AND DATE(fi.date_dep) BETWEEN valid_from AND valid_to;

-- Step 3: Calculate total revenue based on fare per passenger on all booked flights this month
-- Fare per passenger is based on basic fare, flight class, and fare type (adult, child, infant)
-- include add-on fees for seat and meal

SELECT
  FORMAT(SUM((fi.fare_basic * f.f_multiplier * c.c_multiplier)
  + IF (prem_meal ='Y', addon_meal, 0)
  + IF (prem_seat = 'Y', addon_seat, 0)),2) AS total_revenue_this_month
FROM flight_instance fi
LEFT JOIN flight_route fr
  ON fi.carrier_code = fr.carrier_code AND fi.flight_no = fr.flight_no
LEFT JOIN itinerary i
  ON fi.carrier_code = i.carrier_code AND fi.flight_no = i.flight_no AND fi.date_dep = i.date_dep
LEFT JOIN flight_booking fb
  ON i.booking_ref = fb.booking_ref
LEFT JOIN passenger p
  ON i.booking_ref = p.booking_ref AND i.leg_no = p.leg_no
LEFT JOIN class c
  ON fb.class_id = c.class_id
LEFT JOIN fare f
  ON p.fare_id = f.fare_id
WHERE
  fb.booking_status = 'booked'
  AND fi.carrier_code = 'AC'
  AND DATE(fi.date_dep) BETWEEN '2022-10-01' AND '2022-10-31'
  AND DATE(fi.date_dep) BETWEEN valid_from AND valid_to;

  --- Apply CHECKS

  -- email
  ALTER TABLE email
  ADD CONSTRAINT chk_email CHECK (email_address LIKE '%_@_%._%');

ALTER table customer
ADD CONSTRAINT u_passport_no UNIQUE (passport_no);

ALTER TABLE passenger
ALTER prem_meal SET DEFAULT 'N';

ALTER TABLE passenger
ALTER prem_seat SET DEFAULT 'N';