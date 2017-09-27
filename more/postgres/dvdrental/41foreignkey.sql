CREATE TABLE so_headers (
  id serial PRIMARY KEY,
    customer_id int8,
    ship_to VARCHAR(255)
);

-- create "so_items_pkey" constraint, btree (item_id, so_id)
CREATE TABLE so_items (
  item_id int4 NOT NULL,
    so_id int4,
    product_id int4,
    qty int4,
    net_price numeric,
    PRIMARY KEY (item_id, so_id)
);

-- if assume that so_items contains data of sales orders that exist,
-- can define fk constraint in "so_items" which references "so_headers"
CREATE TABLE so_items (
  item_id int4 NOT NULL,
  so_id int4 REFERENCES so_headers(id),
  product_id int4
  qty int4,
  net_price numeric,
  PRIMARY KEY (item_id, so_id)
);

-- another way, same result
-- in both cases "so_items_so_id_fkey" constraint is created (implicit name so default)
CREATE TABLE so_items (
  item_id int4 NOT NULL,
    so_id int4,
    product_id int4,
    qty int4,
    net_price numeric,
    PRIMARY KEY (item_id, so_id),
    FOREIGN KEY (so_id) REFERENCES so_headers (ID)
);
-- each item (from so_items) must belong to specific (1) order, each sales order (from so_headers)
-- can have 1 or more items => one-to-many relationship
-- can't insert into so_items without referencing valid so_id



-- untill all referenced rows from child table are deleted, cannot delete row from parent table
-- (so_headers.id) 
CREATE TABLE so_items (
  item_id int4 NOT NULL,
    so_id int4 REFERENCES so_headers(id) ON DELETE RESTRICT,
    product_id int4,
    qty int4,
    net_price numeric,
    PRIMARY KEY (item_id, so_id)
);

-- all referenced rows in child table (so_items.so_id) will be deleted when rows 
-- are deleted from parent (so_headers.id)
CREATE TABLE so_items (
  item_id int4 NOT NULL,
    so_id int4 REFERENCES so_headers(id) ON DELETE CASCADE,
    product_id int4,
    qty int4,
    net_price numeric,
    PRIMARY KEY (item_id, so_id)
);
-- NO ACTION => default => error will be displayed in case of deleting row from parent table

-- define group of columns as fk
CREATE TABLE child_table (
  c1 integer PRIMARY KEY,
  c2 integer,
  c3 integer,
  FOREIGN KEY (c2, c3) REFERENCES parent_table (p1, p2)
);


-- add fk constraint to existing table
ALTER TABLE child_table
ADD CONSTRAINT constraint_name FOREIGN KEY (c1) REFERENCES parent_table (p1);


-- to add fk constraint DELETE CASCADE to existing table
ALTER TABLE child_table
DROP CONSTRAINT constraint_fkey;


ALTER TABLE child_table
ADD CONSTRAINT constraint_fk
FOREIGN KEY (c1)
REFERENCES parent_table(p1)
ON DELETE CASCADE;