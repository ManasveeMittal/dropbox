/***data step numerical functions*******/
data score;
  input student_id $ grade1 grade2 grade3;
datalines;
1 80 . 90 87
2 .  . 80 90
3 76 78 90 89
4 67 69 80 .
5 77 79 85 87
;
run;

Data score_1;
  Set score;
  avg_score1=mean(grade1, grade2, grade3);

  avg_score2=mean(of grade1-grade3);

  avg_score3=(grade1+grade2+grade3)/3;

  min_score1=min(grade1, grade2, grade3);

  min_score3=min(of grade1-grade3);

  max_score=max(of grade1-grade3);
Run;

Data income;
  Do ID=1 to 1000;
    income= round((16500*rannor(0)+50000),100);
    Output;
  End;
Run;


Proc univariate data=income normal;
  Var income;
  Histogram income /normal;
Run;


Data Development Validation;
  Set income;
  If ranuni(33)>0.65 then output Validation;
  Else output Development;
Run;
