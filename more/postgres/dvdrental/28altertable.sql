CREATE TABLE link (
 link_id serial PRIMARY KEY,
 title VARCHAR (512) NOT NULL,
 url VARCHAR (1024) NOT NULL UNIQUE
);


ALTER TABLE link ADD COLUMN active boolean;


ALTER TABLE link DROP COLUMN active;


ALTER TABLE link RENAME COLUMN title TO link_title;


ALTER TABLE link ADD COLUMN target varchar(10);


ALTER TABLE link ALTER COLUMN target
SET DEFAULT '_blank';

-- target would get '_blank'
INSERT INTO link (link_title, url)
VALUES 
 ('PostgreSQL Tutorial', 'http://www.postgrestutorial.com');

-- target would only accept those values
ALTER TABLE link ADD CHECK (target IN ('_self', '_blank', '_parent', '_top'));

-- will raise error
INSERT INTO link (link_title, url, target)
VALUES ('Postgres', 'http://postgres.com', 'whatever');


ALTER TABLE link RENAME TO url;