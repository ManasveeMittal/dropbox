select first_name, last_name, email
from customer;

  select first_name, last_name, email
from customer
LIMIT 5;

SELECT
 *
FROM
 table
LIMIT n OFFSET m;
	
SELECT
 film_id,
 title,
 release_year
FROM
 film
ORDER BY
 film_id
LIMIT 5;

SELECT
 film_id,
 title,
 release_year
FROM
 film
ORDER BY
 film_id
LIMIT 4 OFFSET 3;

SELECT
 film_id,
 title,
 rental_rate
FROM
 film
ORDER BY
 rental_rate DESC
LIMIT 10;

SELECT distinct
 title,
 release_year
FROM
 film
ORDER BY
 title
LIMIT 10 OFFSET 3;