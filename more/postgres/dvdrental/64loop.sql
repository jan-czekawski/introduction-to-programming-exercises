-- accepts integer and returns nth fibonacci number
CREATE OR REPLACE FUNCTION fibonacci (n INTEGER)
  RETURNS INTEGER AS $$
DECLARE
  counter INTEGER := 0; -- counter is initialized to 0
  i INTEGER := 0;
  j INTEGER := 1;
BEGIN

  IF (n < 1) THEN
  RETURN 0;
  END IF;

  LOOP
  EXIT WHEN counter = n ; -- when counter = n loop exits
  counter := counter + 1;
  SELECT j, i + j INTO i, j ; -- it swaps i and j at the same time without using temporary variable
  END LOOP ;

  RETURN i ;
END ;
$$ LANGUAGE PLPGSQL;


CREATE OR REPLACE FUNCTION fibonacci (n INTEGER)
  RETURNS INTEGER AS $$
DECLARE
  counter INTEGER := 0 ;
  i INTEGER := 0 ;
  J INTEGER := 1 ;
BEGIN

  IF (n < 1) THEN
  RETURN 0 ;
  END IF;

  WHILE counter <= n LOOP -- check the condition and start execution if it's true
  counter := counter + 1 ;
  SELECT j, i + j INTO i, j ;
  END LOOP ;

  RETURN i ;
END ;
$$ LANGUAGE PLPGSQL;


-- loop through 1 to 5 and print message in each iteration
DO $$
BEGIN
  FOR counter IN 1..5 LOOP
  RAISE NOTICE 'Counter: %', counter;
  END LOOP;
END; $$

-- 5 TO 1
DO $$
BEGIN
  FOR counter IN REVERSE 5..1 LOOP
    RAISE NOTICE 'Counter: %', counter;
  END LOOP;
END; $$


DO $$
BEGIN
  FOR counter IN 1..6 BY 2 LOOP -- step by 2 (1, 3, 5)
    RAISE NOTICE 'Counter: %', counter;
  END LOOP;
END; $$

-- this function accepts int which specifies number of rows to query from "film" table in "sample" db
-- for loop statement loops through rows returned from the query and print the film title
CREATE OR REPLACE FUNCTION for_loop_through_query(n INTEGER DEFAULT 10)
RETURNS VOID AS $$
DECLARE
  rec RECORD;
BEGIN
  FOR rec IN SELECT title
    FROM film
    ORDER BY title
    LIMIT n
  LOOP
    RAISE NOTICE '%', rec.title;
  END LOOP;
END;
$$ LANGUAGE PLPGSQL;

