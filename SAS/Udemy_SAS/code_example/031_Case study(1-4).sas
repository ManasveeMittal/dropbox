/****SAS codes for case study 1-4********/

libname L 'C:\SASCOURSE\data';

DATA employee;
  length name $18.;
  Input name & $ Gender $ age emp_date: date9.;
  format emp_date ddmmyy10.;
DATALINES;
David Li  M 36 02jUN2003
Marry Smith  F 50 07FEB2003
Jenny Lam  F 46 .
Joseph Ddvert  M 33 18May2010
Greeny Khuller  F 40 20FEB2009
Frank Allegretti  M . .
Gallant  NA 50 11APR2011
;
RUN;


data L.SAS_Chronic;
  infile 'C:\SASCOURSE\data\Chronic Disease_1.txt' dlm='|' DSD firstobs=2 obs=max Missover;
  length year Site Age Event_Type Age_Rate Age_Specific_Lower Age_Specific_Upper Count Population Siteorder $50.;
  input Year $ Site $ Age $ Event_Type $ Age_Rate $ Age_Specific_Lower $ Age_Specific_Upper $ Count $ Population $ Siteorder $;
run;

data L.outstock;
 set L.stock;
 length stockstring $45.;
 file 'C:\SASCOURSE\data\stockdata.txt';
 stockstring=left(trim(compress(po_1_s || pc_1_s || ph_1_s || pl_1_s || vo_1_s || exec_s || symbol_s)));
 put stockstring $;
 keep stockstring;
run;

data L.Stock;
  infile 'C:\SASCOURSE\data\stockdata.txt' Missover truncover;
  input price_open $1-6 price_close $7-12 price_high $13-18 price_low $19-24 volume $25-34
        exchange $35-40 symbol $41-46;
run;


DATA businessacc;
 infile 'C:\SASCOURSE\data\businessacc.csv' DSD firstobs=2;
 length id Bureau tradeline acc_name acc_type $50.;
 input id $ num Bureau $ tradeline $ open_date: mmddyy10. acc_num limited
 Acc_banlance Am_pastdue monthly_pay acc_name $ acc_type $;
 format open_date mmddyy10.;
RUN;
