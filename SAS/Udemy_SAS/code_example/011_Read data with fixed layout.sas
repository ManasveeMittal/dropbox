/*Understand and Use Date Formats */

DATA DATE_DATA;
 firstdate='01JAN1960'd;
 seconddate=366;
RUN;


DATA DATE_DATA2;
 firstdate='01JAN1960'd;
 seconddate=366;
 FORMAT firstdate mmddyy10.;
 FORMAT seconddate date9.;
RUN;



DATA DATE_DATA2;
 firstdate='01JAN1960'd;
 seconddate=366;
 days=567;
 FORMAT firstdate mmddyy10.;
 FORMAT seconddate date9.;
 thirddate=firstdate + days;  /*the date 567 days after Jan 1 1960**/
 forthdate=seconddate - days; /*the date 567 days before Jan 1 1961**/
 FORMAT forthdate ddmmyy10.;
RUN;


/* SAS date format and informat */
Data people;
  Input Birthday mmddyy10. ID   Name $;
  Format Birthday Date9.;
Datalines;
06/12/1970 025 James
01/11/1968 030 David
10/23/1980 012 Jane
;
Run;
