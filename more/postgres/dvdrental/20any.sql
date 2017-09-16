-- maximum length of film grouped by category
SELECT
 MAX(length)
FROM
 film
INNER JOIN 
 film_category
USING
 (film_id)
GROUP BY
 category_id;
 
-- finds films whose lengths are greater or equal to max length of any film
-- in the categor => but there's error, cause subquery used as expression returns more than 1 row
SELECT title
FROM film
WHERE length >= (SELECT
 MAX(length)
FROM
 film
INNER JOIN 
 film_category
USING
 (film_id)
GROUP BY
 category_id);
 
-- get the films whose category is either Action or Drama
SELECT
 title,
 category_id
FROM
 film
INNER JOIN film_category
USING (film_id)
WHERE
 category_id = ANY(
  SELECT
   category_id
  FROM
   category
  WHERE
   NAME = 'Action'
   OR NAME = 'Drama');
   
-- same result with IN instead of =ANY
SELECT
 title,
 category_id
FROM
 film
INNER JOIN film_category
USING (film_id)
WHERE
 category_id IN(
  SELECT
   category_id
  FROM
   category
  WHERE
   NAME = 'Action'
   OR NAME = 'Drama');
   
-- to get films that are out of stuck (not in the inventory)
SELECT
 title
FROM
 film
WHERE
 film_id <> ANY(
  SELECT
   film_id
  FROM
   inventory
 )
ORDER BY title;