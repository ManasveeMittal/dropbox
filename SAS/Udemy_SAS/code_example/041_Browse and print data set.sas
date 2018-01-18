/***examples of proc print********/

Data income;
  Input  emp_id $  Gender $ income tax;
  Label income=money;
Cards;
01 M 10000 4000
02 F 30000 3500
03 F 60000 8000
04 M 20000 1900
05 M 80000 7700
;
Run;


PROC print data=income label noobs;
  Where tax/income>0.1;
  Var income;
Run;



PROC sort data=income; by gender; run;

PROC print data=income label;
  Id emp_id ;
  By gender;
  Var income gender;
  Sum income;
Run;



Data Churn;
Input ID_NUM BILL_DATE CHURN_DATE $ CHURN_IND $ CURR_CHARGE_AMT PAST_DUE_AMT BIRTH;
Datalines;
4864 18784 03/11/11 Y 17 602
4865 18637  N 47 . 4037
4865 18686 11/29/10 Y . . 5413
4866 18733 01/01/11 Y . . -7720
4867 18782 12/14/10 Y . . 5214
4872 18751 01/12/11 Y . . 152
4873 18706 02/15/11 Y . 1588 .
4877 18826 05/27/11 Y 306 601 .
4884 18908 07/16/11 Y 13 424 4952
4885 18874 05/11/11 Y   -4848
4894 18859 08/03/11 Y 98 1355 11602
;
Run;

options nodate pageno=1 linesize=180 pagesize=30 obs=10;
/* Ods pdf file=?y report.pdf'; */
PROC print data=Churn split='*';
  Title 'Churner List';
  Id ID_NUM;
  Var BIRTH BILL_DATE CHURN_IND CURR_CHARGE_AMT PAST_DUE_AMT;
  Label ID_NUM='CUSTOMER ID*-----------'  CHURN_IND='CHURN FLAG*-----------'
        CURR_CHARGE_AMT='CUSTOMER CHARGE AMOUNT*----------------------'
        PAST_DUE_AMT='PAST DUE AMOUNT*----------------' BIRTH='BIRTH DAY*-----------'
        BILL_DATE='BILL DATE*---------';
  Format BILL_DATE mmddyy10.;
  Format BIRTH date9.;
  Format CURR_CHARGE_AMT PAST_DUE_AMT Dollar10.;
Run;
