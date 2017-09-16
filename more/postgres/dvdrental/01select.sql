SELECT 
  *
FROM
  customer;

SELECT
  first_name,
  last_name,
  email
FROM
  customer;

CREATE TABLE t1(
 id serial NOT NULL PRIMARY KEY,
 bcolor VARCHAR,
 fcolor VARCHAR
);

INSERT INTO t1 (bcolor, fcolor)
VALUES
 ('red', 'red'),
 ('red', 'red'),
 ('red', NULL),
 (NULL, 'red'),
 ('red', 'green'),
 ('red', 'blue'),
 ('green', 'red'),
 ('green', 'blue'),
 ('green','green'),
 ('blue', 'red'),
 ('blue', 'green'),
 ('blue', 'blue');
 
SELECT
 id,
 bcolor,
 fcolor
FROM
 t1;
 
SELECT
 DISTINCT bcolor
FROM
 t1;
 
SELECT
 DISTINCT bcolor,
 fcolor
FROM
 t1
ORDER BY
 bcolor,
 fcolor;
 
 
SELECT
 DISTINCT ON
 (bcolor) bcolor,
 fcolor
FROM
 t1
ORDER BY
 bcolor,
 fcolor;