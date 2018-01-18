/***proc FREQ to summarize categorical variables*****/
/*****Note: define library L with your own folder that contains data!********/

libname L 'C:\SASCOURSE\data';


data sale;
 set L.info_sale;
run;


/**one way analysis**/
PROC FREQ data=sale;
  where product in ('Laser Engraving','Electronics');
  Tables product*province/out=cross0 missing;
Run;


PROC FREQ data=sale;
  where product in ('Pet Supplies','Body Jewelry');
  Tables province /out=cross1 nocum nopercent;
Run;



/**two way analysis**/
PROC FREQ data=sale;
  where product in ('Asian Products','Body Jewelry','');
  Tables province*product/out=cross2 nocol nofreq nopercent;
Run;


PROC FREQ data=sale;
  where product in ('Asian Products','Western Products','');
  Tables province*product/out=cross3 list missing;
Run;


PROC FREQ data=sale;
  where product in ('Electronics','Heath Feder','')
         and province NE 'OT';
  Tables province*product/out=cross4 norow nopercent missing;
Run;


PROC FREQ data=sale;
  where product in ('Pet Supplies','Body Jewelry','Electronics')
   and sales_name in ('Merle Scoby', 'Jule Biles','Karol Paul','Crista Surface');
  Tables province*product*sales_name/out=cross6 nocol norow totpct;
Run;
