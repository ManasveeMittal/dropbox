DATA READIN;
	INPUT ID X1 X_T $;
	CARDS;
2 3 01
3 4 010
4 5 022
5 6 021
6 7 032
;
RUN;

title 'keep all vars starting with "X"';

DATA READIN2;
	SET READIN (KEEP=X:);

proc print ;
RUN;

title 'Use of WildCard in IN Operator';

DATA READIN2;
	SET READIN;

	IF X_T IN: ('01', '02');
RUN;

data dummy;
	input q1 q3 q4 q2 q6$ bu$ q5;
	cards;
    1 2 3 5 sa an 3
    2 4 3 6 sm sa 4
    6 5 3 8 cb na 3
    ;
run;

data example3;
	set dummy;
	total=sum(of q:);
proc print ;
run;

proc sort data = sashelp.class out=class nodup;
by name sex;
run;

proc transpose data = sashelp.class out=temp;
by name sex;
var height weight;
run;

proc transpose data = temp delimeter=_ out=temp2(drop=_name_);
by name;
var col1;
id _name_ sex;
proc print;
run;

proc sql ;*noprint;
select CATS('new_',name) into: newnames separated by " "
from dictionary.columns
where libname = "WORK" and memname = "TEMP2" and name like "Height_%";
quit;

data temp2;
set temp2;
array h(*) height:;
array newh(*) &newnames.;
do i = 1 to dim(h);
newh{i} = h{i}*2;
end;
drop i;
proc print;
run;
