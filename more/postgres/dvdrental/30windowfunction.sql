CREATE TABLE product_groups (
 group_id serial PRIMARY KEY,
 group_name VARCHAR (255) NOT NULL
);

CREATE TABLE products (
 product_id serial PRIMARY KEY,
 product_name VARCHAR(255) NOT NULL,
 price DECIMAL (11, 2),
 group_id INT NOT NULL,
 FOREIGN KEY (group_id) REFERENCES product_groups (group_id)
);


INSERT INTO product_groups (group_name)
VALUES 
 ('Smartphone'),
 ('Laptop'),
 ('Tablet');
 
INSERT INTO products (product_name, group_id, price)
VALUES
 ('Microsoft Lumia', 1, 200),
 ('HTC One', 1, 400),
 ('Nexus', 1, 500),
 ('iPhone', 1, 900),
 ('HP Elite', 2, 1200),
 ('Lenovo Thinkpad', 2, 700),
 ('Sony VAIO', 2, 700),
 ('Dell Vostro', 2, 800),
 ('iPad', 3, 700),
 ('Kindle Fire', 3, 150),
 ('Samsung Galaxy Tab', 3, 200);

SELECT
 AVG(price)
FROM
 products;

-- aggregate functions reduce number of rows, when returned by query

 SELECT
 group_name,
 AVG(price)
FROM
 products
INNER JOIN product_groups USING (group_id)
GROUP BY
 group_name;


-- window functions do not reduce number of rows

-- it returns product name, price, group name, average prices of each product group
SELECT
 product_name,
 price,
 group_name,
 AVG(price) OVER (PARTITION BY group_name)
FROM
 products
INNER JOIN product_groups USING (group_id);


-- row number assigns running serial number to rows in each partition
SELECT
 product_name,
 group_name,
 price,
 ROW_NUMBER() OVER (PARTITION BY group_name ORDER BY price)
FROM
 products
INNER JOIN product_groups USING (group_id);

-- rank assigns ranking within ordered partition. if the values of 2 rows are the same
-- rank assigns same rank and skips the next rank
SELECT
 product_name,
 group_name,
 price,
 RANK() OVER (PARTITION BY group_name ORDER BY price)
FROM
 products
INNER JOIN product_groups USING (group_id);


-- dense_rank => ranks are consecutive (same ranks assigned to multiple rows, no ranks are skipped)
SELECT
 product_name,
 group_name,
 price,
 DENSE_RANK() OVER (PARTITION BY group_name ORDER BY price)
FROM
 products
INNER JOIN product_groups USING (group_id);


-- first_value returns first value from the first row of the ordered set
SELECT
 product_name,
 group_name,
 price,
 FIRST_VALUE(price) OVER (PARTITION BY group_name ORDER BY price) AS lowest_price_per_group
FROM
 products
INNER JOIN product_groups USING (group_id);


-- last value
-- have to add RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
-- because by default it's RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW;
SELECT
 product_name,
 group_name,
 price,
 LAST_VALUE(price) OVER (
  PARTITION BY group_name
  ORDER BY price
  RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
  AS highest_price_per_group
FROM
 products
INNER JOIN product_groups USING (group_id);


-- return prices from the previous row and calculates difference between price of curr and prev row
SELECT
 product_name,
 group_name,
 price,
 LAG (price, 1) OVER (PARTITION BY group_name ORDER BY price) AS prev_price,
 price - LAG (price, 1) OVER (PARTITION BY group_name ORDER BY price) AS cur_prev_diff
FROM
 products
INNER JOIN product_groups USING (group_id);

-- using lead => returns prices from next row and calculates the difference between price of curr and next row
SELECT
 product_name,
 group_name,
 price,
 LEAD (price, 1) OVER (PARTITION BY group_name ORDER BY price) AS next_price,
 price - LEAD (price, 1) OVER (PARTITION BY group_name ORDER BY price) AS cur_next_diff
FROM
 products
INNER JOIN product_groups USING (group_id);