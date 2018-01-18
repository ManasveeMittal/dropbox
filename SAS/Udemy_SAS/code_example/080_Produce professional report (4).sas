
/*****Note: define library L with your own folder that contains data!********/

libname L 'C:\SASCOURSE\data';

data Market_survey;
   set L.Market_survey_wm;
run;


/****adding summary break and rbreak*******/

PROC report data=Market_survey NOWD split='|' headskip headline;
  Column  gender Smoker Income Cups_Per_Week cup_tea;
  define gender / width=12 group;
  define Smoker /width=12  group;
  define Income /width=12 'AVG Income' mean format=dollar10.;
  define Cups_Per_Week /width=25 'AVG Cups Coffee/ Week' mean;
  define cup_tea /width=20 'AVG Cups Tea/ Week' mean;
  break after gender /summarize skip ol;
  rbreak after / summarize skip dul;
  title2 'Survey Data' ;
Run ;



PROC report data=Market_survey NOWD split='|' headskip headline;
  Column  gender Smoker Income ;
  define gender / width=12 group;
  define Smoker /width=18  across;
  define Income /width=12 'AVG Income' mean;
  define Cups_Per_Week /width=25 'AVG Cups Coffee/ Week' mean;
  break after gender / skip ol;
  rbreak after / summarize skip dul;
  title2 'Survey Data' ;
Run ;



PROC report data=Market_survey NOWD split='|' headskip headline;
  Column  age Smoker, Income Cups_Per_Week;
  define age / width=12 group;
  define Smoker /width=12  across;
  define Income /width=12 'AVG Income' mean;
  define Cups_Per_Week /width=25 'AVG Cups Coffee/ Week' mean;
  break after age / skip ol;
  rbreak after / summarize skip dul;
  title2 'Survey Data' ;
Run ;



PROC report data=Market_survey NOWD split='|' headskip headline;
  Column  age Smoker, (Income Cups_Per_Week);
  define age / width=12 group;
  define Smoker /width=12  across;
  define Income /width=12 'AVG Income' mean;
  define Cups_Per_Week /width=25 'AVG Cups Coffee/ Week' mean;
  break after age / skip ol;
  rbreak after / summarize skip dul;
  title2 'Survey Data' ;
Run ;


PROC report data=Market_survey NOWD split='|' headskip headline;
  Column  age (Smoker gender), Income ;
  define age / width=12 group;
  define Smoker /width=12  across;
  define gender /width=12  across;
  define Income /width=12 'AVG Income' mean;
  define Cups_Per_Week /width=25 'AVG Cups Coffee/ Week' mean;
  break after age / skip ol;
  rbreak after / summarize skip dul;
  title2 'Survey Data' ;
Run ;



PROC report data=Market_survey  split='|' headskip headline;
  Column  age Smoker, Income Cups_Per_Week;
  define age / width=12 group;
  define Smoker /width=12  across;
  define Income /width=12 'AVG Income' mean;
  define Cups_Per_Week /width=25 'AVG Cups Coffee/ Week' mean;
  break after age / skip ol;
  rbreak after / summarize skip dul;
  title2 'Survey Data' ;
Run ;


/****add compute block********/

PROC report data=Market_survey NOWD split='|' headskip headline;
  Column   Smoker Income spend_food Cups_Per_Week cup_tea coffeetea food_income N;
  define Smoker /width=12  group;
  define Income /width=12 'AVG Income' format=dollar7.1 mean;
  define spend_food /width=12 'AVG Food Spend' format=dollar7.1 mean;
  define Cups_Per_Week /width=25 'AVG Cups Coffee/ Week' format=6.1 mean;
  define cup_tea /width=20 'AVG Cups Tea/ Week' format=6.1 mean;
  define coffeetea /computed width=20 'AVG coffee snd Tea' format=6.1;
  define food_income /computed width=20 format=6.1 'Food over Income';
  compute coffeetea;
     coffeetea=Cups_Per_Week.mean+cup_tea.mean;
  endcomp;
  compute food_income;
     if income.mean>0 then
     food_income=round(100*spend_food.mean/income.mean,0.1);
  endcomp;
  break after  Smoker /summarize skip ol;
  rbreak after / summarize skip dul;
  compute after;
       Smoker='TOT';
  endcomp;
  where Employment='fulltime';
  title2 'Survey Data' ;
Run ;




/*********Enhancing report*********************************/

/**add line @ in compute block****/

PROC report data=Market_survey NOWD split='|' headskip headline;
  Column gender Income spend_food Cups_Per_Week cup_tea  N;
  define gender /width=12  group;
  define Income /width=12 'AVG Income' format=dollar7.1 mean;
  define spend_food /width=12 'AVG Food Spend' format=dollar7.1 mean;
  define Cups_Per_Week /width=25 'AVG Cups Coffee/ Week' format=6.1 mean;
  define cup_tea /width=20 'AVG Cups Tea/ Week' format=6.1 mean;
  define N / width=20 'Count' ;

  break after  gender / page;
  compute before _page_ / left;
     line 'gender(M/F):  ' gender $;
     line  @1 ' ';
  endcomp;
  compute after _page_ /left;
     line 'Based on Survey' ;
  endcomp;

  rbreak after / summarize skip dul;
  title2 'Survey Data' ;
Run ;


/*****use format in proc report**********/

proc format;
 value agegrp
 10 -<50 ='Younge'
 50 -HIGH ='Old';
run;


PROC report data=Market_survey NOWD missing split='|' headskip headline;
  Column  age smoke_ind Income income=income_new Cups_Per_Week Person_ID;
  define age /width=12  group format=agegrp.;
  define Income / width=12 'AVG Income'  mean  format=dollar12.;
  define Income_new / 'Missing Income' nmiss  width=12;
  define smoke_ind /width=12 'Smoker #' sum;
  define Person_ID /width=12 '# of People' n;
  define Cups_Per_Week /analysis width=25 'MAX Cups Coffee/ Week' max;
  title2 'Survey Data' ;
Run ;


/********Calculation in compute block***************/

proc report data=grocery headline headskip;
    column sector department sales Profit N ;
    define sector / group format=$sctrfmt.;
    define department   / group format=$deptfmt.;
    define sales  / analysis sum
                    format=dollar9.2;
    define profit / computed format=dollar9.2;

    compute before;
    totprof = 0;
    endcomp;

    compute profit;
    if sector ne ' ' or department ne ' ' then do;
       if department='np1' or department='np2'
          then profit=0.4*sales.sum;
       else profit=0.25*sales.sum;
       totprof = totprof + profit;
       end;
    else
       profit = totprof;
    endcomp;

    rbreak after / dol dul summarize;
    compute after;
       sector='TOTALS:';
    endcomp;

    where sector contains 'n';
    title 'Report for Northeast and Northwest Sectors';
  run;


/***send report to HTML file*********/

ODS HTML FILE='C:\out.htm';
PROC report data=employee NOWD missing headskip ;
  Column  emp_id gender age salary tax;
  Define emp_id /display style(column header)=[background=yellow];
  Define gender /group center width=12;
  Define age /center order width=20 format=12.;
  Define salary /center display style(column)=[background=green] width=12 'Income' format=10.;
  Compute before age / style=[foreground=red];
   agegroup = trim(put(floor(age/10)*10, words.))||" Group";
   Line agew $20.;
  Endcomp;
  Define tax /center computed width=12 'Income Tax';
  Compute tax;
    If salary<40000 then tax = salary*0.12;
      Else tax=(salary-40000)*0.3+(40000*0.12);
  Endcomp;
  Title2 'Employee List' ;
Run ;
ODS HTML CLOSE;


/***send report to PDF file*********/

ODS PDF FILE='D:\out.pdf';
PROC report data=Market_survey  split='|' headskip headline;
  Column  age Smoker, Income Cups_Per_Week;
  define age / width=12 group style(column header)=[background=LIGHT GREY];
  define Smoker /width=12  across;
  define Income /width=12 'AVG Income' mean style(column)=[background=#AAFFAA];
  define Cups_Per_Week /width=25 'AVG Cups Coffee/ Week' mean;
  break after age / skip ol;
  rbreak after / summarize skip dul;
  title2 'Survey Data' ;
Run ;
ODS PDF CLOSE;



ODS PDF FILE='D:\report.pdf';
PROC report data=Market_survey NOWD split='|' headskip headline;
  Column   Smoker Income spend_food Cups_Per_Week cup_tea  N;
  define Smoker /width=12 style(column header)=[background=LIGHT GREY] group;
  define Income /width=12 'AVG Income' format=dollar7.1 mean style(column)=[background=#AAFFAA];
  define spend_food /width=12 'AVG Food' format=dollar7.1 mean;
  define Cups_Per_Week /width=25 'AVG Coffee' format=6.1 mean;
  define cup_tea /width=20 'AVG Tea' format=6.1 mean;
  define N / width=20 'Count' style=[foreground=red];

  break after smoker  / page ;
  compute before _page_ / left;
     line 'smoker(Y/N): ' Smoker $ ;
     line  @1 ' ';
  endcomp;
  compute after _page_ /left;
     line 'Based on Survey' ;
  endcomp;

  rbreak after / summarize skip dul ;
  where Employment='fulltime';
  title2 'Survey Data' ;
Run ;
ODS PDF CLOSE;
