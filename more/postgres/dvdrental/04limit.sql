SELECT
 film_id,
 title,
 release_year
FROM
 film
ORDER BY
 film_id
LIMIT 5;

SELECT
 film_id,
 title,
 release_year
FROM
 film
ORDER BY
 film_id
LIMIT 4 OFFSET 3;
