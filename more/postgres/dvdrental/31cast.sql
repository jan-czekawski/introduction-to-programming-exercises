SELECT
 CAST ('100' AS INTEGER);

-- not possible, will cause error
SELECT
 CAST ('10C' AS INTEGER);


SELECT
 CAST ('2015-01-01' AS DATE);


SELECT
 CAST ('01-OCT-2015' AS DATE);


SELECT
 CAST ('10.2' AS DOUBLE); -- error

SELECT
 CAST ('10.2' AS DOUBLE PRECISION);


-- another syntax
SELECT
 '100'::INTEGER;

SELECT
 '01-OCT-2015'::DATE;

SELECT
 '10.2'::DOUBLE PRECISION; 


CREATE TABLE ratings (
 ID serial PRIMARY KEY,
 rate VARCHAR (1)
);

INSERT INTO ratings (rate)
VALUES
 ('A'),
 ('B'),
 ('C');

INSERT INTO ratings (rate)
VALUES
 (1),
 (2),
 (3);

-- have to convert all values in the rate column into integers (A, B, C will be displayed as 0)
SELECT
 id,
CASE
WHEN rate~E'^\\d+$'
    THEN CAST (rate AS INTEGER)
ELSE
    0
END AS rate
FROM
 ratings;