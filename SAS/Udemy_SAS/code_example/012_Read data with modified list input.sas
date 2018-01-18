/* Modified List Input  */

/**wrong way***/
data nameaddress1;
  input name $ age bithday mmddyy10.;
  format bithday date9.;
datalines;
marry 43 05/21/1980
glen 52  03/15/1978
david 46 11/18/1987
;
run;


/**right way***/
data nameaddress2;
  input name $ age bithday: mmddyy10.;
  format bithday date9.;
datalines;
marry 43 05/21/1980
glen 52  03/15/1978
david 46 11/18/1987
;
run;
