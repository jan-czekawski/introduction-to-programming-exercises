-- number of books must be positive => CHECK
CREATE TABLE IF NOT EXISTS books1 (
  book_id SERIAL PRIMARY KEY,
    title VARCHAR (255) NOT NULL,
    pages SMALLINT NOT NULL CHECK (pages > 0)
);

-- INT(EGER)
CREATE TABLE IF NOT EXISTS cities (
  city_id serial PRIMARY KEY,
    city_name VARCHAR (255) NOT NULL,
    population INT NOT NULL CHECK (population >= 0)
);


