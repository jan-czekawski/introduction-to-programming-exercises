-- declare and initialize various vars
DO $$
DECLARE
  counter integer := 1;
  first_name varchar(50) := 'John';
  last_name varchar(50) := 'Doe';
  payment numeric(11, 2) := 20.5;
BEGIN
  RAISE NOTICE '% % % has been paid % USD', counter, first_name, last_name, payment;
END $$;


-- PG evaluates default values and assigns it to vars whenever the block is entered:
DO $$
DECLARE
  created_at time := now();
BEGIN
  RAISE NOTICE '%', created_at; -- value changes each time
END $$

-- var city_name refers to col "name" in "city" table
city_name city.name%TYPE := 'San Francisco';