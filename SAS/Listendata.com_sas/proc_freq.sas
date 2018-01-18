data example1;
input x y $ z;
cards;
6 A 60
6 A 70
2 A 100
2 B 10
3 B 67
2 C 81
3 C 63
5 C 55
;
run;
proc freq data = example1;
tables y*x /list nocum nopercent;
run;

proc freq data = example1;
tables z* (y  x) / norow nocol nopercent;
run;


proc freq data = example1 nlevels;
tables y;
run;

Data example2;
input pre $ post $ count;
cards;
Yes Yes 30
Yes No 10
No Yes 40
No No 20
;
run;
proc freq data=example2;
tables pre*post /norow nocol nopercent nocum;
weight count;run;

TITle 'store output in SAS dataset';
proc freq data=example2 ;*noprint;
tables pre*post /norow nocol nopercent nocum out = work.temp1;
weight count;run;

