SYNATX_STRUCTURE

SELECT column_1, column_2 … column_n
FROM table_name
WHERE conditions;

Operator	Description
=	        Equal
>	        Greater than
<	        Less than
>=	        Greater than or equal
<=	        Less than or equal
<> or !=	Not equal
AND	        Logical operator AND
OR	        Logical operator OR

#Q1

create table s1 as
SELECT customer_id,
amount,
payment_date
FROM payment
WHERE amount <= 1 OR amount >= 8
Limit 10
;


select * from s1;
 drop table s1;
