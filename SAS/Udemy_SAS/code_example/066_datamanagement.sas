/******data management using proc contents and proc datasets********/

data manager;
  length dep $20.;
  input id $ dep $ salary age;

cards;
M12 Sales   87000 45
M11 R%D     80000 47
M13 Market  66000 38
M14 Admin   70000 53
M15 Storage 68000 60
;
run;

data employee;
  length dep $20.;
  informat bod date9.;
  input id $ dep $ gender $ salary bod: date9. ;
  format salary dollar10. bod mmddyy10.;
cards;
M22 Sales   M 57300 12JUN1990
M21 R%D     M 42000 19JUL1983
M23 Market  F 41800 07MAY1991
M24 Admin   F 50000 12FEB1973
M29 R%D     F 52000 11FEB1979
M25 Storage M 50000 21OCT1999
M42 Sales   M 81300 16AUG1971
;
run;


libname L 'C:\SASCOURSE\data';

data L.customers_2;    
   Do customerkey = 101 to 200;
    count=round(32*ranuni(customerkey*3+8),1);
	amount=round(18*count*ranuni(customerkey*13+8));
    Output;
   End;
Run;

Data L.customers_old;
   Do id_old = 1 to 100;
    Output;
   End;
Run;

Data L.customers_new;
  Do id_new = 1 to 200;
    Output;
  End;
Run;


PROC datasets library=L;                                       
   Modify customers_1; 
   Format amount  dollar12.;  /* Format a Variable  */            
   Label amount = 'transaction amount';  /* Create a LABEL */              
   Rename count = num_tran;    /* RENAME a Variable  */ 
 quit;
run;

PROC datasets library=L;      
   Repair customers_new;                /* REPAIR the Data set */            
   Change customers_new = customers;    /* RENAME a Data set  */ 
 
   Contents data=customers_2;    /* Print CONTENTS of a data set */ 
 
   copy in=L out=work;  /* copy data from L to work library*/ 
   select Customers_old /* copy this data set*/

   Delete customers_old;         /* DELETE the data set  */   
quit;
Run; 

proc datasets lib=work nolist kill;
quit;
run;




PROC datasets ;                                       
   Modify customers_1; 
   Format amount  dollar12.;  /* Format a Variable  */            
   Label amount = 'transaction amount';  /* Create a LABEL */              
   Rename count = num_tran;    /* RENAME a Variable  */  
run;


data manager;
  length dep $20.;
  input id $ dep $ salary age;
  format salary dollar10.;
cards;
M12 Sales   87000 45
M11 R%D     80000 47
M13 Market  66000 38
M14 Admin   70000 53
M15 Storage 68000 60
;
run;




Proc fslist fileref='C:\SASCOURSE\data\house.csv';
Run;


%macro get_filenames(location)
   filename pipedir pipe   "dir &location. /b " lrecl=32767;
   data filenames;
     infile pipedir truncover;
     input line $char1000.;
   run;
%mend;

%get_filenames(C:\temp\)              /* works */
%get_filenames('C:\temp\with space')  /* doesnt work */



filename FLIST pipe "dir/B C:\SASCOURSE\data\*.txt";

data datalist;
     length filename $50.; 
     infile FLIST  ;
     input filename  ;
run;

proc print data = datalist;
run;

