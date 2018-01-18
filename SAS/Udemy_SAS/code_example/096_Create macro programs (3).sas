


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


data people;
  input id name $;
datalines;
2 Carl
4 Linder
5 John
;
run;

%Macro m_sort_merge(driver=,D1=,D2=,MD=,type=);
 Proc sort data=&D1.;
   By &driver;
 Run;
 Proc sort data=&D2.;
   By &driver;
 Run;
 Data &MD.;
    Merge &D1.(in=flag1) &D2.(in=flag2);
    By &driver;
    %If &type=0 %then %do;
      Output ;
    %End;
    %If &type=1 %then %do;
      If flag1 and flag2 then output;
    %End;
    %If &type=2 %then %do;
      If flag1=1 then output;
    %end;
    %If &type=3 %then %do;
      If flag2=1 then output;
    %End;
 Run;
 Quit;
%Mend m_sort_merge;


%m_sort_merge(driver=id,D1=Purchaserecord,D2=people,MD=outcome,type=1);
%m_sort_merge(id,Purchaserecord,people,outcome,1);
