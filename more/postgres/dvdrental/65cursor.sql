-- declare cursors
DECLARE
  cur_films CURSOR FOR SELECT * FROM film; -- encapsulates all rows in "film" table
  cur_films2 CURSOR (year integer) FOR SELECT * FROM film WHERE release_year = year; 
  -- encapsulates film with particular release year in the film table

OPEN my_cursor FOR SELECT * FROM city WHERE counter = p_country;

-- dynamic query that sorts rows based on the sort_field and open cursor that executes dynamic query
query := 'SELECT * FROM city ORDER BY $1';
OPEN cur_city FOR EXECUTE query USING sort_field; 

-- open those cursors
OPEN cur_films;
OPEN cur_films2(year := 2005);

-- fetching cursors
FETCH cur_films INTO row_film;
FETCH LAST FROM row_film INTO title, release_year;

-- moving the cursors
MOVE cur_films2;
MOVE LAST FROM cur_films;
MOVE RELATIVE -1 FROM cur_films;
MOVE FORWARD 3 FROM cur_films;

-- updating row
UPDATE film SET release_year = p_year
WHERE CURRENT OF cur_films;


-- function accepts argument that represents the release_year of film. Inside the function,
-- we query all films release years equals to the released year passed to the function;
-- we use the cursor to loop through the rows and concatenate title and release year of film that
-- has title containing "ful" word
CREATE OR REPLACE FUNCTION get_film_titles(p_year INTEGER)
  RETURNS text AS $$
DECLARE
  titles TEXT DEFAULT '';
  rec_film RECORD;
  cur_films CURSOR(p_year INTEGER)
  FOR SELECT * -- have to select sth (was nothing previously) for cursor to work
  FROM film
  WHERE release_year = p_year;
BEGIN
-- OPEN CURSOR
  OPEN cur_films(p_year);

  LOOP
  -- FETCH ROW INTO film
    FETCH cur_films INTO rec_film;
  -- EXIT WHEN NO MORE ROW TO FETCH
    EXIT WHEN NOT FOUND;
  
  -- BUILD THE OUTPUT
    IF rec_film.title LIKE '%ful%' THEN
      titles := titles || ',' || rec_film.title || ':' || rec_film.release_year;
    END IF;
  END LOOP;

  -- CLOSE THE CURSOR
  CLOSE cur_films;

  RETURN titles;
END; $$

LANGUAGE plpgsql;



SELECT get_film_titles(2006);