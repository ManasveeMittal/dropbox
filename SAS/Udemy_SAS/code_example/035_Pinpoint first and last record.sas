/**first. and last. statements*******/

Data patient;
  Input patient $1-4 @6 strtdt date9.
  @16 stopdt date9.;
  Format strtdt stopdt date9. ;
Cards;
1001 01JAN1998 05JAN1998
1001 08JAN1998 15JAN1998
1001 23JAN1998 29JAN1998
1003 06JAN1998 08JAN1998
1003 12JAN1998 20JAN1998
1004 .         .
1005 11JAN1998 21JAN1998
;
Run;


PROC sort data=patient;
 By patient;
Run;

Data patient_first;
 Set patient;
 By patient;
 If first.patient then output;
Run;

Data patient_last;
 Set patient;
 By patient;
 If last.patient then output;
Run;
