CREATE TABLE customers (
 customer_id SERIAL PRIMARY KEY,
 name VARCHAR UNIQUE,
 email VARCHAR NOT NULL,
 active BOOL NOT NULL DEFAULT TRUE
);

-- to display from pgAdmin
SELECT *
FROM information_schema.columns
WHERE table_schema = 'public'
AND table_name = 'customers';

-- to display from sql shell
\c dvdrental
\d customers

INSERT INTO customers (NAME, email)
VALUES
 ('IBM', 'contact@ibm.com'),
 ('Microsoft', 'contact@microsoft.com'),
 ('Intel', 'contact@intel.com');

SELECT * FROM customers;

INSERT INTO
 customers (NAME, email)
VALUES
 ('Microsoft', 'hotline@microsoft.com')
ON CONFLICT ON CONSTRAINT customers_name_key
DO NOTHING;

-- same result
INSERT INTO customers (name, email)
VALUES
 ('Microsoft', 'hotline@microsoft.com')
ON CONFLICT (name)
DO NOTHING;


-- to concatenate new email with old email when inserting customer that already exists
-- new email will come first (EXCLUDED)
INSERT INTO customers (name, email)
VALUES
 ('Microsoft', 'hotline@microsoft.com')
ON CONFLICT (name)
DO 
 UPDATE
  SET email = EXCLUDED.email || ';' || customers.email;