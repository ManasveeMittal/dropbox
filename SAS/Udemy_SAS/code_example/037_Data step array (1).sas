
/***array examples*****/
Data grade;
  Input name$ Math Music English;
Datalines;
John 80 80 63
Marry 76 64 .
Gale 77 . 56
Lucia 77 90 .
Larry 33 75 63
;
Run;

/***impute missing values using array***/
Data grade_impute;
   Set grade;
   Array marker[*] _numeric_;
 /**Or: array marker[*] Math Music English***/
   Do i= 1 to dim(marker);
       If  marker[i]=. then
       marker[i]=999;
   End;
   Drop i;
Run;


/*Array example: one line output multiple lines*/
Data wt_one;
   Input id $ wt1 wt2 wt3 wt4 wt5 wt6;
 Datalines;
 01 155 167 162 149 148 173
 02 110 112 231 107 291 111
 03 162 221 108 107 178 118
 ;
 Run;
/* We use two dimension array to output two columns:  id and weight*/
Data wt_many;
   Set wt_one;
   Array wts[2,3] wt1-wt6;
   Do cond=1 to 2;
    Do time=1 to 3;
      weights=wts[cond,time]; Output;
     End;
   End;
   Drop wt1-wt6 cond time;
Run;


Data old;
 Input string $1-16;
Datalines;
abcdefghij
klmnopqrst
;
Run;
/* We use char array to get 10 variables (columns, one letter). */
Data new;
 Set old;
   Array a{*} _character_ s1-s10;
   u=string;
   Do j=2 to 11;
       a{j}=substr(u,j-1,1);
   End;
   Drop u j string;
Run;
