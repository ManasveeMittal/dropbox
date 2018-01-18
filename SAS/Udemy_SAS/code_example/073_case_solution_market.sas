
/*****Note: define library L with your own folder that contains data!********/

/****examples of market analysis share wallet************/

libname L 'C:\SASCOURSE\data';

proc sql;
  create table firm_A_customer as select distinct uid
  from (select * from L.trades where owner='firm_A');
quit;

data credit_cards;
  set L.trades;
  if product='card';
run;

proc sort data= firm_A_customer;
  by uid;
run;
proc sort data= credit_cards;
  by uid;
run;

data credit_cards;
  merge credit_cards (in=a) firm_A_customer (in=b);
  by uid;
  if a and b;
run;


proc sql;
  create table share as select uid, owner, sum(balance) as balance
  from credit_cards where product='card' and balance>0
  group by uid, owner order by uid;
quit;

proc transpose data=share out=share_tr;
  by uid;
  id owner;
run;


data share_tr;
  set share_tr;
  array a[5] firm_A firm_B firm_C firm_D firm_E;
  do j=1 to 5;
    if a[j] =. then a[j] =0;
  end;
  total= firm_A + firm_B + firm_C + firm_D + firm_E;
  do j=1 to 5;
    a[j]= round(100*a[j]/total,0.1);
  end;
  format total dollar7.2;
  drop j _NAME_;
run;









/****market analysis penetration************/

proc sql;
 create table firmA_customer_card as select count(*) as c from
 (select distinct uid from L.trades where owner='firm_A' and product='card');

 create table all_customer_card as select count(*) as c from
 (select distinct uid from L.trades where product='card');
quit;



%macro penetration(product);
   proc sql;
    create table FirmA_customer_&product. as select count(*) as c from
   (select distinct uid from L.trades where owner='firm_A' and product="&product.");

  create table all_customer_&product. as select count(*) as c from
  (select distinct uid from L.trades where product="&product.");
 quit;
%mend;

%penetration(checking);






/***campaign analysis and measurement***/

 proc sort data=L.trades;
   by uid;
 run;
 proc sort data=L.camplist;
   by uid;
 run;
 data L.trades1;
    merge L.trades L.camplist;
    by uid;
 run;


data L.trades1;
      set L.trades1;
      if  cam_flag='' then  cam_flag='NO';
      closenew= ('31JUL2015'd<opendate<'30SEP2015'd and
      owner='firm_A' and  product='card' and
      (closedate - opendate) <100);

      opennew= ('31JUL2015'd<opendate<'30SEP2015'd and
      owner='firm_A' and  product='card');
    run;

   data L.trades1;
      set L.trades1 ;
      if owner='firm_A' and  product='card';
   run;


  proc sort data= L.trades1 out=L.trades2 nodupkey;
     by uid;
  run;

  proc freq data = L.trades2;
    tables cam_flag * opennew;
  run;

  proc freq data = L.trades2;
    tables cam_flag * closenew;
  run;
