CREATE TABLE vendors (
 id serial PRIMARY KEY,
 name varchar NOT NULL
);

ALTER TABLE vendors RENAME TO suppliers;

CREATE TABLE supplier_groups (
 ID serial PRIMARY KEY,
 name VARCHAR NOT NULL
);


ALTER TABLE suppliers
ADD COLUMN group_id INT NOT NULL;

-- add column to suppliers, that column will be foreign key that links to ID column of supplier_groups table
ALTER TABLE suppliers
ADD FOREIGN KEY (group_id) REFERENCES supplier_groups (ID);

-- to save time querying complete supplier data, create a view against suppliers and supplier_groups
-- but ERROR around "group" *** UPDATE *** error found !!!
CREATE VIEW supplier_data AS SELECT
  s.id,
  s.name,
  g.name AS supplier_group      -- change =>  g.name group
FROM
  suppliers s
INNER JOIN supplier_groups g ON g.id = s.group_id;

-- if you were to go to psql and \c dvdrental (to change dbs) and \d suppliers (to see table supliers)
-- you'd see that suppliers has fk constraint which references to the supplier_group table


ALTER TABLE supplier_groups RENAME TO groups;
-- check \d suppliers again => fk constraint now references "groups" table (it's updated)  


-- can check \d+ supplier_data => to show the supplier_data view
-- "supplier_groups" in the SELECT statement of the view was also updated to "groups"