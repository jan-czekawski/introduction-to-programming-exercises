SELECT
 customer.customer_id,
 first_name,
 last_name,
 email,
 amount,
 payment_date
FROM
 customer
INNER JOIN payment ON payment.customer_id = customer.customer_id;

SELECT
 customer.customer_id,
 first_name,
 last_name,
 email,
 amount,
 payment_date
FROM
 customer
INNER JOIN payment ON payment.customer_id = customer.customer_id
ORDER BY
 customer.customer_id;
 
SELECT
 customer.customer_id,
 customer.first_name,
 customer.last_name,
 customer.email,
 staff.first_name,
 staff.last_name,
 amount,
 payment_date
FROM
 customer
INNER JOIN payment ON payment.customer_id = customer.customer_id
INNER JOIN staff ON payment.staff_id = staff.staff_id;  