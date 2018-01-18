/*modify value of variable**/
DATA  student;
  input name $ age grade;
DATALINES;
Jack 19 89
Marry 20 91
Kevin 17 80
Jane 21 79
;
RUN;


DATA newstudent;
  SET student;
  Newgrade=grade+5;
RUN;
