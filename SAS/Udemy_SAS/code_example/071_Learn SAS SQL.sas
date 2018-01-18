/**proc sql -- examples****/

Data Age;
  Input id customer $ age;
Datalines;
1 A  30
2 B  22
3 C  57
4 D 39
5 E 37
;
Run;
Data student;
  Input class $ English;
Cards;
A 56
A 78
C 77
B 89
B 90
B 96
C 56
A 87
;
Run;


Proc SQL;
  Select * from Age where age>20;
Quit;



Proc SQL;
   Update Age set age=79 where id=1;
Quit;




Proc SQL;
  Select class, AVG(English) from student
  group by class;
Quit;



Proc SQL;
  Select DISTINCT class from student;
Quit;



Proc SQL;
   Insert into  Age values(7, 'F', 30);
Quit;




Proc SQL;
  Select count(*) from Age where age>30;
Run;



Proc SQL;
 Select class, count(*) as student_num
 from student group by class order by class;
Run;



Proc SQL Noprint;
   Create table age_bigger as
   select * from Age where age>20 order by
   id desc;
Run;



Proc SQL;
  Create table student1 as
  select class, count(*)  as student_num
  from student group by class having
  student_num >2;
Run;




Data sales;
  Input type $ sales;
Cards;
Toy  34902
Tool  56932
Cloth 45679
Food  56578
Toy   37518
Toy   33292
Food  55718
Cloth 41779
Cloth 41557
Tool  78101
;
Run;

Data number;
  Input ID n1 $ n2 $ @@;
Cards;
1 1 1 2 1 2 3 1 1 4 2 2 5 1 3
6 3 1 7 2 1 8 2 2 9 1 1
;
Run;



PROC SQL;
  Select * from number where  substr(n1,1,1)='1';
Quit;


PROC SQL;
  Create table new_age as
  Select id, customer, age as old_age, (age+1) as new_age
  from Age where age>30;
Run;

PROC SQL;
  Select type, sales
  format=dollar10.1 label='sales amount by type',
  sales*0.13 as tax format=dollar10.2 label='sales tax 12%'
  from sales;
Quit;


Data credit_data;
  input id $ delinquency_days;
Datalines;
012 63
098 100
067 10
078 0
034 120
069 0
006 26
088 0
090 0
019 .
011 61
015 0
;
Run;


PROC SQL NOPRINT;
  Create table credit_risk as
  select id, delinquency_days,
  CASE
   WHEN 0 LE  delinquency_days LE 29 THEN 'LOW'
   WHEN 30 LE delinquency_days LE 59 THEN 'MED'
   WHEN 60 LE delinquency_days LE 180 THEN 'HIG'
   ELSE 'N/A'
  END AS risk_level
FROM credit_data;
Quit;
