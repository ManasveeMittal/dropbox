/***SAS macro programming*******/

data class_1;
 input id name $ gender $ grade;
datalines;
1 Jack M 88
2 Lucy F 78
3 Marry F 90
4 Linda M 71
5 David F 93
;
run;

data class_2;
 input id name $ gender $ grade;
datalines;
1 Eevin M 90
2 Josoph M 56
3 Mike M 82
4 Jane F 76
5 Marria F 89
;
run;

data class_3;
 input id name $ gender $ grade;
datalines;
1 Kathy F 98
2 Qiang M 67
3 Frank M 77
4 Amanda F 91
5 Kent M 90
;
run;


 %macro getclassmark(sex,out);
    %do j=1 %to 3;
        proc means data=class_&j.;
          var grade;
          where gender="&sex";;
            output out=avg_grade_&j._&sex. (drop=_type_ _freq_)
               mean=avg_grade n=count;
       run;
       quit;

     data avg_grade_&j._&sex.;
            set avg_grade_&j._&sex.;
            class=&j. ;
       run;
   %end;
   data &out.;
      set Avg_grade_1_f Avg_grade_2_f Avg_grade_3_f;
   run;
%mend getclassmark;

%let g=F;
%getclassmark(&g, result);


