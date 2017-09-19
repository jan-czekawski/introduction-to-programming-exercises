-- 2 indexes => one for primary key, one for unique constraint
CREATE TABLE IF NOT EXISTS contacts(
  id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL UNIQUE
);


INSERT INTO contacts(first_name, last_name, email)
VALUES
  ('John', 'Doe', 'john.doe@postgresqltutorial.com'),
    ('David', 'William', 'david.william@postgresqltutorial.com');


-- copies table structure and data
CREATE TABLE contact_backup
AS TABLE contacts;

\d contact_backup => no indexes

-- to add pk and unique constraint
ALTER TABLE contact_backup ADD PRIMARY KEY (id);
ALTER TABLE contact_backup ADD UNIQUE (email);

\d contact_backup => indexes in place

