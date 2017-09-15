CREATE TABLE new_table_1 (label CHAR(1) PRIMARY KEY);
CREATE TABLE new_table_2 (score INT PRIMARY KEY);

INSERT INTO new_table_1 (label)
VALUES
 ('A'),
 ('B');

INSERT INTO new_table_2 (score)
VALUES
 (1),
 (2),
 (3);
 
SELECT
 *
FROM
 new_table_1
CROSS JOIN new_table_2;

-- same result
SELECT
 *
FROM
 new_table_1, new_table_2;
 
-- same result
SELECT
 *
FROM
 new_table_1
INNER JOIN new_table_2 ON TRUE;