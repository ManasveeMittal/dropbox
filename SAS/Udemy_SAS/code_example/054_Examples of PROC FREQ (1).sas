/***proc FREQ to summarize categorical variables*****/

/*****Note: define library L with your own folder that contains data!********/


libname L 'C:\SASCOURSE\data';

PROC FREQ data=L.Education_income;
  Tables education;
Run;

PROC FREQ data=L.Education_income;
  Tables education*agegrp;
Run;

PROC FREQ data=L.Education_income;
  Tables education*high_income;
Run;


/**one way analysis**/
PROC FREQ data=L.info_sale;
  where product in ('Laser Engraving','Electronics');
  Tables province/out=cross0;
Run;


PROC FREQ data=L.info_sale;
  where product in ('Pet Supplies','Body Jewelry');
  Tables province/out=cross1 nocum nopercent;
Run;

/**two way analysis**/
PROC FREQ data=L.info_sale;
  where product in ('Asian Products','Body Jewelry','');
  Tables province*product/out=cross2 nocol nofreq nopercent;
Run;

PROC FREQ data=L.info_sale;
  where product in ('Asian Products','Western Products','');
  Tables province*product/out=cross3 list missing;
Run;

PROC FREQ data=L.info_sale;
  where product in ('Electronics','Heath Feder','')
         and province NE 'OT';
  Tables province*product/out=cross4 norow nopercent missing;
Run;


PROC FREQ data=L.info_sale;
  where product in ('Electronics','','Asian Products')
         and (province NE 'OT');
  Tables province*product/out=cross5 nocol norow missing;
Run;


PROC FREQ data=L.info_sale;
  where product in ('Pet Supplies','Body Jewelry','Electronics')
   and sales_name in ('Merle Scoby', 'Jule Biles','Karol Paul','Crista Surface');
  Tables province*product*sales_name/out=cross6 nocol norow totpct;
Run;




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
