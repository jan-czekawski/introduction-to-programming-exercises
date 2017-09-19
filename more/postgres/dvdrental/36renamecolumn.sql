CREATE TABLE customer_groups (
  id serial PRIMARY KEY,
    name VARCHAR NOT NULL
);

-- had to rename old "customers" table to "comp_customers"
CREATE TABLE customers (
  id serial PRIMARY KEY,
    name VARCHAR NOT NULL,
    phone VARCHAR NOT NULL,
    email VARCHAR,
    group_id INT,
    FOREIGN KEY (group_id) REFERENCES customer_groups (id)
);


CREATE VIEW customer_data 
AS SELECT
    c.id,
    c.name,
    g.name customer_group
FROM
    customers c
INNER JOIN customer_groups g ON g.id = c.group_id;


ALTER TABLE customers
RENAME COLUMN email TO contact_email;

-- after rename, view is also updated (dependent customer_groups table)
ALTER TABLE customer_groups
RENAME COLUMN name TO group_name;

-- there was syntax error when trying to rename multiple columns
ALTER TABLE customers
RENAME COLUMN name TO customer_name,
RENAME COLUMN phone TO contact_phone;


ALTER TABLE customers
RENAME COLUMN phone TO contact_phone;

ALTER TABLE customers
RENAME COLUMN name TO customer_name;