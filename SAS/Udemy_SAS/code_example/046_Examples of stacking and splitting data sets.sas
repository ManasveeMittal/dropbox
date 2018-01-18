/***stack and split data sets********/

 Data student_score1;
  Input name $ gender $ score1 score2;
Datalines;
SMITH M 70 66
JONES M 57 59
LEE  M 68  71
;
Run;

Data student_score2;
 Input name $ gender $ age score1 score2;
Datalines;
LONG F 18 72 50
GREEN F 19 70 90
LEE  M 20 68  70
FOREMAN M 17 60 77
;
Run;

Data teacher;
  teachername='Cory';
  teachergender='M';
Run;


/**Case 1: Stack first two data sets*/

Data student_score;
  Set student_score1
      student_score2;
Run;


Data student_1;
  Set student_score1;
  Set student_score2;
Run;


Data student_2;
  Set student_score2;
  Set student_score1;
Run;



Data teacherstudent1;
  Set teacher;
  Set student_score1 student_score2;
Run;

Data teacherstudent2;
  If _n_=1 then set teacher;
  Set student_score1 student_score2;
Run;


data Temperature;
   input year season $ temp;
datalines;
2001 Sring 15
2002 Winter -5
2001 Summer 32
2002 Summer 25
2001 Fall 10
2002 Fall 8
2003 Winter 0
run;

data temp2001 temp2002 temp2003;
  set Temperature;
/*assuming data only contains year 2001,2002 and 2003**/
  if year=2001 then output temp2001;
  else if year=2002 then output temp2002;
  else output temp2003;
Run;
