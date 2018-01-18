
/**

Warning:

In order to correctly run the following SAS programs,

please change the file pathes to your own path

***/


/*****examples for list inputting data*********/
DATA  student1;
  infile datalines dlm='|';
  input name $ age grade;
DATALINES;
Jack | 19 | 89
Marry | 20 | 91
Kevin | 17 | 80
Jane | 21 | 79
;
RUN;

DATA  student2;
  infile datalines dlm=',';
  input name $ age grade;
DATALINES;
Jack , 19 , 89
Marry , 20 , 91
Kevin , 17 , 80
Jane , 21 , 79
;
RUN;


DATA  student3;
  infile datalines DSD;
  input name $ age grade;
DATALINES;
Jack , 19 , 89
Marry , 20 , 91
Kevin , 17 , 80
Jane , 21 , 79
;
RUN;


/*with missing values -- by | with dlm method. you will not get correct result*/
DATA  student4;
  infile datalines dlm='|';
  input name $ age grade;
DATALINES;
Jack | 19 | 89
Marry || 91
Kevin | 17 | 80
Jane | 21 | 79
;
RUN;


/*with missing values -- by | with dlm method with DSD, you will get right result*/
DATA  student5;
 infile datalines dlm='|' DSD;
 input name $ age grade;
DATALINES;
Jack | 19 | 89
Marry || 91
Kevin | 17 | 80
Jane | 21 | 79
;
RUN;


DATA  nameaddress;
  infile datalines DSD;
  input name $ address $;
DATALINES;
Jack , 3422 woodamp ave
Marry , 881 glen mix cres
Kevin , maiacle land st.
Jane , birback slope ave
;
RUN;


/*Read Data from External Files */
data houseprice;
  infile 'C:\SASCOURSE\data\house.csv' DSD;
  input id $ price hprice lprice name $;
  file 'C:\SASCOURSE\data\result.csv';
  put id $ price hprice lprice name $;
run;


DATA houseprice_new;
  INFILE 'C:\SASCOURSE\data\house.csv' DSD;
  input property_id price highprice lowprice clientname $;
  middleprice=(highprice+lowprice)/2;
  FILE 'C:\SASCOURSE\data\newhouse.txt';
  PUT clientname property_id price middleprice;
RUN;
