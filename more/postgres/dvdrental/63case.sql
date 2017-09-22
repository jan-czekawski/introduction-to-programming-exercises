CREATE OR REPLACE FUNCTION get_price_segment(p_film_id integer)
  RETURNS VARCHAR(50) AS $$
DECLARE
  rate NUMERIC;
  price_segment VARCHAR(50);
BEGIN
  -- get rate based on film_id
  SELECT INTO  rate rental_rate
  FROM film
  WHERE film_id = p_film_id;

  CASE rate
  WHEN 0.99 THEN
    price_segment = 'Mass';
  WHEN 2.99 THEN
    price_segment = 'Mainstream';
  WHEN 4.99 THEN
    price_segment = 'High End';
  ELSE
    price_segment = 'Unspecified';
  END CASE;

  RETURN price_segment;
END; $$
LANGUAGE PLPGSQL;

-- to get price segment of the movie
SELECT get_price_segment(123) AS "Price Segment";

-- accepts p_customer_id as arg. It first gets total payment paid by customer from the payment table.
-- based on total payment, function uses searched CASE statement to return the service level.
CREATE OR REPLACE FUNCTION get_customer_service (p_customer_id INTEGER)
  RETURNS VARCHAR (25) AS $$
DECLARE
  total_payment NUMERIC;
  service_level VARCHAR(25);
BEGIN
-- get the rate based on film_id
  SELECT
    INTO total_payment SUM (amount)
  FROM
    payment
  WHERE
    customer_id = p_customer_id;

  CASE
    WHEN total_payment > 200 THEN
      service_level = 'Platinum';
    WHEN total_payment > 100 THEN
      service_level = 'Gold';
    ELSE
      service_level = 'Silver';
    END CASE;

    RETURN service_level;
END; $$
LANGUAGE PLPGSQL;


SELECT
  148 AS customer,
  get_customer_service(148)
UNION

SELECT
  178 AS customer,
  get_customer_service(178)
UNION

SELECT
  81 AS customer,
  get_customer_service (81);

