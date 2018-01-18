/*****statistical testing*********/
/*****Note: define library L with your own folder that contains data!********/

libname L 'C:\SASCOURSE\data';

data Coffee;
  set L.Coffee;
run;


/*
Two-Sample t-test
*/
proc ttest data=Coffee;
 class gender;
 var income;
run;


/*
Question:  If someone stated, in terms of this sample,
the proportion of part time customers in the total population is around 20%,
do you agree with this? provide a confidence interval for the testing result.
*/
data Coffee;
 set Coffee;
 part_ind=(Employment='parttime');
run;
proc means data=Coffee ALPHA=0.025 mean LCLM UCLM std ;
 var part_ind;
run;


proc ttest data=Coffee h0=0.2;
  var part_ind;
run;


/*
Question  If according to the sample
are there any difference in income among different education levels?
*/

proc ANOVA data=Coffee;
  class Education;
  model income=Education;
  means Education/DUNCAN ALPHA=0.05;
run;


/*
Question now we know the income in different education groups are different,
is it true for different gender?
*/

proc GLM data=Coffee;
    class Education gender;
    model income=Education | gender ;
    means Education | gender / duncan;
run;


/*
Question  is there any interaction between education level
and coffee drinking level? How to explain it?
*/

data Coffee_1;
  set Coffee;
  if Cups_Per_Week>2 then coffee_more=1;
  else coffee_more=0;
  if left(trim(education))='high school' then education_lev='L';
  else education_lev='H';
run;

proc glm data=Coffee_1;
 class coffee_more education_lev;
 model income=coffee_more | education_lev;
run;

/*Interaction plot*/

proc means data=Coffee_1 noprint nway;
   class coffee_more education_lev;
   var income;
   output out=mean_table mean=;
run;
quit;

symbol1 v=dot c=red i=j;
symbol2 v=star c=blue i=j;
proc gplot data=mean_table;
  plot  income*coffee_more=education_lev;
  title 'interaction plot';
run;


/*
Question  Do you think that smokers have different favourite coffee
types with non-smokers?
*/
proc freq data=Coffee;
  tables Favourite_Coffee*smoker/chisq;
run;


/*
Question:  is there any difference of coffee Cups_Per_Week beween male and female?
*/
Proc univariate data=coffee normal plot;
  var Cups_Per_Week;
  histogram Cups_Per_Week;
Run;

/*
Question  is there any difference of coffee Cups_Per_Week beween male and female?
*/

proc npar1way data = coffee;
  class gender;
  var Cups_Per_Week;
run;


/*
Non-Parametric Pair Test
Question On average, is there any difference between coffee and  tea?
*/

data coffee2;
  set coffee;
  diff = Cups_Per_Week - cup_tea;
run;

proc univariate data = coffee2;
  var diff;
run;
