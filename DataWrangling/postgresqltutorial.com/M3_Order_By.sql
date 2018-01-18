SYNTAX_STRUCTURE

SELECT
column_1,
column_2
FROM
tbl_name
ORDER BY
column_1 ASC,
column_2 DESC;

Notes:
 >Specify the column that you want to sort in the ORDER BY clause. If you sort the result set by multiple columns, use a comma to separate between two columns.
 >Use ASC to sort the result set in ascending order and DESCto sort the result set in descending order. If you leave it blank, the ORDER BYclause will use ASCby default.

select count(Distinct first_name) from customer;
select count(*) from customer;

SELECT
 first_name,
 last_name
FROM
  customer
ORDER BY
   first_name ASC,
   last_name DESC
   OFFSET 400
   LIMIT 30;
select count(Distinct first_name) from customer;
select count(*) from customer;

