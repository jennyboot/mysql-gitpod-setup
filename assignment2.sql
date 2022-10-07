CREATE DATABASE assignment2;
USE assignment2;

--- Create FOREX table (1 of 17)
CREATE TABLE forex (
  from_ccy VARCHAR(3) NOT NULL,
  to_ccy VARCHAR(3) NOT NULL,
  trade_date DATE NOT NULL,
  exch_rate FLOAT(10,4) NOT NULL,
  PRIMARY KEY (from_ccy, to_ccy, trade_date)
);

--- Insert data into FOREX table
INSERT INTO forex (from_ccy, to_ccy, trade_date, exch_rate) VALUES ('CAD', 'USD', '2022-10-06', 0.7279);
INSERT INTO forex (from_ccy, to_ccy, trade_date, exch_rate) VALUES ('CAD', 'GBP', '2022-10-06', 0.6524);
INSERT INTO forex (from_ccy, to_ccy, trade_date, exch_rate) VALUES ('CAD', 'FF', '2022-10-06', 0.743);
INSERT INTO forex (from_ccy, to_ccy, trade_date, exch_rate) VALUES ('CAD', 'DM', '2022-10-06', 0.7521);
INSERT INTO forex (from_ccy, to_ccy, trade_date, exch_rate) VALUES ('CAD', 'ITL', '2022-10-06', 0.7724);
INSERT INTO forex (from_ccy, to_ccy, trade_date, exch_rate) VALUES ('USD', 'CAD', '2022-10-06', 1.3739);
INSERT INTO forex (from_ccy, to_ccy, trade_date, exch_rate) VALUES ('USD', 'GBP', '2022-10-06', 0.8964);
INSERT INTO forex (from_ccy, to_ccy, trade_date, exch_rate) VALUES ('USD', 'FF', '2022-10-06', 1.0209);
INSERT INTO forex (from_ccy, to_ccy, trade_date, exch_rate) VALUES ('USD', 'DM', '2022-10-06', 1.0394);
INSERT INTO forex (from_ccy, to_ccy, trade_date, exch_rate) VALUES ('USD', 'ITL', '2022-10-06', 1.0399);

--- Create COUNTRY table (2 of 17)
CREATE TABLE country (
  country_code VARCHAR(2) NOT NULL PRIMARY KEY,
  country_name VARCHAR(60),
  currency_code VARCHAR(3)
);

--- Insert data into COUNTRY table
INSERT INTO country (country_code, country_name, currency_code) VALUES ('CA', 'Canada', 'CAD');
INSERT INTO country (country_code, country_name, currency_code) VALUES ('US', 'USA', 'USD');
INSERT INTO country (country_code, country_name, currency_code) VALUES ('UK', 'UK', 'GBP');
INSERT INTO country (country_code, country_name, currency_code) VALUES ('FR', 'France', 'FF');
INSERT INTO country (country_code, country_name, currency_code) VALUES ('DE', 'Germany', 'DM');
INSERT INTO country (country_code, country_name, currency_code) VALUES ('IT', 'Italy', 'ITL');
INSERT INTO country (country_code, country_name, currency_code) VALUES ('PH', 'Philippines', 'PHP');
INSERT INTO country (country_code, country_name, currency_code) VALUES ('IN', 'India', 'INR');
INSERT INTO country (country_code, country_name, currency_code) VALUES ('BR', 'Brazil', 'BRL');
INSERT INTO country (country_code, country_name, currency_code) VALUES ('CO', 'Colombia', 'COP');
INSERT INTO country (country_code, country_name, currency_code) VALUES ('IR', 'Iran', 'IRR');
INSERT INTO country (country_code, country_name, currency_code) VALUES ('NG', 'Nigeria', 'NGN');

--- Create AIRLINE table (3 of 17)
CREATE TABLE airline (
  carrier_code VARCHAR(2) NOT NULL PRIMARY KEY,
  airline_name VARCHAR(30) NOT NULL,
  country_code VARCHAR(2)
);

--- Insert data into AIRLINE table
INSERT INTO airline (carrier_code, airline_name, country_code) VALUES ('AC', 'Air Canada', 'CA');
INSERT INTO airline (carrier_code, airline_name, country_code) VALUES ('AA', 'US Airways', 'US');
INSERT INTO airline (carrier_code, airline_name, country_code) VALUES ('BA', 'British Airways', 'UK');
INSERT INTO airline (carrier_code, airline_name, country_code) VALUES ('AF', 'Air France', 'FR');
INSERT INTO airline (carrier_code, airline_name, country_code) VALUES ('LH', 'Luftansa Air', 'DE');
INSERT INTO airline (carrier_code, airline_name, country_code) VALUES ('AZ', 'Air Italia', 'IT');
