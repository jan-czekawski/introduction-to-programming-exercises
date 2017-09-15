-- create table and add some values to show intersect operator
CREATE TABLE employees (
 employee_id SERIAL PRIMARY KEY,
 employee_name VARCHAR (255) NOT NULL
);

CREATE TABLE keys (
 employee_id INT PRIMARY KEY,
 effective_date DATE NOT NULL,
 FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);

CREATE TABLE hipos (
 employee_id INT PRIMARY KEY,
 effective_date DATE NOT NULL,
 FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);

-- employees stores master data, keys table stores key employees,
-- hipos table stores employees who are high potential and high impact

INSERT INTO employees (employee_name)
VALUES
 ('Joyce Edwards'),
 ('Diane Collins'),
 ('Alice Stewart'),
 ('Julie Sanchez'),
 ('Heather Morris'),
 ('Teresa Rogers'),
 ('Doris Reed'),
 ('Gloria Cook'),
 ('Evelyn Morgan'),
 ('Jean Bell');
 
INSERT INTO keys
VALUES
 (1, '2000-02-01'),
 (2, '2001-06-01'),
 (5, '2002-01-01'),
 (7, '2005-06-01');
 
INSERT INTO hipos
VALUES
 (9, '2000-01-01'),
 (2, '2002-06-01'),
 (5, '2006-06-01'),
 (10, '2005-06-01');
 
SELECT
 employee_id
FROM
 keys;
 
SELECT
 employee_id
FROM
 hipos;
 
-- to get employees who are both keys and hipos
SELECT
 employee_id
FROM
 keys
INTERSECT
SELECT
 employee_id
FROM
 hipos;
 

SELECT
 employee_id
FROM
 keys
INTERSECT
SELECT
 employee_id
FROM
 hipos
ORDER BY
 employee_id;