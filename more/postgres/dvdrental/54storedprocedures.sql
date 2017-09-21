CREATE FUNCTION function_name(p1 type, p2 type) RETURNS type AS
BEGIN 
  -- LOGIC
END;
LANGUAGE language_name;

-- function definition must be single quote string (any single quotes have to be escaped)
-- but since 8.0 can use dollar quoting => no need to escape string
CREATE FUNCTION inc(val integer) RETURNS integer AS $$
BEGIN
  RETURN val + 1;
END; $$
LANGUAGE PLPGSQL;

-- to invoke the function
SELECT inc(20); # => 21

SELECT inc(inc(20)); # => 22

-- create function with same name but different params => overloading function
CREATE FUNCTION inc(i integer, val integer) RETURNS integer AS $$
BEGIN
  RETURN i + val;
END; $$
LANGUAGE PLPGSQL;

-- both works
SELECT inc(10, 30); # returns 40
SELECT inc(10) # returns 11