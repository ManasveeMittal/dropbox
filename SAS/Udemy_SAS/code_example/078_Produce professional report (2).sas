
/*****Note: define library L with your own folder that contains data!********/

libname L 'C:\SASCOURSE\data';

data Market_survey;
   set L.Market_survey_wm;
run;

PROC report data=Market_survey NOWD split='|' headskip headline;
  Column  age  Education Income Cups_Per_Week cup_tea Smoker;
  define age / width=8;
  define income / width=15;
  define Cups_Per_Week /width=12 'Cups | Coffee per Week' ;
  define cup_tea / width=12 'Cups Tea | per Week' ;
  define Smoker / width=12 'Smoker?' ;
  define Education / width=12 ;
  where (age>55) and (Cups_Per_Week > 1 );

  title2 'Survey Data' ;
Run;


PROC report data=Market_survey NOWD split='|' headskip headline;
  Column  gender Smoker Income Cups_Per_Week cup_tea;
  define gender / width=12 group;
  define Smoker /width=12  group;
  define Income /width=12 'AVG Income' mean;
  define Cups_Per_Week /width=25 'AVG Cups | Coffee/ Week' mean;
  define cup_tea /width=20 'AVG Cups | Tea/ Week' mean;
  title2 'Survey Data' ;
Run ;
