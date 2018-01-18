---------------SYNTAX_STRUCTURE------------------
------------------INNER--------------------------
SELECT
A.pka, A.c1,
B.pkb, B.c2
FROM A
INNER JOIN B ON A .pka = B.fka;

/*
The primary key column ( pka) and foreign key column ( fka) are typically
indexed; therefore, PostgreSQL only has to check for the match in the 
indexes, which is very fast.
*/

SELECT A.customer_id, email, amount, payment_date
FROM customer A
INNER JOIN payment B
ON B.customer_id = A.customer_id
ORDER BY payment_date
LIMIT 10
OFFSET 20;

CREATE table inner1 AS
SELECT A.customer_id, email, amount, payment_date
FROM customer A
INNER JOIN payment B
ON B.customer_id = A.customer_id
WHERE A.customer_id < 5
ORDER BY payment_date
;



--TO DECRIBE INNER JOIN RESULT--
select column_name, data_type, character_maximum_length
from INFORMATION_SCHEMA.COLUMNS where table_name = 'inner1';
                  OR
SELECT * FROM information_schema.columns WHERE table_name = 'inner1';
Select count(*) from inner1;

--------------------------------------

SELECT A.customer_id, A.first_name cust_name, A.email, 
concat_ws('',B.last_name ,B.first_name) AS staff_name,
C.amount , C.payment_date
FROM customer A
INNER JOIN payment C ON  C.customer_id = A.customer_id
INNER JOIN staff B ON B.staff_id = C.staff_id
LIMIT 10;


-----------------------LEFT JOIN-------------------------

Diff between Left Join and 1nner Join

The LEFT JOIN clause returns all records in the left table (A) that are 
combined with records in the right table ( B) even though there is no 
corresponding records in the right table ( B). In case, there is no matching 
row in the B table, the values of the columns in the B table are substituted 
by the NULL values.

The LEFT JOIN is also referred as LEFT OUTER JOIN

SELECT A.film_id, A.title, B.inventory_id
FROM film A
LEFT JOIN inventory B 
ON A.film_id = b.film_id
WHERE B.film_id IS NULL; 

SELECT Count (DISTINCTA.film_id) from   --can be used as Count *
 film A
LEFT JOIN inventory B 
ON A.film_id = b.film_id
WHERE B.film_id IS NULL;

------------------FULL OUTER JOIN-----------------------

--SYNTAX_STRUCTURE

SELECT * FROM A
FULL [OUTER] JOIN B on A.id = B.id;
The OUTER keyword is optional

CREATE TABLE
IF NOT EXISTS departments (
department_id serial PRIMARY KEY,
department_name VARCHAR (255) NOT NULL
);

CREATE TABLE
IF NOT EXISTS employees (
employee_id   serial PRIMARY KEY,
employee_name VARCHAR (255),
department_id INTEGER
);

INSERT INTO departments (department_name)
VALUES
('Sales'),
('Marketing'),
('HR'),
('IT'),
('Production');

INSERT INTO employees (
employee_name,
department_id
)
VALUES
('Bette Nicholson', 1),
('Christian Gable', 1),
('Joe Swank', 2),
('Fred Costner', 3),
('Sandra Kilmer', 4),
('Julia Mcqueen', NULL);

SELECT count(*)
FROM departments;

SELECT count(*)
FROM employees;

-- Finding department(s) with  no employee
--and  employee(s) who doesn't belong to any department
SELECT employee_name, department_name
FROM employees A
FULL OUTER JOIN departments B 
ON A.department_id = B.department_id
WHERE employee_name IS NULL
OR department_name IS NULL;

Select employee_name 
from  employees
CROSS JOIN departments;

-----------------CROSS JOIN----------------------
--Produced cartesian product of two relations
Select Count(*)
from  employees
CROSS JOIN departments;


-----------------NATURAL JOIN--------------------

CREATE TABLE categories (
category_id serial PRIMARY KEY,
category_name VARCHAR (255) NOT NULL
);

CREATE TABLE products(
	product_id serial PRIMARY KEY,
	product_name VARCHAR (255) NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY(category_id) REFERENCES  category(category_id)
);

	

INSERT INTO categories (category_name)
VALUES
('Smart Phone'),
('Laptop'),
('Tablet');

INSERT INTO products (product_name, category_id)
VALUES
('iPhone', 1),
('Samsung Galaxy', 1),
('HP Elite', 2),
('Lenovo Thinkpad', 2),
('iPad', 3),
('Kindle Fire', 3);

SELECT ALL 
FROM products
NATURAL JOIN categories;


----------------------------END__________________________________