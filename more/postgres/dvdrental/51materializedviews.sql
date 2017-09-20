CREATE MATERIALIZED VIEW view_name
AS
query
WITH [NO] DATA; -- to (not) load data when view is created => 
-- with no data => view is unreadable, untill data is inserted => can't view it untill

REFRESH MATERIALIZED VIEW view_name -- => load data into mat view (it locks table during update)
REFRESH MATERIALIZED VIEW CONCURRENTLY view_name -- => (this doesn't lock it)


CREATE MATERIALIZED VIEW rental_by_category
AS
  SELECT
    c.name AS category,
    sum(p.amount) AS total_sales
  FROM (((((payment p
    JOIN rental r ON ((p.rental_id = r.rental_id)))
    JOIN inventory i ON ((r.inventory_id = i.inventory_id)))
    JOIN film f ON ((i.film_id = f.film_id)))
    JOIN film_category fc ON ((f.film_id = fc.film_id)))
    JOIN category c ON ((fc.category_id = c.category_id)))
  GROUP BY c.name
  ORDER BY  sum(p.amount) DESC
WITH NO DATA;

-- it was created with no data => so unreadable for now => error
SELECT * FROM rental_by_category;

-- have to refresh it
REFRESH MATERIALIZED VIEW rental_by_category;

-- now it's good
SELECT * FROM rental_by_category;

-- have to add UNIQUE index to use CONCURR
CREATE UNIQUE INDEX rental_category ON rental_by_category (category);

-- now can do it
REFRESH MATERIALIZED VIEW CONCURRENTLY rental_by_category;