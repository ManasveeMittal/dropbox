DATA outdata;
	INPUT age gender $ dept obs1 obs2 obs3;
	CARDS;
1 F 3 17 6 24
1 M 1 19 25 7
3 M 4 24 10 20
3 F 2 19 23 8
2 F 1 14 23 12
2 M 5 1 23 9
3 M 1 8 21 7
1 F 1 7 7 14
3 F 2 2 1 22
1 M 5 20 5 2
3 M 4 21 8 18
1 M 4 7 9 25
2 F 5 10 17 20
3 F 4 21 25 7
3 F 3 9 9 5
3 M 3 7 21 25
2 F 1 1 22 13
2 F 5 20 22 5
;

proc print ;
run;

title1 'Reading Delimited Data';

DATA outdata;
	INFILE Datalines dlm=",";
	INPUT age gender $ dept obs1 obs2 obs3;
	Datalines;
1,F,3,17,6,24
1,M,1,19,25,7
3,M,4,24,10,20
3,F,2,19,23,8
2,F,1,14,23,12
;

proc print ;
run;

title1 'Importing External Data(excel file): PROC IMPORT';

PROC IMPORT DATAFILE="<path and file name>" OUT=WORK.outdata DBMS=xls REPLACE;
	SHEET="Sheet1";
	GETNAMES=YES;
RUN;

title1 ' Importing a Tab-Delimited File into SAS';

PROC IMPORT DATAFILE="c:\deepanshu\sampledata.txt" OUT=outdata DBMS=dlm REPLACE;
	delimiter='09'x;
	GETNAMES=YES;
RUN;
/* Importing a Space-Delimited File, specify delimiter = '20'x; */
/* Importing a Comma-Delimited File with TXT extension delimeter = ',' */
/* Importing a Comma-Delimited File with CSV extension: specify DBMS= CSV; */

title1 'Method II : Get External File - INFILE';
/* manual/custom method to speify variable alias and length   */
data outdata; 
infile 'c:\users\deepanshu\documents\book1.csv' dsd firstobs=2;
input id age gender $ dept $; 
run;
/* INFILE statement - To specify path where data file is saved. */
/* DSD - To set the default delimiter from a blank to comma. */
/* FIRSTOBS=2 : To tell SAS that first row contains variable names and data values starts from second row. */

How to handle an external file :
FILENAME sample 'c:\deepanshu\sampledata.csv' ;
DATA outdata;
infile sample dsd;
INPUT age gender $ dept obs1 obs2 obs3;
run;
