SELECT
 *
FROM
 link;


DELETE FROM link
WHERE id = 8;

SELECT * FROM link_tmp;

DELETE
FROM
 link USING link_tmp
WHERE
 link.id = link_tmp.id;


DELETE
FROM link;

DELETE FROM link
RETURNING *;