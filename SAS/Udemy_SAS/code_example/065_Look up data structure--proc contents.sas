/***use proc contents to look up data structure******/

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


proc contents data=manager out=p;
run;
proc contents data=employee out=v ;
run;


proc contents data=employee out=v (keep=name type);
run;


proc contents data=WORK._all_ DIRECTORY out=alltables
  (keep=LIBNAME name type LENGTH FORMAT MEMLABEL);
run;
