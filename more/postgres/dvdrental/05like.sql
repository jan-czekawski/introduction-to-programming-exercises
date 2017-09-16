SELECT
 first_name,
 last_name
FROM
 customer
WHERE
 first_name LIKE 'Jen%';
 
SELECT
 'foo' LIKE 'foo', -- returns true
 'foo' LIKE 'f%',
 'foo' LIKE '_o_',
 'bar' LIKE 'b_'; -- returns false
 
SELECT 
 first_name,
 last_name
FROM
 customer
WHERE
 first_name LIKE '%er%';
 
SELECT 
 first_name,
 last_name
FROM
 customer
WHERE
 first_name LIKE '_her%';
 
SELECT 
 first_name,
 last_name
FROM
 customer
WHERE
 first_name NOT LIKE 'Jen%';

SELECT 
 first_name,
 last_name
FROM
 customer
WHERE
 first_name ILIKE 'BAR%';
 
SELECT 
 first_name,
 last_name
FROM
 customer
WHERE
 first_name ~~* 'BAR%';
 
