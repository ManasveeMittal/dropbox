/***proc means to summarize Continous variables*****/

DATA class;
    INPUT name $ sex $ age height weight;
Cards;
JOHN       M    12    59   99.5
Marry      F    10    .   73.0
ALFRED     M    12    51   112.5
JAMES      M    12    52   83.0
Jane       F    10    51   .
ALICE      F    10    .   84.0
;
run;

PROC Means data=class;
   Var age height weight;
Run;


PROC Means data=class;
     class sex;
     Var age height weight;
     output out=File_output1 mean= nmiss=age_nmiss height_nmiss;
Run;


PROC Means data=class;
     class sex;
     Var age height weight;
       output out=File_output2 mean= median(age weight)=age_median weight_median;
Run;


PROC Means data=class;
     class sex;
     Var age height weight; output out=File_output3 (drop=_type_ _freq_) n=count std=;
Run;


PROC Means data=class;
     Class sex;
     VAR age height;
       output out=profile1;
run;


PROC Means data=class;
     Class sex;
     VAR age height;
       output out=profile11 mean=age height;
run;



PROC sort data=class;
  By descending age;
run;

PROC Means data=class;
   By descending age;
   Var weight height;
   output out=profile min=weight_min mean(height)=height_mean
   max(weight height)=weight_max height_max nmiss=weight_miss
   n=n;
Run;



DATA work.Salary;
    INPUT ID  $  gender  $ Year Salary  Tax;
    FORMAT Salary Tax dollar10.;
      if _n_=3 then gender='';
DATALINES;
A0123232  M 1998       52000  13090
A0134332  F 1999       57056  13780
A0135567  M 1998       62000  16000
A0255335  M 1998       32000  .
A0253434  F 1999       35000  6000
A0211134  F 1999       38000  8900
A0378890  F 1998    61001        .
A0435074  M 1999       50000  12000
;
RUN;


/**treat missing as a class***/
PROC Means data=work.Salary nway missing;
   class year gender;
   var Salary;
   output out=Salary_sum mean=Salary_avg
               range=Salary_range;
Run;
