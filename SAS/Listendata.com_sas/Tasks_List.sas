/*The List Data task displays the contents of a table as a report.*/

/* basic listing of dataset*/
title1 "basic listing of dataset, List Data for SASHELP.CARS";
proc print data=SASHELP.CARS label;
run;
/**********************************/

title1 "listing and sorting the dataset SASHELP.CARS";

proc sort data=SASHELP.CARS out=WORK.SORTTEMP;
	by Cylinders;
run;

proc print data=WORK.SORTTEMP label;
	by Cylinders;
run;

proc delete data=work.SORTTEMP;
run;
/**********************************/

title1 "sorting the dataset SASHELP.CARS, and select few variables";

proc sort data=SASHELP.CARS out=WORK.SORTTEMP;
	by Origin;
run;

proc print data=WORK.SORTTEMP label;
	var Horsepower DriveTrain;
	by Origin;/*printing by attribute origin*/
run;
/**********************************/
title1 "sorting the dataset SASHELP.CARS, and aggregating few variables";

proc sort data=SASHELP.CARS out=WORK.SORTTEMP;
	by Origin;
run;

proc print data=WORK.SORTTEMP label;
	var Horsepower DriveTrain;
	by Origin;
	sum MPG_Highway MPG_City;
run;
/**********************************/

title1 "sorting the dataset SASHELP.CARS, and aggregating few variables, limit observation results to 10, id_label added";

proc sort data=SASHELP.CARS out=WORK.SORTTEMP;
	by Origin;
run;

proc print data=WORK.SORTTEMP
	(obs=10) noobs label;
	var Horsepower DriveTrain;
	by Origin;
	sum MPG_Highway MPG_City;
	id Type;
run;

proc delete data=work.SORTTEMP;
run;
/**********************************/