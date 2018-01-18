/******examples of transposing data*******/
Data grade;
  Input class_no $ english math  music classname $;
Datalines;
01  67 89 90 class_1
02  88 91 78 class_2
03  80 81 90 class_3
;
Run;

PROC TRANSPOSE DATA=grade OUT=grade_tr1 name=subject;
    Id class_no;
    VAR  english math  music;
RUN;


PROC TRANSPOSE DATA=grade OUT=grade_tr2 name=subject prefix=cl;
    Id class_no;
    IDLABEL classname;
    VAR  english math music;
RUN;



DATA Citylist;
 Input city $ type $ s1 s2 s3 s4 @@;
Datalines;
KO H 27 37 29 24    KO L 21 25 23 16
TA H 25 32 28 16    TA L 18 26 23 14
;
Run;

PROC sort data= Citylist;
 by city type;
Run;

PROC transpose out=B;
   Var s1 s2 s3 s4;
   By city;
Run;

PROC transpose out=B;
   Id type;
   Var s1 s2 s3 s4;
   By city;
Run;




DATA product;
    INPUT sales DATE DATE7. product_name $
          price pst gst other_fee;
    FORMAT DATE DATE7.;
    record=_n_;
    recordlabel= compbl('record'|| record);
    datalines;
 1  2JUN84 CUR 31 1.25 1.32 0
 3  2JUN84 CUR 32 1.35 1.33 1.
 1 11JUL84 MEN 72 .    7.82 12.
 1 13AUG84 MEN 86 3.21 2.83 0
 ;
RUN;

PROC SORT data=product;
    BY product_name date sales;
RUN;


PROC TRANSPOSE DATA=product OUT= product_gstpst PREFIX= gstpst;
    BY product_name date sales;
    VAR gst pst;
RUN;
