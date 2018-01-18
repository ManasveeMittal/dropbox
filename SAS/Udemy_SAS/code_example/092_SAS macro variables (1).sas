 /*******macro variables******/
 %let Title="income statement";
 %let Title1=income statement;

 %put &Title;
 %put "&Title1";
 %put '&Title1';


 %let Title=income statement;
 data income;
   Input id net expense;
 Datalines;
 1 60000 25000
 2 55000 10000
 3 48902 19081
 ;
 Run;


  /******Compare**********/
 PROC PRINT DATA = income;
   Var id net expense;
   TITLE "Table of &Title";
 RUN;

 PROC PRINT DATA = income;
   Var id net expense;
   TITLE 'Table of &Title';
 RUN;


PROC PRINT DATA = income;
  Var id net expense;
  TITLE "Table of '&Title' ";
RUN;
