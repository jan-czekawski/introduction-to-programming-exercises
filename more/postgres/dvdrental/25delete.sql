SELECT
 *
FROM
 link;


DELETE FROM link
WHERE id = 8;

SELECT * FROM link_tmp;

-- to delete based on condition connected to another table have to use USING
DELETE
FROM
 link USING link_tmp
WHERE
 link.id = link_tmp.id;


-- same result WHERE ... = 
DELETE
FROM
 link
WHERE
 link.id = (SELECT id FROM link_tmp);

DELETE
FROM link;

DELETE FROM link
RETURNING *;