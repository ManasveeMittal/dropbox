/******application of macro progamming, SQL********/

%macro getresult(list, D, W, result);
proc sql noprint;
  create table &result. as select &list.
  from &D. where &W.;
quit;
%mend;
%let list=%str(id,item,purchase_date);
%let D=Orderitem;
%let W=%str(item EQ 'Food');
%let list1=%bquote(id,item,purchase_date);

%let result=subdata;

%getresult(&list1, &D, &W, &result);


%let female=100;
%let all=252;
%let c=%sysevalf(100*&female./&all.);

%put %nrstr(The % of female students are ) &c. ;
%put %nrstr(The value of &female is ) &female. ;


%Let X=%str(John%'s book);

%let  Y=%str(do not forget right bracket: %));

%Let X=%bquote(John's book);

%Let X=%str(John's book);


%put &X;

%put &Y;



data student;
 Input name $ age gender $;
Datalines;
JOHN . M
MARRY 32 F
FRANK . M
LUCY 27 F
LARRY 27 M
;
run;

Data variablelist;
 length sascodes  $60.;
 Input variable $ sascodes $;
Cards;
name   N/A
age    age_flag=(age=.)
gender male_flag=(gender='M')
;
Run;



Proc sql noprint;
 Select sascodes into :createvar separated by ';'
 from variablelist where (sascodes NE 'N/A');
Quit;

%Put %bquote(&createvar.;);

%Put &createvar.;


Data student_fix;
 Set student;
 %bquote(&createvar.;);
Run;


Data student_fix;
 Set student;
 &createvar.;
Run;



%macro getresult(list, D, W, result);
proc sql noprint;
  create table &result. as select &list.
  from &D. where &W.;
quit;
%mend;
%let x=id,item,purchase_date;
%let D=Orderitem;
%let W=%str(item EQ 'Food');
%let list=%bquote(&x.);

%let result=subdata;

%getresult(&list, &D, &W, &result);



Data spend;
 do customer_id=1 to 300;
   spend_amt=round(ranuni(23)*800,1);
   spend_count=round(15*ranuni(2),1)+1;
   output;
 end;
  Format spend_amt dollar10.;
Run;

/***we use following macro to create transformed variables****/
%macro get_transform(mydata);
%let dsid=%sysfunc(open(&mydata,i)); /***open data set**/
%let varlist_lg=;
%do i=2 %to %sysfunc(attrn(&dsid,nvars)); /*obtain numeric variable #**/
   %let q=%sysfunc(varname(&dsid,&i)); /***get variable name**/
   %let varlist_lg=&varlist_lg &q._lg=log(&q+1) %str(;);
%end;
%let rc=%sysfunc(close(&dsid)); /***close data set**/

%put The value of Macro variable varlist_lg is &varlist_lg. ;

data Spend;
  set Spend;
  &varlist_lg.; /***using macro variable to transform data**/
run;
%mend get_transform;
%get_transform(spend);
