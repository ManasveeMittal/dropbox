/* read more complicated data */


data application;
  infile 'C:\SASCOURSE\data\application.txt' dlm='|' missover truncover DSD
          firstobs=2 obs=max lrecl=32767 IGNOREDOSEOF;
  length cus_ID street_num city apply_date street post gender reject_ind
         special houseprice last_apply_date income_report $100.;
  input cus_ID $ street_num $ city $ apply_date $ street $ post $ gender $ reject_ind $
            special $ houseprice $ last_apply_date $ income_report $;
run;
