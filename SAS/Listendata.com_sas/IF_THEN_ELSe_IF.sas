/*
 Comparison Operators
 =	  EQ	equals	"IF gender = ‘M’; or IF gender EQ ‘M’;"
^= or ~=	NE	not equal	IF salary NE . ;
> 	  GT	greater than	IF salary GT 4500;
< 	  LT	less than	IF salary LT 4500;
>=	  GE	greater than or equal	IF salary GE 4500;
<=	  LE	less than or equal	IF salary LE 4500;
in	  IN	selecting multiple values	IF country IN(‘US’ ’IN’);

LOGICAL OPERATORS

Symbolic 	Mnemonic 	Meaning 	Example 
& 	    AND 	Both conditions true 	IF gender =’M’ and age =1; 
| 	    OR 	    Either condition true 	IF gender =’M’ or age =1; 
~ or ^ 	NOT 	Reverse the statement 	IF country not IN(‘US’,’IN’);
*/
Data readin;
Input ID Q1-Q3;
cards;
85 1 2 3
90 . 4 6
95 2 5 6
100 6 6 4
105 . 5 6
110 6 6 5
run;

TITLE 'IF [THEN] statement';
Data readin1;
Set readin;
IF ID LE 100; /*alternate [IF ID GT 100 THEN DELETE] */ 
proc print;
run;

TITLE 'IF-THEN-ELSE Statement';
Data readin1;
Set readin;
IF ID LE 100 THEN TAG ="Old";
ELSE TAG ="New";
proc print ; run;

TITLE 'IF-THEN-ELSE-IF Statement';
Data readin1;
Set readin;
length TAG $20;
IF ID < 75 THEN TAG ="Old";
ELSE IF 75 <= ID < 100 THEN TAG = "New"; 
ELSE IF ID >= 100 THEN TAG ="Unchecked";
proc print; run; 

TITLE 'generate an analysis for Q1 USING VALID/NON MISSING VALUES AND LESS THAN 3'
Data readin1;
Set readin;
IF (Q1 LT 3) AND (Q1 NE .);
PROC PRINT ;run; 



