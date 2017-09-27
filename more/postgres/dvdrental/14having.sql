SELECT
 customer_id,
 SUM(amount)
FROM
 payment
GROUP BY
 customer_id
HAVING
 SUM(amount) > 200;
 
-- can even order filtered result set
SELECT
 customer_id,
 SUM(amount)
FROM
 payment
GROUP BY
 customer_id
HAVING
 SUM(amount) > 200
ORDER BY
 SUM(amount) DESC;


SELECT
 store_id,
 COUNT(customer_id)
FROM
 customer
GROUP BY
 store_id;
 

