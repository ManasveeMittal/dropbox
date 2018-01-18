/****merge data sets******/

Data age;
  Input customer_id $  age;
  Datalines;
  1 36
  2 78
  3 19
  4 56
  5 30
  6 20
  7 12
;
Run;
Data sex;
  Input customer_id $  sex $;
  Datalines;
  1 F
  2 M
  4 M
  5 .
  6 F
  8 M
  9 F
;
Run;

Data new;
 Merge age sex;
 By customer_id;
Run;


Data new;
 Merge age sex;
 By customer_id;
 Run;

/*  Left join*/

 Data new_1;
 Merge age (in=sig) sex;
 By customer_id;
 If sig=1 then output;
 Run;

/*  Right join*/
Data new_2;
 Merge age sex (in=sig);
 By customer_id;
 If sig=1 then output;
 Run;

/*   inner join*/
Data new_3;
 Merge age (in=sig1) sex (in=sig2) ;
 By customer_id;
 If sig1=1 and sig2=1 then output;
Run;
