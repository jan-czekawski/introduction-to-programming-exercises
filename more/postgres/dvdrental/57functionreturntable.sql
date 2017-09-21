-- returns all films which title matches pattern
CREATE OR REPLACE FUNCTION get_film(p_pattern VARCHAR)
RETURNS TABLE(
  film_title VARCHAR,
  film_release_year INT
)
AS $$
BEGIN
  RETURN QUERY SELECT
    title,
    cast (release_year as integer) -- cols must match select => date cas to be casted to integer
  FROM
    film
  WHERE
    title LIKE p_pattern;
END; $$

LANGUAGE 'plpgsql';

-- to call it
SELECT * FROM get_film('Al%');

-- to just get 1 col
SELECT get_film('Al%');

-- in practice you often process each individual row before appending it to the function result
CREATE OR REPLACE FUNCTION get_film(p_pattern VARCHAR, p_year INT)
RETURNS TABLE (
  film_title VARCHAR,
  film_release_year INT
)
AS $$
DECLARE
  var_r record;
BEGIN
  FOR var_r IN(SELECT title, release_year
                      FROM film WHERE title LIKE p_pattern AND
                      release_year = p_year)
  LOOP
    film_title := upper(var_r.title);
    film_release_year := var_r.release_year;
    RETURN NEXT;
  END LOOP;
END; $$

LANGUAGE plpgsql;
-- function has similar name => but 2 params (function overload)
-- we use for loop to process each individual row before returning it
-- inside each iteration we use UPPER to make the title of the film upper case
-- RETURN NEXT adds row to the result set of the function; execution continues and result set is building up in each
-- iteration of the loop

SELECT * FROM get_film('Al%', 2006);