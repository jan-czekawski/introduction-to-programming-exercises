SELECT
 first_name,
 last_name
FROM customer c
WHERE EXISTS (
 SELECT 1
 FROM payment p
 WHERE p.customer_id = c.customer_id
 AND amount > 11)
ORDER BY first_name,
		  last_name;
		  

SELECT
 first_name,
 last_name
FROM customer c
WHERE NOT EXISTS (
 SELECT 1
 FROM payment p
 WHERE p.customer_id = c.customer_id
 AND amount > 11)
ORDER BY first_name,
		  last_name;
		  
-- EXISTS(SELECT NULL) RETURNS TRUE
SELECT
 first_name,
 last_name
FROM customer
WHERE 
EXISTS ( SELECT NULL )
ORDER BY first_name,
		  last_name;

-- WON'T RETURN ANYTHING
SELECT
 first_name,
 last_name
FROM customer
WHERE FALSE
ORDER BY first_name,
      last_name;

-- RETURNS ALL ROWS FROM customer
SELECT
 first_name,
 last_name
FROM customer
WHERE TRUE
ORDER BY first_name,
      last_name;