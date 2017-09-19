-- error, doesn't exist
DROP TABLE author;

-- displays notice
DROP TABLE IF EXISTS author;


CREATE TABLE author (
  author_id INT NOT NULL PRIMARY KEY,
  firstname VARCHAR(50),
  lastname VARCHAR(50)
);

CREATE TABLE page (
  page_id serial PRIMARY KEY,
  title VARCHAR (255) NOT NULL,
  CONTENT TEXT,
  author_id INT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES author (author_id)
);


-- error because "page" depends on "author"
DROP TABLE IF EXISTS author;

-- drops table and issues notice
DROP TABLE IF EXISTS author CASCADE;