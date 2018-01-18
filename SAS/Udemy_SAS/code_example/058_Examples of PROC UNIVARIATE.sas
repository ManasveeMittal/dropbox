/*****examples of univariate analysis*********/

 Data people;
  Do id=1 to 236;
    weight=round(158+rannor(id)*15,1);
    Height=100+round(weight*(0.45+rannor(id)*0.06),1);
    Output;
  End;
 Run;

 PROC univariate data=people freq normal plot vardef=df mu0=150;
   Var weight height;
   histogram weight/ midpoints = 100 to 220 by 5  normal;
   OUTPUT OUT=STATS MEAN=weight height MEDIAN=weight_median;
 Run;
