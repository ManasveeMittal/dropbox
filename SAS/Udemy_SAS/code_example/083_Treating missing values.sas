
/****how to treat missing values using proc stdize******/
/*****Note: define library L with your own folder that contains data!********/

libname L 'C:\SASCOURSE\data';


/***Here I create some missing values in order to do the following practice***/

data income_info;
  set L.income_info;
  r=ranuni(99);
  if r>0.23 then income=.;
run;
data income_info;
  set income_info;
  r=ranuni(99);
  if r<0.037 then age=.;
  drop r;
run;

Data employ;
 Input obs_period salary partime creditscore emp_time;
 id=_n_;
Cards;
201005 6012 0 758 5
201006 .    0 558 5
201003 1033 . 675 .
201003 1017 0 .   3
201108 3454 0 964 3
201109 2454 0 916 3
201005 2797 1 .   6
201006 519  1 867 .
201007 3019 0 467 2
;
Run;






/****replace missing values with median****/

proc stdize data=employ out=employ_rep reponly method=median;
 var _numeric_;
run;



/****first we observe mean, median.. for age and income*****/

proc means data=income_info mean median min max nmiss std ;
  var income age;
run;

/****createincome missing flag*****/
data income_info_fix;
  set income_info;
  income_miss_flag=(income=.);
run;

/****replace missing values of age and income with median****/

proc stdize data=income_info_fix out=income_info_fix reponly method=median;
 var _numeric_;
run;
