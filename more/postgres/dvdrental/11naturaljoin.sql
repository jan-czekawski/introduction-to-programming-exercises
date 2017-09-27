CREATE TABLE categories (
 category_id serial PRIMARY KEY,
 category_name VARCHAR (255) NOT NULL
);

CREATE TABLE products (
 product_id serial PRIMARY KEY,
 product_name VARCHAR (255) NOT NULL,
 category_id INT NOT NULL,
 FOREIGN KEY (category_id) REFERENCES categories (category_id) 
 -- It should've been categories (category_id) NOT "category"
);

-- later products had group_id instead of category_id => but categories still have category_id col
ALTER TABLE products ADD FOREIGN KEY (group_id) REFERENCES categories (category_id);
-- but it's been changed since then with:
ALTER TABLE products RENAME COLUMN group_id TO category_id;



INSERT INTO categories (category_name)
VALUES
 ('Smart Phone'),
 ('Laptop'),
 ('Tablet');
 
INSERT INTO products (product_name, category_id)
VALUES
 ('iPhone', 1),
 ('Samsung Galaxy', 1),
 ('HP Elite', 2),
 ('Lenovo Thinkpad', 2),
 ('iPad', 3),
 ('Kindle Fire', 3);
 
SELECT
 *
FROM
 products
NATURAL JOIN categories;

SELECT
 *
FROM
 products
INNER JOIN categories USING (category_id);

