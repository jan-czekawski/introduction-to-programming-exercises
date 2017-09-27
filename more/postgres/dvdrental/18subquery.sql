-- select avg rental rate from film
SELECT
 AVG(rental_rate)
FROM
 film;
 
-- select films with average rate higher than average (from first query)
SELECT
 film_id,
 title,
 rental_rate
FROM
 film
WHERE
 rental_rate > 2.98;
 
-- same using subquery
SELECT
 film_id,
 title,
 rental_rate
FROM
 film
WHERE
 rental_rate > (
 SELECT
 AVG (rental_rate)
 FROM
 film
 );
 

-- to get films with return date between dates
SELECT
 inventory.film_id
FROM
 rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE
 return_date BETWEEN '2005-05-29'
AND '2005-05-30';

-- using subquery and displaying film_id and title
SELECT
 film_id,
 title
FROM
 film
WHERE
 film_id IN (
 SELECT
 inventory.film_id
 FROM
 rental
 INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
 WHERE
 return_date BETWEEN '2005-05-29'
 AND '2005-05-30'
 );
 

SELECT
 first_name,
 last_name
FROM
 customer
WHERE
 EXISTS(
 SELECT
 1
 FROM
 payment
 WHERE
 payment.customer_id = customer.customer_id
 );