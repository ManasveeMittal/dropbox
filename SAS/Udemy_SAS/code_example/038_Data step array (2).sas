/***array examples, temporary array *****/
Data check_badnumber;
  Array bad{3}  _temporary_ (60 90 120);
  Array delinquency[3] mortgage creditcard loan;
  Input id $ delinquency[*];
  bad_num=0;
  Do i=1 to 3;
    if delinquency[i]>bad{i} then bad_num+1;
  End;
  Drop i;
Datalines;
001 64 80 135
002 50 100 110
003 76 110 150
004 0 0 180
005 10 0 0
;
Run;
