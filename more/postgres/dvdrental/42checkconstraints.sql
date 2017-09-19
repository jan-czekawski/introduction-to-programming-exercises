-- employees was already in the db
ALTER TABLE employees RENAME TO new_employees;


CREATE TABLE employees(
  id serial PRIMARY KEY,
    first_name VARCHAR (50),
    last_name VARCHAR (50),
    birth_date DATE CHECK (birth_date > '1900-01-01'),
    joined_date DATE CHECK (joined_date > birth_date),
    salary numeric CHECK (salary > 0) -- salary numeric CONSTRAINT positive_salary CHECK (salary > 0) => name
);

-- will display error, casue violates check constraint (salary) => employees_salary_check => name of constraint (default)
INSERT INTO employees (first_name, last_name, birth_date, joined_date, salary)
VALUES ('John', 'Doe', '1972-01-01', '2015-07-01', -100000);


CREATE TABLE IF NOT EXISTS prices_list (
  id serial PRIMARY KEY,
    product_id INT NOT NULL,
    price NUMERIC NOT NULL,
    discount NUMERIC NOT NULL,
    valid_from DATE NOT NULL,
    valid_to DATE NOT NULL
);

-- add constraint to existing table (notice AND)
ALTER TABLE prices_list ADD CONSTRAINT price_discount_check CHECK (
    price > 0
  AND discount >= 0
    AND price > discount
);


ALTER TABLE prices_list ADD CONSTRAINT valid_range_check CHECK (valid_to >= valid_from);

