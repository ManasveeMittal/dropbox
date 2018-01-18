
%let x=5+6;

%let x=%eval(5+6);

%let x=%SYSEVALF(6.4/2);

%put &x.;


%macro g(n);
%do j=1 %to &n.;
data month_&j.;
 do id=1 to 30;
   amount=round(1000*ranuni(id+102*&j.),1);
   output;
 end;
 format amount dollar10.;
run;
%end;
%mend;
%g(6);
%mend;



%macro compare(begin, lag);
  %let end=%eval(&begin.+&lag.);
  proc sql;
    select avg(amount) into :m1 from month_&begin.;
      select avg(amount) into :m2 from month_&end.;
 quit;
 %let ratio=%sysevalf(&m2./&m1.,ceil);
 %put &ratio.;
%mend;






%compare(1, 2);
