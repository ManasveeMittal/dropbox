data purchaserecord;
  input id purchase purchase_date: date9. ;
  format purchase_date: date9.;
  format purchase dollar10.;
datalines;
1 200 03APR2011
2 84 05APR2011
3 320 15MAY2011
4 55  23JUN2011
5 310 05JUL2011
6 119 16AUG2011
;
run;

proc means data=purchaserecord;
  var purchase;
  output out=purchase_avg mean=purchase;
run;

DATA _NULL_;
 SET purchase_avg;
 if _n_=1 then CALL SYMPUT('m_purchase', purchase);
RUN;

%put &m_purchase;

data purchaserecord;
 set  purchaserecord;
 level=round(100*purchase/&m_purchase.,1);
run;




%let m_grade=100;
Data student;
      set students;
      if name ='John' then
        grade=symget("m_grade");
Run;
