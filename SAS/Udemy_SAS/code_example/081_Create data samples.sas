/*****create samples*******/
/*****Note: define library L with your own folder that contains data!********/

libname L 'C:\SASCOURSE\data';


data customer;
  set L.customer;
run;


data people;
  set L.people;
run;


/******examples of sampling********/

data customer_sample;
  set customer;
  if ranuni(_n_)>0.72; /*probability of more than 0.72 is 28%*/
Run;


proc surveyselect data=customer out=customer_sample1 method=srs sampsize=200;
run;


proc freq data=people;
  tables job_type;
run;

proc freq data=people;
  tables gender;
run;


proc surveyselect data=people out=people_sample2 method=srs sampsize=220;
run;


proc sort data=people;
 by gender;
run;

proc surveyselect data=people out=people_sample3 method=srs sampsize=(220,150);
  STRATA gender;
run;


proc freq data=people_sample2;
  tables gender;
run;

proc freq data=people_sample3;
  tables gender;
run;
