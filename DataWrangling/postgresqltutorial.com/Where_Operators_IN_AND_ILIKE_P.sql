#////////////////////////////////////////////////
                        
                        IN 
SYNTAX_STRUCTURE:

truncated:
value IN (value1,value2,...)
value IN (SELECT value FROM tbl_name);

Note:
Ante-form
"NOT IN" can be used to exclude value 

SELECT
customer_id,
rental_id,
return_date
FROM
rental
WHERE
customer_id IN (1, 2,5)
ORDER BY
return_date DESC;

#Advance where or simple inner join
SELECT
 first_name,
 last_name
FROM
 customer
WHERE
 customer_id IN (

SELECT
 customer_id
FROM
Rental
WHERE
CAST (return_date AS DATE) = '2005-05-27'
                 );
#////////////////////////////////////////////////

                   Between

SYNTAX_STRUCTURE:

>value BETWEEN low AND high;   
         equivalent to 
 value >= low and value <= high

 Ante-form
 >value NOT BETWEEN low AND high;
         equivalent to
  value < low OR value > high


SELECT
 customer_id,
 payment_id,
 amount
FROM
 payment
WHERE
 amount BETWEEN 7
AND 9;

SELECT
 customer_id,
 payment_id,
 amount
FROM
 payment
WHERE
 amount NOT BETWEEN 5
AND 9
OFFSET 40;
#////////////////////////////////////////////////

             LIKE and ILIKE
SYNTAX_STRUCTURE

 PostgreSQL provides two wildcard characters:

    Percent ( %)  for matching any sequence of characters.
    Underscore ( _)  for matching any single character.

SELECT
'foo' LIKE 'foo', -- true
'foo' LIKE 'f%', -- true
'foo' LIKE '_o_', -- true
'bar' LIKE 'b_'; -- false

SELECT First_name, last_name
FROM customer
WHERE first_name LIKE '%er%'

SELECT first_name, last_name
FROM customer
WHERE first_name ILIKE 'BAR%';

Note:
PostgreSQL also provides some operators that act like the LIKE, NOT LIKE, ILIKE and NOT ILIKE operator as shown below:

    ~~ is equivalent to LIKE
    ~~* is equivalent to ILIKE
    !~~ is equivalent to NOT LIKE
    !~~* is equivalent to NOT ILIKE
 #////////////////////////////////////////////////
