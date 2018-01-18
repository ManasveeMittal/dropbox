/* Stream a CSV representation of SASHELP.CARS directly to the user's browser. */

proc export data=sashelp.cars
            outfile=_dataout
            dbms=csv replace;
run;

%let _DATAOUT_MIME_TYPE=text/csv;
%let _DATAOUT_NAME=cars.csv;

/////////////////////////////////////////////////////////////////////////////
/** FOR CSV Files uploaded from Windows **/
FILENAME CSV "<Your CSV File>" TERMSTR=CRLF;
/** FOR CSV Files uploaded from Unix/MacOS **/
FILENAME CSV "<Your CSV File>" TERMSTR=LF;
/** Import the CSV file.  **/
PROC IMPORT DATAFILE=CSV
		    OUT=WORK.MYCSV
		    DBMS=CSV
		    REPLACE;
RUN;
/** Print the results. **/
PROC PRINT DATA=WORK.MYCSV; RUN;
/** Unassign the file reference.  **/
FILENAME CSV;

/////////////////////////////////////////////////////////////////////////////
/** Import an XLSX file.  **/

PROC IMPORT DATAFILE="<Your XLSX File>"
		    OUT=WORK.MYEXCEL
		    DBMS=XLSX
		    REPLACE;
RUN;

/** Print the results. **/
/*OPTIONAL*/PROC PRINT DATA=WORK.MYEXCEL; RUN;
/////////////////////////////////////////////////////////////////////////////

-------------------mY_pRACTISE-----------
Filename CSV "/folders/myfolders/Learn/cars.csv" TERMSTR =LF;

PROC IMPORT DATAFILE=CSV
			OUT=WORK.CSV_IMPORT_1
			DBMS=CSV
			REPLACE;
RUN;

PROC EXPORT DATA=WORK.CSV_IMPORT_1
			OUTFILE = _DATAOUT
			DBMS=CSV REPLACE;
RUN;	
%LET _DATAOUT_MINE_TYPPE = TEXT/CSV;
%LET _DATAOUT_NAME=CARS_EXPORT_1.CSV;

PROC IMPORT DATAFILE = '/folders/myfolders/Learn/cars.xlsx' 
			OUT = WORK.CARS_IMPORT_XLSX
			DBMS = XLSX
			REPLACE;
RUN;			
/////////////////////////////////////////////////////////////////////////////
