/***special data step functions********/

data date_example;
 X1='02JUN2011'd;   X2='19JUN2013'd;
 Y1=INTCK('month', X1,X2);
 Y2=YRDIF(X1,X2, 'ACT/ACT');
run;


Data employees;
 Input id $ emp_year emp_month birth: mmddyy10.;
 age=intck('year',birth,today());
 age_1=round((today()-birth)/365.25,0.1);
 age_2=round(yrdif(birth, today(),'ACTUAL'),0.1);
 workdate=mdy(emp_month,1,emp_year);
 yearbirth=year(birth);
 format birth workdate date9.;
Datalines;
001 2001 9 02/21/1968
002 2005 11 12/21/1979
003 1997 12 08/21/1970
004 2001 2 11/21/1978
;
Run;


Data people;
 Input birth mmddyy10.;
 Format birth date9.;
cards;
02/05/1990
02/15/1993
;
Run;


Data people_new;
 Set people;
 birthstring=put(birth,date9.); /* char */
 birthstring1=put(birth,9.);    /* char */
 birthstring2=put(birth,$9.);  /* char */
 birthnum=input(birthstring,date9.);
/* integer which express a date */

Run;



Data report;
 input year earning;
datalines;
2000 330
2001 343
2002 356
2003 392
2004 405
;
Run;

Data report;
 set report;
 lag1_earning=lag(earning);
 lag2_earning=lag2(earning);
 yoy=dif(earning);
Run;
