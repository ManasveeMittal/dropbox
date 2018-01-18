/**examples of proc corr***/
/*****Note: define library L with your own folder that contains data!********/

libname L 'C:\SASCOURSE\data';


data people;
  set L.weight;
run;

proc corr data=people NOMISS;
   var weight food hours_exec;
run;



 proc corr data=people BEST=2;
   var _numeric_;
 run;




 proc corr data=people NOMISS outp=outcor_p outs=outcor_s outh=outcor_h BEST=2;
   var Height food hours_exec;
   with weight;
 run;




 proc corr data=people NOMISS outp=outcor_p BEST=2;
   var weight food hours_exec height;
 run;
