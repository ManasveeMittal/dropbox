/****apply user defined format********/
data sales;
 Input code_id $ saleamount;
Datalines;
01 40188
03 32545
04 27374
01 23456
04 21898
02 49150
03 30032
01 29789
;
Run;


PROC format;
 Value $ecode
          '01'='John Smith'
          '02'='Jerry Lin'
          '03'='Vitoria Sign'
          '04'='David Venderberg'
          '05'='Jack Merk';
Run;


data sales_format;
 set sales;
 sales_name=put(code_id,$ecode.);
 format saleamount dollar15.;
Run;


PROC format;
  Value measure
   1='small'    2='medium'
   3='large'     4='unknown';
Run;

Data clothes;
  Input sname $ size;
  Format size  measure.;
Datalines;
john 2
marry 4
larry 3
gale 2
linda 1
;
Run;


Data lookup;
 Set clothes;
 pcode=put(size, measure.);
Run;



Data Credit_score;
  Input customer_id score;
Datalines;
1 568
2 789
3 350
4 802
5 190
6 .
7 389
;
Run;


PROC format;
  VALUE Riskl
          300 -< 500 = 'High Risk'
          500 -< 650 = 'Medium Risk'
          650 - HIGH = 'Low Risk'
          OTHER ='Bad Data';
Run;

Data Risk;
  Set Credit_score;
  risk=score;
  Format risk Riskl.;
Run;



proc format;
invalue $incode 'A' = 'Very Strong'
'B' = 'Strong'
'C' = 'Fair'
'D' = 'Mix'
'E' = 'WEAK'
'F' = 'N/A'
;
run;
data Opinion;
input question_num  answer $incode. ;
datalines;
1 B
2 D
7 F
11 C
12 A
13 E
;
Run;


PROC format;
invalue inccomef(upcase)
30000 - 120000 = _same_
'LOW' = 8000
'HIGH' =150000
'N/A' = .
 other = 0;
run;



DATA cityincome;
input id $ source1: inccomef8. source2: inccomef8. source3: inccomef8.;
datalines;
1 50000 LOW 80000
2 80000 HIGH N/A
3 500   57000 .
4 other 30000 LOW
5 HIGH 90000 M
;
Run;


PROC format;
invalue grade_cutf
 'Excellent' = 90
 'Good' = 80
 'Fair' = 65
 'Poor' =60
 'N/A' = . ;
Run;


DATA grade;
length id score $10.;
input id $ subject $ score $;
cutoff=input(score, grade_cutf12.);
datalines;
S1 Math Good
S1 Art Excellent
S1 Sport  N/A
S2 Math Fair
S2 Sport Poor
S3 Math Excellent
;
Run;
