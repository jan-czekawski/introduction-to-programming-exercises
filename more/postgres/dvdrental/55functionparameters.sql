CREATE OR REPLACE FUNCTION get_sum(
  a NUMERIC,
    b NUMERIC)
RETURNS NUMERIC AS $$
BEGIN
  RETURN a + b;
END; $$

LANGUAGE PLPGSQL;


SELECT get_sum(10, 30); # => return 40

-- define OUT param
CREATE OR REPLACE FUNCTION hi_lo(
  a NUMERIC,
  b NUMERIC,
  c NUMERIC,
  OUT hi NUMERIC,
  OUT lo NUMERIC)
AS $$
BEGIN
  hi := GREATEST(a, b, c);
  lo := LEAST(a, b, c);
END; $$
LANGUAGE PLPGSQL;
-- this function accepts 5 params: 3 IN, 2 OUT
-- out params => no need for return keyword

-- result is custom record
select hi_lo(10, 20, 30);

-- to separate into cols
select * from hi_lo(10, 20, 30);


CREATE OR REPLACE FUNCTION square(
  INOUT a NUMERIC)
AS $$
BEGIN
  a := a * a;
END; $$
LANGUAGE PLPGSQL;

-- variable num of args
CREATE OR REPLACE FUNCTION sum_avg(
  VARIADIC list NUMERIC[],
  OUT total NUMERIC,
  OUT average NUMERIC)
AS $$
BEGIN
  SELECT INTO total SUM(list[i])
  FROM generate_subscripts(list, 1) g(i);

  SELECT INTO average AVG(list[i])
  FROM generate_subscripts(list, 1) g(i);

END; $$
LANGUAGE PLPGSQL;

SELECT * FROM sum_avg(10, 20, 30);