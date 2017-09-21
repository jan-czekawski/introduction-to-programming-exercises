-- rename triggers
ALTER TRIGGER last_name_changes ON employees1
RENAME TO log_last_name_changes;


-- disable the trigger
ALTER TABLE employees1
DISABLE TRIGGER log_last_name_changes;

-- disable all
ALTER TABLE employees1
DISABLE TRIGGER ALL;

-- remove the trigger
DROP TRIGGER IF EXISTS log_last_name_changes ON employees1;