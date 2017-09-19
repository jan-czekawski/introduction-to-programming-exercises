CREATE TABLE po_headers (
  po_no INTEGER PRIMARY KEY,
  vendor_no INTEGER,
  description TEXT,
  shipping_address TEXT
);

-- multiple table pk
CREATE TABLE po_items (
  po_no INTEGER,
  item_no INTEGER,
  product_no INTEGER,
  qty INTEGER,
  net_price NUMERIC,
  PRIMARY KEY (po_no, item_no)
);

-- define pk for existing table
ALTER TABLE table1 ADD PRIMARY KEY (col1, col2);

-- table without pk
CREATE TABLE products (
  product_no INTEGER,
  description TEXT,
  product_cost NUMERIC
);

ALTER TABLE products ADD PRIMARY KEY (product_no);

-- TO ADD SERIAL PK TO EXISTING TABLE
CREATE TABLE vendors (name VARCHAR(255));

INSERT INTO vendors (name)
VALUES
  ('Microsoft'),
  ('IBM'),
  ('Apple'),
  ('Samsung');

-- add pk and serial
ALTER TABLE vendors ADD COLUMN ID SERIAL PRIMARY KEY;

SELECT id, name FROM vendors;

-- same result but different order
SELECT * FROM vendors;

-- drop pk constraint (name has 1 at the end) => can check it in the psql or schema in pgAdmin
ALTER TABLE vendors DROP CONSTRAINT vendors_pkey1;





