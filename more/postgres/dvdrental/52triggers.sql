-- trigger function is similar to ordinary function => but doesn't tak args and returns val type trigger:
CREATE FUNCTION trigger_function() RETURN trigger AS

CREATE TABLE employees1 (
  id serial PRIMARY KEY,
  first_name VARCHAR(40) NOT NULL,
  last_name VARCHAR(40) NOT NULL
);


CREATE TABLE employee_audits (
  id serial PRIMARY KEY,
  employee_id int4 NOT NULL,
  last_name varchar(40) NOT NULL,
  changed_on timestamp(6) NOT NULL
);

-- create trigger function
-- it will check if last name of employee changes => it will insert old last name into employee_audits
-- (including employee id, last name, time of change)
CREATE OR REPLACE FUNCTION log_last_name_changes()
  RETURNS trigger AS
$BODY$
BEGIN
  IF NEW.last_name <> OLD.last_name THEN
    INSERT INTO employee_audits(employee_id, last_name, changed_on)
    VALUES(OLD.id, OLD.last_name, now());
    END IF;
    
    RETURN NEW;
END;
$BODY$

LANGUAGE plpgsql VOLATILE -- had to specify the language
COST 100;


-- second we bind the trigger function to employees1 table
CREATE TRIGGER last_name_changes
  BEFORE UPDATE
  ON employees1
  FOR EACH ROW
  EXECUTE PROCEDURE log_last_name_changes();

-- now we insert data for testing
INSERT INTO employees1 (first_name, last_name)
VALUES ('John', 'Doe');

INSERT INTO employees1 (first_name, last_name)
VALUES ('Lily', 'Bush');

-- check employees1 table
SELECT * FROM employees1;

-- audit is empty for now 
SELECT * FROM employee_audits;

-- change last name in 1 row (employee got married)
UPDATE employees1
SET last_name = 'Brown'
WHERE ID = 2;

-- name was updated
SELECT * FROM employees1;

-- audit shows last name change
select * from employee_audits;