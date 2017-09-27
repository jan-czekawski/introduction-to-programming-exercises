CREATE TABLE assets (
  id serial PRIMARY KEY,
    name TEXT NOT NULL,
    asset_no VARCHAR NOT NULL,
    description TEXT,
    LOCATION TEXT,
    acquired_date DATE NOT NULL
);


INSERT INTO assets (
  NAME,
    asset_no,
    location,
    acquired_date
)
VALUES
  ('Server', '10001', 'Server room', '2017-01-01'),
    ('UPS', '10002', 'Server room', '2017-02-01');

-- alter column data type
ALTER TABLE assets ALTER COLUMN name TYPE VARCHAR;


ALTER TABLE assets
  ALTER COLUMN location TYPE VARCHAR,
  ALTER COLUMN description TYPE VARCHAR;

-- issues an error (asks to specify USING clause)
ALTER TABLE assets
  ALTER COLUMN asset_no TYPE INT;

-- no error, when explicitly using USING => doing cast to integer as expression
ALTER TABLE assets
  ALTER COLUMN asset_no TYPE INT USING asset_no::integer;