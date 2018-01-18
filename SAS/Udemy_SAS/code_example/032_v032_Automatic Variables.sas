 /***_n_ and _error_ automatic variables**********/
 Data sample;
   input firstname $ age;
 datalines;
 John 32
 Marry 50
 David 0
 Larry 30
 Kent 39
 ;
 run;

 /****add id using _n_******/

 data  sample_withid;
   set sample;
   id=_n_;
   if _n_ = 2 then lastname = 'Malina';
 run;

 /****get error column to record error info******/

 data  sample_error;
   set sample;
    *error=0;
    agelog=log(age);
    error=_error_;
 run;


 /***print error message*******/

 data  sample_error_print;
   set sample;
    agelog=log(age);
    if _error_ =1 then put 'error in calculation!';
    error=_error_;
 run;








