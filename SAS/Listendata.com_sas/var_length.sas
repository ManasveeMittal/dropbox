TITLE 'SAS : Read Character Variable of Varying Length';
TITLE 'Method I: COLON MODIFIER|Read variable until there is a space or other delimiter';

DATA example1;
	INPUT ID Name :$30. Score; 
/* 	$30. defines a character variable having max length 30 */
	CARDS;
1 DeepanshuBhalla 22
2 AttaPat 21
3 XonxiangnamSamnuelnarayan 33
;

proc print noobs;
run;

TITLE'METHOD II: LENGTH STATEMENT|side-effect changes the order of variables ';
data example2;
length Name $30.;
input ID Name $ Score;
cards;
1 DeepanshuBhalla 22
2 AttaPat 21
3 XonxiangnamSamnuelnarayan 33
;
proc print noobs;
run;
	
TITLE 'METHOD III : Use Ampersand (&) and Put Extra Space|Also works in reading external file';
data example1;
input ID Name & $30. Score;
cards;
1 Deepanshu Bhalla  22
2 Atta Pat  21
3 Xonxiangnam Samnuelnarayan  33
;
proc print noobs;
run;