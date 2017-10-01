-- no PARTITION BY function treated whole set as 1 partition
-- product_id and row number have the same values
SELECT
 product_id,
 product_name,
 group_id,
 ROW_NUMBER() OVER (ORDER BY product_id)
FROM
 products;

-- order by product name (alphabetically)
SELECT
 product_id,
 product_name,
 group_id,
 ROW_NUMBER() OVER (ORDER BY product_name)
FROM
 products;

-- window is divided into subsets (based on values in the group_id)
-- row number starts at 1 in each partition
SELECT
 product_id,
 product_name,
 group_id,
 ROW_NUMBER() OVER (PARTITION BY group_id ORDER BY product_name)
FROM
 products;

-- assigns int to distinct prices from the products table
-- result is not expected (it includes duplicate prices)
-- row_number() operates on the result set, before DISTINCT is applied
SELECT DISTINCT
 price,
 ROW_NUMBER() OVER (ORDER BY price)
FROM
 products
ORDER BY price;


-- can get list of distinct prices in CTE, then apply row_number in the outer query:
WITH prices AS (
 SELECT DISTINCT
  price
 FROM
  products
) SELECT
 price,
 ROW_NUMBER() OVER (ORDER BY price)
FROM
 prices;  -- table "prices" doesn't exist => it uses "prices" defined in WITH

-- or we can use subquery in the FROM clause to get list of unique price, then apply row_number
SELECT
 price,
 ROW_NUMBER() OVER (ORDER BY price)
FROM
 (
  SELECT DISTINCT
   price
  FROM
   products
 ) prices;   -- alias is required for subquery


-- can use pagination technique to display subset of rows instead of all table (beside using LIMIT)
--  "x" is alias (not optional) for subquery
SELECT
 *
FROM
 (
  SELECT
   product_id,
   product_name,
   price,
   ROW_NUMBER() OVER (ORDER BY product_name)
  FROM
   products
 ) x
WHERE
 ROW_NUMBER BETWEEN 6 AND 10; 

-- to get 7th (cause result has multiple rows) most expensive product, first we get distinct prices,
-- and select the price whose row number is 7. Then in outer query we get the products with the price
-- equals 3rd highest place
SELECT
  *
FROM
  products
WHERE
  price = (
    SELECT
      price
    FROM(
      SELECT
        price,
        ROW_NUMBER () OVER (ORDER BY price DESC) nth
      FROM(
        SELECT DISTINCT
          (price)
         FROM
          products
      ) prices
    ) sorted_prices
    WHERE nth = 7
  );
