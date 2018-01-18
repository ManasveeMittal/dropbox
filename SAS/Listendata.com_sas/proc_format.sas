TITLE 'INFORMAT:how to read a variable|Data Steps and PROC Steps|used when importing external data or using cards/datalines| new variable definition';
TITLE 'FORMAT:how to write/display a variabl|Data Steps only ';

proc format;
    value range
    40000-high='High'
    26000-< 40000='Medium'
    other ='Low';
    run;

proc freq data = sashelp.cars;
    table msrp;
    format msrp range.;
    run;

data temp(where = (tsrp IN ('High' 'Medium')));
set sashelp.cars;
TSRP = put(msrp, range.);run;

proc sql;
select *,
put(msrp, range.) as tsrp
from sashelp.cars
where calculated tsrp in ('High', 'Medium');
quit; 

DATA sampledata;
     INPUT @6 date1 ddmmyy8. @15 date2 ddmmyy10.;
     *FORMAT date1 ddmmyy8. date2 ddmmyy10.;
cards;
     30-12-16 30-12-2016;
RUN;

DATA temp;
    *INPUT @6 dt worddate.;
    dt=today();
    *FORMAT dt date11.;
    *format dt yymmdd10.; 
    *format dt date9.;
	*format dt WORDDATE.;
	*format dt WEEKDATE.;
	*format WORDDATX19;
PROC PRINT NOOBS;
RUN;

data _null_;
dt=today();
put "Day :"  dt  DAY.;
put "Month :" dt MONTH.;
put "YEAR:" dt YEAR.;
put "WEEKDAY:" dt DOWNAME.;
proc print; run;