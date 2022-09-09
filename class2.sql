CREATE DATABASE day2;
USE day2;

CREATE TABLE People (
    id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    age INT DEFAULT 18,
    CHECK (age>=18)
);

INSERT INTO People (first_name, last_name, age) VALUES ('Justin','Trudeau', 5);
/* will result in error: Check Constraint 'People_chk_1' is violated. */

INSERT INTO People (first_name, last_name, age) VALUES ('Justin','Trudeau', 55);
/* this one worked: Query ok, 1 row affected (0,00 sec) */

CREATE TABLE Addresses (
    id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    fk_people_id INT NOT NULL,
    street VARCHAR(100),
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    INDEX idx_addresses_city (city),
    FOREIGN KEY(fk_people_id)
        REFERENCES People(id) /* People.id did not work */
        ON DELETE CASCADE
);

SELECT * FROM People; /* returned 1 row in set */

INSERT INTO People (first_name, last_name, age) VALUES ('Joe','Biden', 78);
INSERT INTO People (first_name, last_name, age) VALUES ('Hassanal','Bolkiah', 69);

INSERT INTO Addresses (fk_people_id, city, country) VALUES (2,'Ottawa','Canada');
/* this worked because there is a 2nd entry in People */

INSERT INTO Addresses (fk_people_id, city, country) VALUES (6,'Ottawa','Canada');
/* This did not work. Error: Cannot add or update a child row: a foreigh ket constraint fails... */

INSERT INTO People (first_name, last_name, age) VALUES ('Queen','Elizabeth', 96);

INSERT INTO Addresses (fk_people_id, city, country) VALUES (1,'Ottawa','Canada');
INSERT INTO Addresses (fk_people_id, city, country) VALUES (2,'Washington DC','USA');
INSERT INTO Addresses (fk_people_id, city, country) VALUES (3,'Bandar Seri Begawan','Brunei');
INSERT INTO Addresses (fk_people_id, city, country) VALUES (4,'London','England');

SELECT * FROM People INNER JOIN Addresses ON People.id=Addresses.fk_people_id;
SELECT * FROM People, Addresses WHERE People.id=Addresses.fk_people_id;
/* Both statements above will show the same results */

/* To fix the Addresses Table */
DELETE FROM Addresses WHERE id <> 1; 