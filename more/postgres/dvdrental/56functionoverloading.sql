-- to get days of rental duration
CREATE OR REPLACE FUNCTION get_rental_duration(p_customer_id INTEGER)
  RETURNS INTEGER AS $$

DECLARE
  rental_duration INTEGER;
BEGIN
-- get the rate based on customer_id
SELECT INTO rental_duration SUM(EXTRACT(DAY FROM return_date - rental_date))
FROM rental
WHERE customer_id = p_customer_id;

RETURN rental_duration;
END; $$
LANGUAGE PLPGSQL;

-- id = 232
SELECT get_rental_duration(232);

-- can add another param to look for duration only in specific date
CREATE OR REPLACE FUNCTION get_rental_duration(p_customer_id INTEGER, p_from_date DATE)
RETURNS INTEGER AS $$

DECLARE
  rental_duration integer;
BEGIN
-- get rental duration based on customer_id and rental date
SELECT INTO rental_duration
  SUM(EXTRACT(DAY FROM return_date - rental_date))
FROM rental
WHERE customer_id = p_customer_id AND rental_date >= p_from_date;

RETURN rental_duration;
END; $$
LANGUAGE plpgsql;

-- get_rental_duration(integer) is overloaded by get_rental_duration(integer, date)
-- can use both functions
SELECT get_rental_duration(232);
SELECT get_rental_duration(232, '2005-07-01');


-- add default value for 1 of the params
CREATE OR REPLACE FUNCTION get_rental_duration(
  p_customer_id INTEGER,
  p_from_date DATE DEFAULT '2005-01-01') -- default
RETURNS INTEGER AS $$

DECLARE
  rental_duration integer;
BEGIN
-- get rental duration based on customer_id and rental date
SELECT INTO rental_duration
  SUM(EXTRACT(DAY FROM return_date - rental_date))
FROM rental
WHERE customer_id = p_customer_id AND rental_date >= p_from_date;

RETURN rental_duration;
END; $$
LANGUAGE plpgsql;

-- error => function not unique
SELECT get_rental_duration(232);

-- only second function can be called (with 2 params), first cannot
-- have to drop 2nd function with 2 params:
DROP FUNCTION get_rental_duration(INTEGER, DATE);
