CREATE TEMPORARY TABLE temp_table(
);

CREATE TEMP TABLE temp_table2 (
); 


in psql
CREATE DATABASE test;
\c test;

CREATE TEMP TABLE mytemp(c INT);
SELECT * FROM mytemp;

-- after launching another session
SELECT * FROM mytemp; #=> error

\q => to quit session

-- login to psql again
SELECT * FROM mytemp; #=> error


CREATE TABLE customers(id SERIAL PRIMARY KEY, name VARCHAR NOT NULL);
CREATE TEMP TABLE customers(customer_id INT);

SELECT * FROM customers #=> will access temp table
\d #=> will not show permanent table

-- can just drop temp table (no TEMP/TEMPORARY keyword)
DROP TABLE customers;
\d #=> will show permanent table