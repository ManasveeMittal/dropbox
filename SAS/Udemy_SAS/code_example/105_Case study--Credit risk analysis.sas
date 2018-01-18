



PROC IMPORT OUT= WORK.creditfile
DATAFILE= "D:\ALL_BACKUP\coursedec\course_1\course_wec\cs-training.csv"                                                                                        DBMS=CSV REPLACE;
GETNAMES=YES;
 DATAROW=2;
RUN;

libname L 'C:\SASCOURSE\data';

DATA creditfile_fix;
  SET L.creditfile;
  MonthIncome_n=MonthIncome+0;
  NumDependents_n=NumDependents+0;
  MonthIncome_miss=(MonthIncome_n=.);
  NumDependents_miss=(NumDependents_n=.);
  DROP MonthIncome NumDependents;
RUN;


PROC MEANS DATA=creditfile_fix mean max min n nmiss std;
      VAR _NUMERIC_;
      ODS OUTPUT Summary=temp;
RUN;


/***first method -- data step***/
DATA WORK.creditfile_fix;
 SET WORK.creditfile_fix;
 if MonthIncome_n=. then MonthIncome_n = 6481 ;
 if NumDependents_n=. then NumDependents_n = 0.75 ;
RUN;


proc rank data= WORK.creditfile_fix groups=10 out=WORK.creditfile_rk;
  var age;
  ranks age_grp;
run;


proc sql;
  create table sum_age_risk as select age_grp, sum(BAD) as BAD_NUM,
  100*avg(BAD) as BAD_ratio from WORK.creditfile_rk
  group by age_grp order by age_grp;
quit;


proc sql;
  create table sum_Num60_89PD as select Num60_89PD, sum(BAD) as BAD_num,
  100*avg(BAD) as BAD_ratio from WORK.creditfile_fix
  group by Num60_89PD;
quit;


/****macro 1****/
%macro createreport1(factor, out, grp_num);

  proc rank data= WORK.creditfile_fix groups=&grp_num out=temp_tb;
    var &factor.;
    ranks grp;
  run;


 proc sql;
   create table sum_&factor._risk as select grp, sum(BAD) as BAD_NUM
   ,100*avg(BAD) as BAD_ratio from temp_tb group by grp order by grp;
 quit;

%mend;

/****macro 2****/

%macro createreport2(factor, out);

 proc sql;
   create table sum_&factor._risk as select &factor, sum(BAD) as BAD_NUM
   ,100*avg(BAD) as BAD_ratio from WORK.creditfile_fix
   group by &factor order by &factor;
 quit;

%mend;


%createreport1(age, sum_age, 10);
%createreport1(DebtRatio, sum_DebtRatio, 10);
%createreport1(Utilization, sum_Utilization, 10);
%createreport1(NumCreditLine, sum_NumCreditLine, 6);
%createreport1(MonthIncome_n, sum_income, 10);

%createreport2(NumDependents_n, sum_NumDependents);
%createreport2(Nummortgage, sum_Nummortgage);
%createreport2(Numbe30_59PD, sum_Numbe30_59PD);
%createreport2(Num60_89PD, sum_Num60_89PD);
%createreport2(Number90PD, sum_Number90PD);
