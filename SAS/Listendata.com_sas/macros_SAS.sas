/* *Creating Macro variables; */

/* METHOD-I:%LET|can be defined inside or outside a macro*/

/* %LET macro-variable-name = value; */
%let x = 5;  
%let dt = &sysdate;

/* using macro variables */
/* & <Macro variable Name>  */
/* To view in log window what macro variable would return, use %PUT statement : */
%put &dt; 
%put NOTE: system date is &dt. ;

/* METHOD-II:Macro Parameters |macro function with parameters*/

%macro mac1 (input =, ivar=, output=);
proc means data = &input noprint;
var &ivar;
output out = &output mean =;
run;
%mend;
/* call a macro */
%mac1(input = sashelp.cars, ivar= msrp, output = test1); 
%mac1(input=sashelp.heart, ivar= height, output=test2);

/* METHOD III-INTO clause in PROC SQL */
proc means data = sashelp.heart noprint;
var height;
output out = test ;*mean = avg_height;
run;

proc sql noprint;
select avg_height into:var1
from test;
quit;
%put &var1;

/* METHOD IV: CALL SYMPUT routine  */
/* syntax : CALL SYMPUT(macro_varname,value); */

data _null_;
set test;
call symput('var2', avg_height);
run;
%put &var2;

/* METHOD V:ITERATIVE %DO */
/* syntax:
    %DO macro-variable = start %TO stop <%BY increment>;
    . . . text . . .
    %END
*/
%macro calc(start,stop);
%do year = &start to &stop;
data test;
set yr&year;
year = 2000+&year;
run;
%end;
%mend calcl;

/* Creating macros completed */




