CREATE TABLE publishers (
  publisher_id serial PRIMARY KEY,
  name VARCHAR NOT NULL
);

CREATE TABLE categories (
  category_id serial PRIMARY KEY,
  name VARCHAR NOT NULL
);

CREATE TABLE books (
  book_id serial PRIMARY KEY,
  title VARCHAR NOT NULL,
  isbn VARCHAR NOT NULL,
  published_data DATE NOT NULL,
  description VARCHAR,
  category_id INT NOT NULL,
  publisher_id INT NOT NULL,
  FOREIGN KEY (publisher_id) REFERENCES publishers (publisher_id),
  FOREIGN KEY (category_id) REFERENCES categories (category_id)
);

CREATE VIEW book_info AS SELECT
  book_id,
    title,
    isbn,
    published_data,
    name
FROM
  books b
INNER JOIN publishers P
ON P.publisher_id = b.publisher_id
ORDER BY title;


ALTER TABLE books DROP COLUMN category_id;

-- \d books; => show books table