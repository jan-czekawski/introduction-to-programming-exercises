-- first create a view
CREATE VIEW usa_cities AS SELECT
  city,
  country_id
FROM
  city
WHERE
 country_id = 103;

-- check data
select * from usa_cities;

-- insert new city to "city" table through "usa_cities" view
INSERT INTO usa_cities (city, country_id)
VALUES ('San Jose', 103);

-- check data in "city" table
SELECT
  city,
    country_id
FROM
  city
WHERE
  country_id = 103
ORDER BY
  last_update DESC;

-- delete entry through "usa_cities"
DELETE
FROM
  usa_cities
WHERE
  city = 'San Jose';


