CREATE TABLE IF NOT EXISTS person (
  id serial PRIMARY KEY,
    first_name VARCHAR (50),
    last_name VARCHAR (50),
    email VARCHAR (50) UNIQUE
);

-- unique constraint can be also written like that:
CREATE TABLE IF NOT EXISTS person (
  id serial PRIMARY KEY,
    first_name VARCHAR (50),
    last_name VARCHAR (50),
    email VARCHAR (50),
    UNIQUE(email)
);


INSERT INTO person(first_name, last_name, email)
VALUES ('john', 'doe', 'j.doe@postgrestutorial.com');

-- we try to insert info with duplicate email => error
INSERT INTO person(first_name, last_name, email)
VALUES ('james', 'dean', 'j.doe@postgrestutorial.com');

-- multiple cols => combo will be unique, but single values won't have to be
CREATE TABLE tabl1 (
  c1 data_type,
  c2 data_type,
  c3 data_type,
  UNIQUE (c2, c3)
);

-- adding unique constraint using existing unique index
-- first we have table
CREATE TABLE IF NOT EXISTS equipment(
  id serial PRIMARY KEY,
    name VARCHAR (50) NOT NULL,
    equip_id VARCHAR (16) NOT NULL
);

-- second, we create unique index
CREATE UNIQUE INDEX CONCURRENTLY equipment_equip_id
ON equipment (equip_id);

-- third, we add unique constraint to "equipment" table using "equipment_equip_id" index
ALTER TABLE equipment
ADD CONSTRAINT unique_equip_id
UNIQUE USING INDEX equipment_equip_id;

-- that query needs exclusie lock on the table => if you have many pending transactions it will wait
-- till they're finished

-- to check how many pending transactions are in place => "idle in transaction" => pending to complete
SELECT
  datid,
    datname,
    usename,
    state
FROM
  pg_stat_activity;



