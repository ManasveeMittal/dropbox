/****SAS codes for case study 5-6****/

libname L 'C:\SASCOURSE\data';

/*******example 1***********/
/**solution**/
data l.cr_score_fix;
  set l.cr_score;
  array score[*] Score_A Score_B Score_C Score_D;
  array scorenew[*] S1-S4;
  do j=1 to dim(score);
    scorenew[j]=score[j];
    if score[j]=0 then scorenew[j]=.;
  end;
  mean_score=round(mean(of S1-S4),1);
  min_score=min(of S1-S4);
  lastpay_since_st=intck('month', Start_DATE, Lastpay_date);
  po_plus=index(recent_Month,'+');
  if po_plus>1 then recent_Month_new=substr(recent_Month,1,po_plus-1)+0;
  else recent_Month_new=input(recent_Month,3.);
  po_to=index(TENURE,'TO');
  if po_to>1 then do;
      TENURE_low=substr(TENURE,1,po_to-1)+0;
        TENURE_high=substr(TENURE,po_to+3,2)+0;
  end;
   po_plus=index(TENURE,'+');
   if po_plus>1 then do;
      TENURE_low=substr(TENURE,1,po_plus-1)+0;
        TENURE_high=100;
   end;
   Num_brk_prom_high=(Num_brk_prom>2);
   keep customer_id TENURE_low TENURE_high mean_score min_score lastpay_since_st
        Num_brk_prom_high recent_Month_new;
Run;




/**solution**/
data L.exam_grade;
  infile 'C:\SASCOURSE\data\grade_exam.csv' DSD firstobs=2 obs=max;
  array ans[*] $ answer1-answer12;
  array mark[*] mark1-mark12;
  array correct[*] correct1-correct12;
  array missing[*] missing1-missing12;
  array standard{12} $ _temporary_ ('A' 'B' 'D' 'A' 'C' 'A' 'B' 'B' 'D' 'A' 'B' 'B');
  input student_id $ ans[*] $;

  do question=1 to 12;
     if ans[question]='' then ans[question]='9';

     if ans[question]=standard{question} then do;
         mark[question]=1; correct[question]=1; missing[question]=0;
       end;
       else if ans[question]='9' then do;
          mark[question]=0.5; correct[question]=0; missing[question]=1;
       end;
       else do;
           mark[question]=0; correct[question]=0; missing[question]=0;
       end;
  end;
  corrate=round(100*mean(of correct1-correct12),0.1);
  cornum=sum(of correct1-correct12);
  misrate=round(100*mean(of missing1-missing12),0.1);
  misnum=sum(of missing1-missing12);
  errorrate=round(100-corrate-misrate,0.1);
  errnum=12-cornum-misnum;
  grade=round(100*sum(of mark1-mark12)/12,1);
  if grade>89 then excellent='Y';
  keep student_id grade corrate cornum misrate misnum errorrate errnum excellent;
 RUN;

















