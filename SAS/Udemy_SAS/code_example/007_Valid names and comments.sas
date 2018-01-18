/*****example for usage of SAS comments*****/
/*****single line and block comments*****/

Data student;
  Input name $ age grade;
Datalines;
John 20 80
Marry 19 90
;
Run;

DATA student_new;
  SET student;
  /**I rename the columns grade and name***/
  RENAME grade=mark name=studentname;
  birthday=today()-age*365; *calculate birthday;
  *assign date9. format to the column birthday;
  FORMAT birthday date9.;
   /**** here I used 01JUN1998
          as the date format */
  DROP age; *I do not need this variable;
RUN;
