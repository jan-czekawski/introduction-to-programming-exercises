-- create updatable view
CREATE VIEW usa_city AS SELECT
  city_id,
  city,
  country_id
FROM
  city
WHERE
  country_id = 103
ORDER BY
  city;


-- insert to "city" through "usa_city"
INSERT INTO usa_city (city, country_id)
VALUES
  ('Birmingham', 102);

-- new inserted row is not visible in the view
-- it may be security issue => cause eg we only granted access to updating US cities, not UK

-- to prevent that
CREATE
OR REPLACE VIEW usa_city AS SELECT
  city_id,
  city,
  country_id
FROM
  city
WHERE
  country_id = 103
ORDER BY
  city WITH CHECK OPTION;


-- error => violates check option
INSERT INTO usa_city (city, country_id)
VALUES
  ('Birmingham', 102);

-- error => same => it causes row that is being updated not visible through the city view
UPDATE usa_city
SET country_id = 102
WHERE
  city_id = 135;

-- create view with all cities starting with "A" => no with check option clause
CREATE VIEW city_a AS SELECT
  city_id,
    city,
    country_id
FROM
  city
WHERE
  city LIKE 'A%';

-- create another view (based on city_a) names start with "A" and location US
CREATE OR REPLACE VIEW city_a_usa AS SELECT
  city_id,
  city,
  country_id
FROM
  city_a
WHERE
  country_id = 103
WITH CASCADED CHECK OPTION; -- with cascaded check option

-- error => violates check option (from "city") => even though it doesn't have with check option clasue
INSERT INTO city_a_usa (city, country_id)
VALUES ('Houston', 103);
-- when used with cascaded check option for "city_a_usa", PG check view defining condition of the "city_a_usa"
-- view and also all the underlying views ("city_a" including)


-- to check view-defining condition of the view that you insert/update => WITH LOCAL CHECK OPTION
CREATE OR REPLACE VIEW city_a_usa AS SELECT
  city_id,
  city,
  country_id
FROM
  city_a
WHERE
  country_id = 103
WITH LOCAL CHECK OPTION;

-- this time it worked => new row satisfies view-defining condition of the city_a_use view
-- PG didn't check view-defining condition of the base (underlying) views
INSERT INTO city_a_usa (city, country_id)
VALUES
 ('Houston', 103);