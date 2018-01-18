
/****stop execution using return statement*********/

data Calrate;
   Input amount_1 amount_2;
   If amount_2<=0 then return;
   rate=round(100*(amount_1-amount_2)/amount_2,0.1);
Datalines;
349 290
450 0
592 396
498 -389
390 301
;
Run;



/****overdue data across monthes*****/

Data overdue;
  Input id $ m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12;
Datalines;
001 0 0 0 0 1 0 0 0 1 0 0 0
002 0 0 0 0 0 0 0 0 0 1 0 0
003 0 0 0 0 0 0 0 0 0 0 0 0
004 0 1 0 0 0 0 0 0 0 0 1 0
005 0 0 0 0 0 1 0 0 0 0 0 0
006 1 0 0 0 0 0 0 0 0 0 0 0
;
Run;


/***obtain the first overdue month ****/
/***use return statement****/

Data overdue_month;
 Set overdue;
 Array monthrec[*] m1-m12;
 Do k=1 to dim(monthrec);
    if monthrec[k]=1 then do;
          firstoverdue=k;
          output;
          Return;
     End;
  End;
  Keep id firstoverdue;
Run;


/***use goto statement****/

Data overdue_month1;
 Set overdue;
 Array monthrec[*] m1-m12;
 Do k=1 to dim(monthrec);
    If (monthrec[k]=1) then goto num;
 End;
 Put "  No overdue:" k;
 Return;
 num:
 put "  With overdue:" k;
 firstoverdue=k;
  output;
 Keep id firstoverdue;
run;

