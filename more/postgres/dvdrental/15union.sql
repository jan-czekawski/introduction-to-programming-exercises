CREATE TABLE sales2007q1 (
 salesman_id SERIAL PRIMARY KEY,
 name VARCHAR(50) DEFAULT NULL,
 amount INT DEFAULT NULL
);

CREATE TABLE sales2007q2 (
 salesman_id SERIAL PRIMARY KEY,
 name VARCHAR(50) DEFAULT NULL,
 amount INT DEFAULT NULL
);

INSERT INTO sales2007q1
 (name, amount)
VALUES
 ('Mike', 15000),
 ('Jon', 13200),
 ('Mary', 10000);
 
INSERT INTO sales2007q2
 (name, amount)
VALUES
 ('Mike', 18000),
 ('Jon', 11200),
 ('Mary', 10000);
 
SELECT *
FROM
 sales2007q1
UNION
SELECT *
FROM
 sales2007q2;
 
SELECT *
FROM
 sales2007q1
UNION ALL
SELECT *
FROM
 sales2007q2;
 
SELECT *
FROM
 sales2007q1
UNION ALL
SELECT *
FROM
 sales2007q2
ORDER BY
 name ASC,
 amount DESC;