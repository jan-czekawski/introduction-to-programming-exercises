CREATE TABLE IF NOT EXISTS products1 (
  id serial PRIMARY KEY,
    name VARCHAR NOT NULL,
    price NUMERIC (5, 2)
);

-- scale exceeds defined scale (number of digits after ".") => postgres will round it
INSERT INTO products1 (NAME, price)
VALUES
  ('Phone', 500.215), # => 500.22
    ('Tablet', 500.214); # => 500.21

-- precision exceeded => error
INSERT INTO products1 (NAME, price)
VALUES
  ('Phone', 123456.21);

-- have to use '' with NaN
UPDATE products1
SET price = 'NaN'
WHERE id = 1;

-- can sort NaN => can sort NUMERIC => NaN == NaN (true in Postgres, false usually)
-- NaN is > than non-NaN (eg 500.21)
SELECT * FROM products1 ORDER BY price DESC;