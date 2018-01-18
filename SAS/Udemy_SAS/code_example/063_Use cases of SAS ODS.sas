
/*****ODS examples*****/

/*****Note: define library L with your own folder that contains data!********/

libname L 'C:\SASCOURSE\data';

data Credit_cards ;
   set L.Credit_cards ;
   if _n_<20;
   keep id age tot_pay inquiry_num credit_limit account_num ;
run;


 ODS PDF file='C:\SASCOURSE\data\credit.pdf'
 author='Mike'
 title='Credit Card'
 subject='investigate credit'
 text='credit risk analysis'
 style=Ocean
 contents=yes;

 proc print data=Credit_cards ;
 Run;

 ODS PDF CLOSE;



 data Credit_cards ;
   set L.Credit_cards ;
   utilization=round(revolve_bal/credit_limit*100,0.1);
   keep id age balance_grp utilization revolve_bal inquiry_num credit_limit account_num ;
 run;


             ODS HTML path='D:\ALL_BACKUP\coursedec\course_1'      /* output files path */
               body='creditCBODY.html'               /* body */
               contents='creditCONTENTS.html'        /* table of contents */
               frame='creditFRAME.html'                  /* main webpage */
               page='creditPAGE.html'                    /* table of pages */
               base='http://www.link/home/'           /* URL prefix (optional) */
             style=HTMLBlue;

             proc means data=Credit_cards ;
                     class balance_grp;
                     var age utilization revolve_bal inquiry_num;
                   run;

             ODS HTML CLOSE;



 ODS rtf file='C:\SASCOURSE\data\coffeeinfo.rtf';


 proc freq data=L.coffee ;
   tables city*education;
 Run;

 ODS rtf CLOSE;


ODS PDF FILE='C:\SASCOURSE\data\cofeeage.pdf' style=Styles.D3d;
PROC means data=L.coffee;
 class Favourite_Coffee;
 Var age;
Run;
ODS PDF close;




PROC TEMPLATE;
   DEFINE STYLE styles.newtep;
   PARENT=styles.D3d;
   STYLE header FROM header/
   BACKGROUND= blue
   FONT_FACE= "arial"
   FONT_WEIGHT= bold;
   STYLE systemtitle FROM systemtitle /
   FONT_STYLE=italic
   FONT_FACE= "arial"
   FONT_WEIGHT= bold;
   STYLE table FROM table /
   BORDERWIDTH=3;
   END;
RUN;


ODS PDF FILE='C:\SASCOURSE\data\dwed.pdf' STYLE=styles.newtep;
PROC freq data=L.coffee;
  tables Dwelling*Education;
Run;
ODS PDF close;



Data employee;
  Input emp_id $ gender $ age salary;
Datalines;
001 M 36 58000
002 F 41 88000
003 M 39 67200
004 M 32 78300
005 F 50 35000
006 F 29 23600
007 M 38 78000
008 M 49 27900
Run;

ODS trace on/listing;
PROC means data=employee;
 Var salary age;
 ODS output summary=summary_mean;
Run;
ODS trace off;


ODS trace on/listing;
PROC univariate data=employee;
 Var salary;
run;
ODS trace off;
