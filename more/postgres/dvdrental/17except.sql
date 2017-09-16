-- returns films in the film table
SELECT
 film_id,
 title
FROM
 film
ORDER BY
 title;
 
-- returns films that are in the inventory
SELECT
 DISTINCT inventory.film_id,
 title
FROM
 inventory
INNER JOIN film ON film.film_id = inventory.film_id
ORDER BY title;

-- to get films that are not in the inventory
SELECT
 film_id,
 title
FROM
 film
EXCEPT
 SELECT
 DISTINCT inventory.film_id, -- DISTINCT doesn't change the final result here
 title
 FROM
 inventory
 INNER JOIN film ON film.film_id = inventory.film_id
ORDER BY title;