--------------------GROUP_BY---------------------

-----WITHOUT AGGREGATION

-----SYNTAX_STRUCTURE
SELECT column_1, aggregate_function(column_2)
FROM tbl_name
GROUP BY column_1;
'The GROUP BY clause must appear right after the FROM or WHERE clause. 
Followed by the GROUP BY clause is one column or a list of comma-separated
 columns.'

 SELECT   customer_id  --599 records
 FROM     payment
 GROUP BY customer_id;

 SELECT   customer_id --599 records
 FROM     payment     ;

 SELECT   COUNT(customer_id) --599 records
 FROM     payment     
 GROUP BY customer_id;

 SELECT   DISTINCT customer_id  --419 records
 FROM     payment     
 GROUP BY customer_id;

 SELECT   COUNT(customer_id), customer_id --599 records
 FROM     payment     
 GROUP BY customer_id;

 SELECT   DISTINCT COUNT(customer_id) --33 count
 FROM     payment     
 GROUP BY customer_id;

 --------AGGREGATION: SUM
 SELECT SUM(amount) --599 records
 FROM payment
 GROUP BY customer_id;

 SELECT SUM(amount), customer_id  ----599 records
 FROM payment
 GROUP BY customer_id;

SELECT 
 SUM(AMOUNT) as sum_amt,
 MIN(AMOUNT) as min_amt,
 AVG(AMOUNT) as avg_amt,
 MAX(AMOUNT) as MAX_amt,
 Count(AMOUNT) as cnt_txn
FROM payment
GROUP BY customer_id, product_id
LIMIT 20
OFFSET 20;

SELECT 
 SUM(AMOUNT) as sum_amt,
 MIN(AMOUNT) as min_amt,
 AVG(AMOUNT) as avg_amt,
 MAX(AMOUNT) as MAX_amt,
 Count(AMOUNT) as cnt_txn
FROM payment
GROUP BY customer_id, staff_id
LIMIT 20
OFFSET 20;

'To filter groups, you use the HAVING clause instead of WHERE clause.'