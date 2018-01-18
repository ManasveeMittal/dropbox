/****SAS codes for ranking correlation****/
/*****Note: define library L with your own folder that contains data!********/

libname L 'C:\SASCOURSE\data';

 /****we will check the correlation between 240 ind variables and dep variable target*****/

 data Test_corr;
  set L.Test_corr;
 run;


 proc contents data=Test_corr out=v (keep=name type);
 run;


 data v;
   set v;
   if (type=2) or (name in ('ID','target')) then delete;
 run;

 proc sql noprint;
   select name into :m_varlist separated by ' ' from v;
 quit;

  %put &m_varlist.;

 proc corr data=L.Test_corr outp=p_corr;
   var target;
   with &m_varlist.;
 run;

 data p_corr;
    set p_corr;
    abscorr_p=abs(target);
    if _name_ NE '';
    rename _name_=varname;
    keep _name_ abscorr_p;
 run;

 proc sort data=p_corr out=result_corr;
    by descending abscorr_p;
 run;



 /**now use macro function to realize correlation checking***/

 %macro checkcorr(D, dep, out);
  proc contents data=&D. out=v (keep=name type);
  run;

  data v;
   set v;
   if (type=2) or (name in ('ID','target')) then delete;
  run;

  proc sql noprint;
   select name into :m_varlist separated by ' ' from v;
  quit;

  proc corr data=&D. outp=p_corr;
   var &dep;
   with &m_varlist.;
  run;

  data p_corr;
    set p_corr;
    abscorr_p=abs(&dep.);
    if _name_ NE '';
    rename _name_=varname;
    keep _name_ abscorr_p;
  run;

  proc sort data=p_corr out=&out.;
    by descending abscorr_p;
  run;
%mend;

%let D=Test_corr;
%let out=result_corr;
%let dep=target;

%checkcorr(&D, &dep, &out);
