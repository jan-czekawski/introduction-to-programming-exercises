CREATE TABLE new_customers (
 id SERIAL PRIMARY KEY,
 customer_name VARCHAR NOT NULL
);

ALTER TABLE new_customers
ADD COLUMN phone VARCHAR;


ALTER TABLE new_customers
ADD COLUMN fax VARCHAR,
ADD COLUMN email VARCHAR;



INSERT INTO new_customers (customer_name)
VALUES
 ('Apple'),
 ('Samsung'),
 ('Sony');


-- can't add that column, cause it would need to have NULL for 3 existing rows;
ALTER TABLE new_customers
ADD COLUMN contact_name VARCHAR NOT NULL;

-- first have to add it without constraint
ALTER TABLE new_customers
ADD COLUMN contact_name VARCHAR;

-- update that column with some data
UPDATE new_customers
SET contact_name = 'John Doe'
WHERE
 ID = 1;
 
UPDATE new_customers
SET contact_name = 'Mary Doe'
WHERE
 ID = 2;
 
UPDATE new_customers
SET contact_name = 'Lily Bush'
WHERE
 ID = 3;

-- alter column (add constraint)
ALTER TABLE new_customers
ALTER COLUMN contact_name SET NOT NULL;

-- another way: first add column with constraints and default value
ALTER TABLE new_customers
ADD COLUMN picture VARCHAR NOT NULL DEFAULT 'empty';

-- udpate data
UPDATE new_customers
SET picture = 'John.jpeg'
WHERE
 ID = 1;
 
UPDATE new_customers
SET picture = 'Mary.jpeg'
WHERE
 ID = 2;
 
UPDATE new_customers
SET picture = 'Lily.jpeg'
WHERE
 ID = 3;

-- remove default value from column
ALTER TABLE new_customers
ALTER COLUMN picture
DROP DEFAULT;