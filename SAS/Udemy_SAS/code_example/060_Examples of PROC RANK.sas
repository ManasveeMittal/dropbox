/****rank data, bucket analysis*****/

Data people;
  Do id=1 to 236;
    weight=round(158+rannor(11)*20,1);
    Height=100+round(weight*(0.45+rannor(22)*0.06),1);
    Output;
  End;
Run;


Proc rank data=people groups=10 out= people_rank;
  Var weight;
  Ranks weight_level;
Run;


libname L 'C:\SASCOURSE\data';

proc rank data=L.account groups=10 out=account_rk;
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
