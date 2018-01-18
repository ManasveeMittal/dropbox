Automatically created in the sas env during data-step

>>    _N_
>>    _ERROR_

val1, val2, val3,........,_error_,is error,_N_ (line no.)
   4,  3/2,    5   ->           0,     NO , 1
   5,  9/0,    7   ->           1,    YES , 2


Data sample;
input firstname $ age;
datalines;
john 32
marry 50
david 0
larry 23
;
run;

data sample_with_id;
set sample;
id = _n_;
if _n_ = 2 then lastname = 'malina';
else lastname = 'sir';
agelog = log(age);
error = _error_;
if _error_ = 1 then put 'check error';
run;

Data employee;
infile datalines dlm = ',' DSD truncover;
length name adress telephone $50.;
input name $ address $ telephone $ call_date: mmddyy10.;
format call_date data9.;
if _N_ =2 then call_date=call_date+1;
datalines;
alicw, 123, 387-8763-34, 11/23/1989
aakj,45, kijuhyg, 08/12/2016
,,1233, 02/22,2016
;
run;


data manager;
input id $ dep $ sal mons;
avg_sal = sal/mons;
if _error_ then do;
	*_error_ = 0;
if mons=0 then avg_sal = sal;
end;
err_ =_ERROR_;
datalines;
1 D1 240 3
2 D3 234 0
;
run;


/***************OUTPUT Statement*****************/
Data temperature;
input year winter spring summer fall;
cards;
2001 -12 16 30 6
2002 -34 76 23 8
2003 -24 76 98 4
;
run;

data temperature_t;
set temperature;
season = 'Winder'