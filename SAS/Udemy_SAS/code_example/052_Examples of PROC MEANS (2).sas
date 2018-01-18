/***proc means to summarize Continous variables*****/

/**treat missing as a class***/
PROC Means data=work.Salary nway missing;
   class year gender;
   var Salary;
   output out=Salary_sum mean=Salary_avg
               range=Salary_range;
Run;



PROC format;
  VALUE Riskfm
          300 -< 550 = 'High Risk'
          550 -< 700 = 'Medium Risk'
          700 - HIGH = 'Low Risk'
          OTHER ='Not Scorable';
Run;

Data Credit_score;
  Input customer_id score oeverdue;
Datalines;
1 568 1
2 789 0
3 350 1
4 802 0
5 190 .
6 .   1
7 389 0
8 709 0
9 422 1
10 650 0
11 369 1
12 . 1
;
Run;

PROC Means data=Credit_score nway missing;
   class score;
   format score Riskfm.;
   var oeverdue;
   output out=bad_rate(drop=_type_) mean=oeverdue_rate
                       n=count;
Run;

proc rank data=f.account groups=10 out=account_rk;
  var balance;
  ranks balance_grp;
run;


PROC Means data=account_rk nway missing;
   class balance_grp;
   var balance limit;
   output out=summary(drop=_type_) mean=
                       n=count max=max_balance
                       min=min_balance;
Run;


/*change to your folder here!**/

data Stock;
  infile 'D:\ALL_BACKUP\coursedec\course_1\stock.txt' Missover truncover;
  input price_open $1-6 price_close $7-12 price_high $13-18 price_low $19-24 volume $25-34
        exchange $35-40 symbol $41-46;
            price=price_close+0;
            drop price_close;
run;
data stock;
  set stock;
  rename price=price_close;
run;



PROC Means data=stock;
   class exchange;
   var price_close;
   output out=stock_sum(drop=_type_ _freq_)
              mean=price_avg
              n=count p95=p95 p5=p5
              lclm=price_lclm
              uclm=price_uclm;
Run;
quit;

data stock_sum;
  set stock_sum;
  price_avg=round(price_avg,0.01);
  price_lclm=round(price_lclm,0.01);
  price_uclm=round(price_uclm,0.01);
run;
