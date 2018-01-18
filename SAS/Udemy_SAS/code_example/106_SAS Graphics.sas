

data sales_A;
  input month amount;
datalines;
1 12.5 
2 14.5 
3 15   
4 14.8
5 16.2
6 15.5
7 17
8 18.6
9 17.8
10 19
11 21
12 20
;
run;


data sales_B;
  input month amount;
datalines;
1 11.5 
2 13.5 
3 12   
4 13.8
5 15.1
6 14.8
7 16
8 17.2
9 17.1
10 18
11 19.1
12 18.3
;
run;

data sales_A;
 set sales_A;
 amount=amount*100000;
 format amount dollar11.;
 area='A';
run;
data sales_B;
 set sales_B;
 amount=amount*100000;
 format amount dollar11.;
 area='B';
run;

data sales;
  set sales_A sales_B;
run;
/*
symbol1 c=RED v=plut i=j;
symbol2 c=G v=plut i=j;
*/


/* Using GOPTIONS to set global SAS/graph options */
goptions reset=goptions 
         FTEXT="Arial" CTEXT=BLUE HTEXT=3 
         FTITLE=CENTB  CTITLE=RED HTITLE=5
		 CSYMBOL=G CBACK=WHITE CPATTERN=B
		 GUNIT=pct CELL BORDER
		 XMAX=6 YMAX=5
         ROTATE=LANDSCAPE;

/* Using global command to set color, symbol shape 
   and connection for each curve. The setting will
   overwrite some options in GOPTIONS above*/

symbol1 c=RED v=plut i=j;
symbol2 c=G v=dot i=j;
proc gplot;
  plot amount*month=area;
  title 'sales by month and area';
run;
quit; 


symbol1 c=RED v=plut i=spline;
symbol2 c=G v=plut i=spline;
proc gplot;
  plot amount*month=area;
  title 'Sales by Month and Area';
run;
quit;
 



symbol1 c=RED v=plut i=NONE;
symbol2 c=G v=plut i=spline;
proc gplot;
  plot amount*month=area;
  title 'Sales by Month and Area';
run;
quit;
 

legend1 frame across=1 label=("Sales Areas");
AXIS1 order=(1 to 12 by 1) minor=NONE label=("2011 Months");
AXIS2 order=(1000000 to 2100000 by 100000) minor=NONE 
label=("Sales 2011") major=(h=1.1);

symbol1 c=RED v=plut i=j;
symbol2 c=G v=dot i=spline;
proc gplot data=sales;
  plot amount*month=area /
  ctext=BLACK LEGEND=LEGEND1
  HAXIS=AXIS1 VAXIS=AXIS2;
  title 'Sales by Month and Area';
run;
quit;




data spend_income;
  input Year Spend Income;
datalines;
2000 30000 51000
2001 33000 55000
2002 37000 55000
2003 41000 57000
2004 45000 58000
2005 48000 58000
2006 52000 61000
2007 53000 63000
2008 50000 63000
2009 49000 63000
2011 53000 66000
2012 55000 69000
2013 57000 70000
;
run;

symbol1 c=RED v=plut i=j;
symbol2 c=BLUE v=dot i=j;

legend1 frame across=1 label=("Income Vs Spend");
proc gplot data=spend_income;
  plot income*year
       spend*year/overlay ctext=BLACK LEGEND=LEGEND1;
  title 'Income and Spend by Year';
run;
quit;

 



data credit_score_1;
  do id=1 to 1000;
     score=round(1000*ranuni(id),1);
	 output;
  end;
run;

data credit_score_1;
  set credit_score_1;
  length level $20.;
  high_risk=(ranuni(_n_+33)>0.61);
  if 300<score<550;
  level='HIGH';
run;


 
data credit_score_2;
  do id=1 to 1800;
     score=round(1000*ranuni(id+88),1);
	 output;
  end;
run;

data credit_score_2;
  set credit_score_2;
  length level $20.;
  high_risk=(ranuni(_n_+6)>0.87);
  if 550<score<700;
  level='MEDIUM';
run;


 
data credit_score_3;
  do id=1 to 1500;
     score=round(1000*ranuni(id+99),1);
	 output;
  end;
run;

data credit_score_3;
  set credit_score_3;
 length level $20.;
  high_risk=(ranuni(_n_)>0.97);
  if 700<score<900;
  level='LOW';
run;


data credit_score;
 set credit_score_1 credit_score_2 credit_score_3;
 t=ranuni(_n_+523);
 drop id;
run;

proc sort data=credit_score;
  by t;
run;
data credit_score;
  set credit_score;
  id=_n_;
  drop t;
run;


proc gchart data=credit_score;
  hbar level;
run;
quit;



pattern value=SOLID color=RED;


proc gchart data=credit_score;
  HBAR level /NOSTATS;
run;
quit;


pattern value=SOLID color=BLUE;
proc gchart data=credit_score;
  VBAR level /NOSTATS;
run;
quit;



pattern value=SOLID color=P;
proc gchart data=credit_score;
  HBAR3D level /NOSTATS;
run;
quit;


pattern value=SOLID color=G;
proc gchart data=credit_score;
  VBAR3D level /NOSTATS;
run;
quit;




pattern1 value=SOLID color=RED;
pattern2 value=SOLID color=BLUE;
pattern3 value=SOLID color=BLACK;


proc gchart data=credit_score;
  star level;
run;


proc gchart data=credit_score;
  pie level;
run;
quit;


proc gchart data=credit_score;
  pie3d level;
run;
quit;


proc gchart data=credit_score;
  DONUT  level;
run;
quit;


libname L 'C:\SASCOURSE\data';


data survey;
  set L.Market_survey;
  keep Person_ID gender Education Income smoker spend_food Married Employment Cups_Per_Week age;
run;




pattern value=SOLID color=GREEN;


proc gchart data=survey;
  HBAR gender ;
  Title 'Frequency/Gender';
run;
quit;

proc gchart data=survey;
  HBAR gender /NOSTATS ;
  Title 'Frequency/Gender';
run;
quit;


pattern1 value=PSOLID color=RED;
pattern2 value=PSOLID color=BLACK;
pattern3 value=PSOLID color=P;

proc gchart data=survey;
  PIE Education /CTEXT=BLACK NOHEADING 
  PLABEL=(COLOR=BLUE HEIGHT=4 FONT="Arial");
  Title 'Frequency/Education';
run;
quit;



goptions reset=goptions 
		 XMAX=10 YMAX=5 guni=pct
         ROTATE=LANDSCAPE;

pattern value=SOLID color=RED;

proc gchart data=survey;
  VBAR spend_food /NOSTATS sumvar=income type=mean ;
  format income spend_food dollar11.;
  Title 'AVG Income /Food Spend';
run;
quit;




goptions reset=goptions 
		  gunit=pct
         ROTATE=LANDSCAPE;

AXIS1 order=(0 to 45000 by 5000)  label=("Food Spend Group" HEIGHT=5);
AXIS2 order=(0 to 80 by 10) label=("Count" HEIGHT=5) major=(h=1.1);


pattern value=SOLID color=GREEN;

proc gchart data=survey;
  VBAR spend_food /CTEXT=BLUE MAXIS=AXIS1 RAXIS=AXIS2;
  format spend_food dollar11.;
  Title 'FREQUENCY /Food Spend';
run;
quit;




pattern value=SOLID color=BLUE;

proc gchart data=survey;
  VBAR3D Education 
  /CTEXT=BLUE sumvar=Cups_Per_Week type=mean;
  Title 'AVG Cups of Coffe /Food Spend';
run;
quit;




pattern value=SOLID color=RED;

proc gchart data=survey;
  VBAR3D income/CTEXT=BLUE midpoints=0 to 150000 by 20000;
  format income dollar11.;
  Title 'FREQUENCY /Income Level';
run;
quit;



pattern value=SOLID color=BLUE;

proc gchart data=survey;
  HBAR age/NOSTATS CTEXT=RED sumvar=income 
           DISCRETE type=mean clm=95;
  format income dollar11.;
  Title 'AVG Income /Age Group';
run;
quit;





pattern value=SOLID color=BLUE;

proc gchart data=survey;
  VBAR3D gender /NOSTATS CTEXT=BLACK group=employment
              sumvar=Cups_Per_Week
              type=mean;
  Title 'AVG Cups of Coffee / Gender and Employment Group';
run;
quit;



pattern1 value=SOLID color=GREEN;
pattern2 value=SOLID color=BLUE;

proc gchart data=survey;
  VBAR3D Education /NOSTATS CTEXT=BLACK subgroup=gender
              sumvar=Cups_Per_Week
              type=mean;
  Title 'AVG Cups of Coffee / Education and Gender Group';
run;
quit;


/*********new version graph*****/



legend1 frame across=1 label=("Sales Areas");
AXIS1 order=(1 to 12 by 1) minor=NONE label=("2011 Months");
AXIS2 order=(1000000 to 2100000 by 100000) minor=NONE 
label=("Sales 2011") major=(h=1.1);

symbol1 c=RED v=plut i=j;
symbol2 c=G v=dot i=spline;
proc gplot data=sales;
  plot amount*month=area /
  ctext=BLACK LEGEND=LEGEND1
  HAXIS=AXIS1 VAXIS=AXIS2;
  title 'Sales by Month and Area';
run;
quit;



PROC TEMPLATE;
  DEFINE STATGRAPH scatter;
    BeginGraph;
      EntryTitle "Sales 2011";
      EntryTitle "Example GTL";
       Layout overlay;

          ScatterPlot X=month Y=amount / GROUP=area NAME="Sales";

          regressionplot x=month y=amount;

          DiscreteLegend "sales" / ACROSS=3 TITLE="Sales in 2011";

      EndLayout;
    EndGraph;
  END;
RUN;



PROC TEMPLATE;
  DEFINE STATGRAPH scatter;
    BeginGraph;
      EntryTitle "Sales 2011";
      EntryTitle "Example GTL";
       Layout overlay;

          ScatterPlot X=month Y=amount / GROUP=area NAME="Sales";
          DiscreteLegend "Sales" / ACROSS=3 TITLE="Sales in 2011";

      EndLayout;
    EndGraph;
  END;
RUN;


proc sgrender data=Sales TEMPLATE=scatter;
run;
quit;



PROC TEMPLATE;
  DEFINE STATGRAPH bar;
    BeginGraph;
      EntryTitle "Sales 2011";
      EntryTitle "Example GTL";
       Layout overlay;

         barchartparm x=month y=amount;

      EndLayout;
    EndGraph;
  END;
RUN;

proc sgrender data=Sales TEMPLATE=bar;
run;
quit;





PROC TEMPLATE;
  DEFINE STATGRAPH series;
    BeginGraph;
      EntryTitle "Sales 2011";
      legenditem  type=marker name="newitem" / label="17"
            lineattrs=(color=red)
            markerattrs=(symbol=starfilled color=red);
      Layout overlay;

        SeriesPlot X=month Y=amount / GROUP=area NAME="Area";


          DiscreteLegend "Area" "newitem" ;
      EndLayout;
    EndGraph;
  END;
RUN;




PROC TEMPLATE;
  DEFINE STATGRAPH series;
    BeginGraph;
      EntryTitle "Sales 2011";
      Layout overlay;
        SeriesPlot 
          X=month Y=amount / GROUP=area NAME="Area";
          DiscreteLegend "Area" / TITLE="Areas" 
		 valueattrs=(size=11pt) autoitemsize=true;
      EndLayout;
    EndGraph;
  END;
RUN;

proc sgrender data=sales TEMPLATE=series;
run;
quit;











PROC TEMPLATE;
  DEFINE STATGRAPH series1;
    BeginGraph;
      EntryTitle "spend and income";
      Layout overlay;
        SeriesPlot X=year Y=income / NAME="spin" curvelabel="Income";
        SeriesPlot  X=year Y=spend / NAME="spin1" curvelabel="Spend";
     EndLayout;
    EndGraph;
  END;
RUN;

proc sgrender data=Spend_income TEMPLATE=series1;
run;
quit;




PROC TEMPLATE;
  DEFINE STATGRAPH series1;
    BeginGraph;
      EntryTitle "spend and income";
      Layout overlay/yaxisopts=(label="Relationship between Income and Spend") cycleattrs=true ;
        SeriesPlot X=year Y=income / NAME="spin" curvelabel="Income";
        SeriesPlot  X=year Y=spend / NAME="spin1" curvelabel="Spend";
     EndLayout;
    EndGraph;
  END;
RUN;

proc sgrender data=Spend_income TEMPLATE=series1;
run;
quit;






PROC TEMPLATE;
  DEFINE STATGRAPH series1;
    BeginGraph;
      EntryTitle "spend and income";

	   legenditem  type=marker name="incomele" / label="income"
            lineattrs=(color=red)
            markerattrs=(symbol=starfilled color=red);

	   legenditem  type=marker name="spendle" / label="spend"
            lineattrs=(color=red)
            markerattrs=(symbol=circle color=red);

      Layout overlay ;
        SeriesPlot X=year Y=income / NAME="spin" ;
	    DiscreteLegend "spin" "incomele" ;
        SeriesPlot  X=year Y=spend / NAME="spin1";
		DiscreteLegend "spin1" "spendle" ;
     EndLayout;
    EndGraph;
  END;
RUN;

proc sgrender data=Spend_income TEMPLATE=series1;
run;
quit;



data info;
  do id=1 to 1000;
    salary=round(abs(70000*rannor(id)),100);
	tax=round(salary*0.2*(1+ranuni(id+99)/5.5),100);
	spend=round((salary-tax)*ranuni(id+919)/1.5,100);
	output;
  end;
  format salary tax spend dollar11.;
  keep id salary tax spend;
run;

PROC TEMPLATE;
  DEFINE STATGRAPH spend;
    BeginGraph;
      EntryTitle "Density of Salary";
      Layout overlay;

       scatterplot y=tax x=salary  / name="sp" 
       markercolorgradient=spend 
       markerattrs=(symbol=circlefilled);

	   ContinuousLegend "sp" / title='spend';

     EndLayout;
    EndGraph;
  END;
RUN;

proc sgrender data=info TEMPLATE=spend;
run;
quit;




PROC TEMPLATE;
  DEFINE STATGRAPH barseries;
  BeginGraph;
  EntryTitle "Income and Spend";
  layout overlay /yaxisopts=(label="Dollar Value");

  barchart x=year y=spend;
  seriesplot x=year y=income/curvelabel="Income";
 
  endlayout;
 EndGraph;
 END;
RUN;

proc sgrender data=Spend_income(where=(year<2010)) TEMPLATE=barseries;
run;
quit;






PROC TEMPLATE;
  DEFINE STATGRAPH scatter;
  BeginGraph;
  EntryTitle "Income and Spend";
  layout overlay / 
  yaxisopts=(label="Dollar Value" labelattrs=(color=green size=10)) 
  xaxisopts=(label="Year" labelattrs=(color=blue size=15))
  cycleattrs=true;

  scatterplot x=year y=spend /markerattrs=(symbol=circlefilled size=10 color=red);
  scatterplot x=year y=income / markerattrs=(symbol=starfilled size=8 color=blue);
 
  endlayout;
 EndGraph;
 END;
RUN;

proc sgrender data=Spend_income TEMPLATE=scatter;
run;
quit;




proc template;
define statgraph spendpattern;
BeginGraph;
entrytitle 'Histogram of Spend';
layout overlay / xaxisopts=(label='Spend($)');
histogram spend / name='c' scale=count nbins=8 
                  yaxis=y FILLATTRS=(color=blue)
                  LEGENDLABEL="spend #";
histogram spend / name='p' scale=PERCENT nbins=8 
                  yaxis=y2 FILLATTRS=(color=green)
                  LEGENDLABEL="spend %";
densityplot spend / name='k' normal () yaxis=y2 
                   lineattrs=(color=black)
                   LEGENDLABEL="density curve";
DiscreteLegend "c" "p" "k";
endlayout;
entryfootnote halign=right "Created in 2013" 
              / textattrs=GraphValueText;
EndGraph;
end;
run;

proc sgrender data=info TEMPLATE=spendpattern;
run;
quit;

data survey;
  set L.Market_survey;
  keep Person_ID gender Education Income smoker spend_food Married Employment Cups_Per_Week age;
run;


proc template;
define statgraph proportion;
 begingraph;
 entrytitle "Income by Education";
 layout region;
 piechart category=education response=income 
 /stat=mean datalabelattrs=(size=16 color=green)
  dataskin=pressed datalabellocation=outside ; 
endlayout; 
endgraph;end;
run;
quit;

proc sgrender data=survey TEMPLATE=proportion;
  format income dollar11. ;
run;
quit;




data sales_A;
  input month amount;
datalines;
1 12.5 
2 14.5 
3 15   
4 14.8
5 16.2
6 15.5
7 17
8 18.6
9 17.8
10 19
11 21
12 20
;
run;


data sales_B;
  input month amount;
datalines;
1 11.5 
2 13.5 
3 12   
4 13.8
5 15.1
6 14.8
7 16
8 17.2
9 17.1
10 18
11 19.1
12 18.3
;
run;


data sales_C;
  input month amount;
datalines;
1 7.5 
2 12 
3 12   
4 10.3
5 7.1
6 15.8
7 16
8 15.6
9 14.1
10 17
11 16
12 15.3
;
run;

data sales_A;
 set sales_A;
 amount=amount*100000;
 format amount dollar11.;
 area='A';
run;
data sales_B;
 set sales_B;
 amount=amount*100000;
 format amount dollar11.;
 area='B';
run;

data sales_C;
 set sales_C;
 amount=amount*100000;
 format amount dollar11.;
 area='C';
run;

data sales_3;
  set sales_A sales_B sales_C;
run;

PROC TEMPLATE;
  DEFINE STATGRAPH salespanel;
    BeginGraph;
      EntryTitle "Sales in 2011";
      Layout DataPanel ClassVars=(area) /
          COLUMNS=2 ROWS=2 RowDataRange=UNIONALL
          HeaderLabelDisplay=VALUE;
          Layout Prototype / CycleAttrs=TRUE;
             SeriesPlot X=month Y=amount / 
             GROUP=area NAME="se";
          EndLayout;
          Sidebar;
             DiscreteLegend "se" / TITLE="Area";
          EndSidebar;
       EndLayout;
     EndGraph;
   END;
RUN;

proc sgrender data=sales_3 TEMPLATE=salespanel;
  format amount dollar11. ;
run;
quit;



proc template; 
 define statgraph lat;
  begingraph; 
   entrytitle "Income and Spend"; 
   layout lattice;
     piechart category=education response=income / stat=mean; 
	 barchart x=employment; 
     scatterplot x=age y=income; 
   endlayout; 
  endgraph; 
 end;
run;

proc sgrender data=Survey template=lat;
run;


data credit;
  do id=1 to 1305;
    balance=abs(round(598+rannor(id)*158,1));
	limit=abs(round(1200+rannor(id+88)*350,100));
	if limit<balance then limit=round(balance*(1+ranuni(id+199)),100);
	 utilization=round(100*(balance/limit),0.1);
    output;
  end; 
run;
proc univariate data=credit;
  var utilization;
run;

data credit;
 set credit;
 c=(1500-utilization*11)+rannor(_n_)*100;
 creditscore=round(c,1);
 c=(creditscore-280)/1209;
 creditscore=round(c*600+300,1);
 drop c;
run;

proc univariate data=credit;
  var creditscore;
run;



proc template; 
  define statgraph p3d;
   BeginGraph;
    entrytitle "Balance, Limit and Score"; 
     layout overlay3d / cube=false walldisplay=(fill) ; 
       surfaceplotparm x=balance y=limit z=creditscore/ 
       surfacetype=fill surfacecolorgradient=creditscore 
       colormodel=twocolorramp reversecolormodel=true ;
     endlayout;
  endgraph; 
 end;
run;

proc g3grid data=credit out=spline;
   grid balance*limit=creditscore / naxis1=75 naxis2=75 spline;
run; 

proc sgrender data=spline template=p3d;
run;




proc template;
  define statgraph dynagr;
     begingraph; 
	   entrytitle "Marketing Data"; 
       mvar SYSDATE9 statistics mcolor;
	   nmvar msize barw ;
       dynamic variable1 variable2 xlabel ylabel;
       layout overlay / 
		  xaxisopts=(label=xlabel labelattrs=(color=mcolor size=msize))
		  yaxisopts=(label=ylabel labelattrs=(color=mcolor size=msize)); 
          barchart x=variable1 y=variable2 /
             stat=statistics barwidth=barw ; 
        endlayout;
		entryfootnote halign=right "Created: " SYSDATE9 / 
          textattrs=GraphValueText;
	 endgraph; 
   end;
run;

%let barw=0.5; %let msize=15;
%let mcolor=green; %let statistics=mean;
proc sgrender data=Survey template=dynagr;
  dynamic variable1='age' variable2='income' 
          xlabel='Category' ylabel='Measure' ;
run;

 ods trace on/listing;
     PROC freq data=survey;
        tables education;
        tables employment;
     RUN;
ods trace off;

ODS GRAPHICS ON;
ods html;
ods select onewayfreqs;
     PROC freq data=survey;
        tables education;
        tables employment;
     RUN;
ods html close;
ODS GRAPHICS OFF; 



ods graphics on;
ods html;
ods select ParameterEstimates FitPlot;
proc reg data=survey;
model income=spend_food;
quit;
ods html close;
ods graphics off;


ods graphics on;
ods html;
proc univariate data=survey;
  var income;
  histogram income /normal;
quit;
ods html close;
ods graphics off;


proc sort data=survey out=survey_married;
 by married;
run;

proc sgplot data=survey_married;
  /***Data restriction for creating graph******/
  where (income>spend_food and 5000<income<120000);
  /***Define the maximum and minimum vaues of
  X AXIS and Y AXIS******/
  XAXIS max=120000 min=-20000;
  YAXIS max=40000 min=-20000;;
  /***produce scatter plot for income and spend_food
    stratified by married indicator group**/
  scatter x=income y=spend_food /group=married;
  /**Produce ellipse plot for income and spend_food **/
  ellipse x=income y=spend_food;
   /**Draw regression line for income and spend_food 
      stratified by married indicator group**/
  reg y=spend_food x=income / group=married;
run;
quit;



proc sgplot data=survey;
   refline 50000 /axis=y name='middle' legendlabel='Middle Income';
   keylegend "middle" /location=OUTSIDE position=BOTTOM;
   format income dollar11.;
   vbox income / category=education;
run;




proc sgplot data=survey;
   histogram income;
   density income/type=kernal;
   keylegend "middle" /location=OUTSIDE position=TOPLEFT;
run;





proc sgpanel data=survey;
   panelby employment / novarname;
   vbar education /response=income stat=mean;
   vbar education /response=spend_food stat=mean;
run;


proc sgpanel data=Sales_3;
   panelby area;
   scatter x=month y=amount;
   reg  x=month y=amount;
run;

