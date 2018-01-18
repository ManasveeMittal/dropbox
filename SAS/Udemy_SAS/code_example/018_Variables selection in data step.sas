Data score;
  Input name $ gender $ score1 score2;
Datalines;
SMITH M 70 66
Jaycee M 57 59
LEE  M 68  70
Larry M 58 80
Jack F 89 78
Jerry M 52 69
;
Run;


Data score_1;
  set score;
  keep name score1;
run;


Data score_2;
  set score;
  rename id=cus_id;
  drop score1;
run;
