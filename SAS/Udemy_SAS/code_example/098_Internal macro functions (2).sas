
data person;
  Input name $ age salary;
Cards;
JOHN 29 50000
MARRY 26 50000
JOHN 23 65000
LARRY 30 99000
MIKE 22 60000
MIKE 26 70000
NICK 29 45000
;
run;

%let string=(nameJOHNage23,nameMARRYage26,nameMIKEage22);
%Macro findperson(D,string,n,out);
   %do j=1 %to &n;
     %let idstring=%scan(&string,&j.);
     %Let nameposi=%index(&idstring, age);
     %Let m_name=%substr(&idstring,5,&nameposi.-5);
     %Let m_age=%substr(&idstring,&nameposi.+3);
     Proc sql noprint;
        Create table temp as select * from &D. where name="&m_name" and age=&m_age;
     Quit;
     %If &j=1 %then %do;
        Data &out.;
          Set temp;
         Run;
     %End;
     %Else %do;
        Data &out.;
             Set &out. temp;
        Run;
     %End;
  %End;
%Mend;

%findperson(person,&string,3,result);
