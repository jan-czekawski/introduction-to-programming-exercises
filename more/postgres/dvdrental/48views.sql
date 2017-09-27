CREATE VIEW  view_name AS query;

-- we have customer, address, city, country
-- NO NEED FOR ALL THOSE PARENTHESIS !!! => IT WORKS WITHOUT IT
SELECT 
  cu.customer_id AS id,
  (((cu.first_name)::text || ' '::text) || (cu.last_name)::text) AS name,
  a.address,
  a.postal_code AS "zip code",
  a.phone,
  city.city,
  country.country,
    CASE
    WHEN cu.activebool THEN 'active'::text
    ELSE ''::text
    END AS notes,
  cu.store_id AS sid
FROM
  (((customer cu
    JOIN address a ON ((cu.address_id = a.address_id)))
    JOIN city ON ((a.city_id = city.city_id)))
    JOIN country ON ((city.country_id = country.country_id)));


-- can create view
CREATE VIEW customer_master AS
SELECT 
  cu.customer_id AS id,
  (((cu.first_name)::text || ' '::text) || (cu.last_name)::text) AS name,
  a.address,
  a.postal_code AS "zip code",
  a.phone,
  city.city,
  country.country,
    CASE
    WHEN cu.activebool THEN 'active'::text
    ELSE ''::text
    END AS notes,
  cu.store_id AS sid
FROM
  (((customer cu
    JOIN address a ON ((cu.address_id = a.address_id)))
    JOIN city ON ((a.city_id = city.city_id)))
    JOIN country ON ((city.country_id = country.country_id)));

SELECT * FROM customer_master;

-- to change view
CREATE OR REPLACE VIEW customer_master AS
SELECT 
  cu.customer_id AS id,
  (((cu.first_name)::text || ' '::text) || (cu.last_name)::text) AS name,
  a.address,
  a.postal_code AS "zip code",
  a.phone,
  city.city,
  country.country,
    CASE
    WHEN cu.activebool THEN 'active'::text
    ELSE ''::text
    END AS notes,
  cu.store_id AS sid,
  cu.email -- just add email column at the end
FROM
  (((customer cu
    JOIN address a ON ((cu.address_id = a.address_id)))
    JOIN city ON ((a.city_id = city.city_id)))
    JOIN country ON ((city.country_id = country.country_id)));

-- to rename it
ALTER VIEW customer_master RENAME TO customer_info;

-- to drop it
DROP VIEW IF EXISTS customer_info;
