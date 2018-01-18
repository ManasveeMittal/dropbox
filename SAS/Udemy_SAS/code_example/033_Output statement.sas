/****usages for output statement*****/
Data income_information;
   Input id name $ income;
Datalines;
1 Mark 56000
2 Larry 89000
3 Marry 97000
4 David 35000
5 Lucia 50000
;
Run;

Data income_high;
 Set income_information;
 If income>60000 then output;
 /**or simply***/
 If income>60000;
Run;


/**create multiple records in each line***/
Data temperature_info;
  Input year Winter Spring Summer Fall;
Cards;
2001  -12 16 30 6
2002 -15 13 27 8
2003 -9  11 29 7
;
Run;


Data temperature;
  Set temperature_info;
  Season='Winter'; Temp=Winter;
  Output;
  season='Spring'; Temp=Spring;
  Output;
  Season='Summer'; Temp=Summer;
  Output;
  Season='Fall'; Temp=Fall;
  Output;
  Keep Year Season Temp;
Run;

Data temperature;
  Set temperature_info;
  Season='Winter'; Temp=Winter;
  *Output;
  season='Spring'; Temp=Spring;
  *Output;
  Season='Summer'; Temp=Summer;
  *Output;
  Season='Fall'; Temp=Fall;
  *Output;
  Keep Year Season Temp;
Run;

Data income_simulation;
   Do employee_id=1 to 100;
   income=round(ranuni(99)*100000,100);
   Output;
   End;
Run;

Data income_simulation_1;
   Do employee_id=1 to 100;
     income=round(ranuni(99)*100000,100);
   End;
Run;
