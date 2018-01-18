/***proc FREQ to summarize categorical variables*****/
/*****Note: define library L with your own folder that contains data!********/

libname L 'C:\SASCOURSE\data';


PROC format;
  VALUE Riskfm
          300 -< 550 = 'High Risk'
          550 -< 700 = 'Medium Risk'
          700 - HIGH = 'Low Risk'
          OTHER ='Not Scorable';
Run;

PROC FREQ data=L.Credit_score order=formatted;
  Tables score;
  format score Riskfm.;
Run;

PROC FREQ data=L.Credit_score order=freq;
  Tables score;
  format score Riskfm.;
Run;

PROC FREQ data=L.Credit_score;
  Tables score;
  format score Riskfm.;
Run;
