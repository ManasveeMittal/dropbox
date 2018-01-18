
data readin;
input name $ Section $ Score;
cards;
Tom  A 84
Raj  A 80
Ram  B 71
Atul . 77
Priya . 45
Sandy A 67
Sam  A 57
David B 39
Wolf B 34
Rahul . 95
Sahul C 84
Lahul C 44
;
run;

data readin1;
set readin;
where Section is not missing and (Score not between 50 and 75);
proc print;
run;

/* The NOT operator can be used within WHERE statement in many ways : */
/* 1. where section is missing and score is not missing; */
/* 2. where not (score in (34,44,84)); */
/* 3. where not (Score between 50 and 75); */
/* 4. where NOT(Section EQ "A");  */

TITLE 'CONTAINS Operator : Searching specific character';
data readin1;
set readin;
where name contains 'hul';
proc print ;
run;

TITLE 'LIKE Operator : Pattern Matching';
Title '1. percent sign (%) - Wildcard Character| 2. underscore ( _ ) - Fill in the blanks';
data readin1;
set readin;
where name like 'S%';
*where name like '_ahu';
*where name like '_a%';
*where name like '_ahu%';
proc print;
run;

TITLE 'SOUNDS like operators'
data readin1;
set readin;
where name = *'Ram';
proc print; run;

TITLE 'WHERE = Data Set Option in DAta step';
data readin1 (where = (section ='A'));
set readin;
run;

TITLE 'WHERE = Data Set Option in proc step';
proc print data=readin (where=(section='A'));
run;
