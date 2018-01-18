data one;
SET SASHELP.CARS;
KEEP  MSRP INVOICE;
run;

//TO LEARN
DATA TRY11;
INPUT MSRP INVOICE;
DATALINES
RUN;

TITLE1 'IMPLICIT CONVERSION: numeric to character' ;
DATA ONE;
 LENGTH COST $10 REVENUE $4;
 SET ONE;
 COST = MSRP;
 REVENUE = iNVOICE;
RUN;
Footnote1 'ERROR WHEN NEW DEFINED VAR LEN IS LESS THANM REQUIRED // $32,243 -> 32E3, $30,071 -> 3E4';
 TITLE1 'IMPLICIT CONVERSION: numeric to character';


DATA WORK.ONE;
	set work.one;

	if cost='' then
		delete;
run;

//review
DATA WORK.ONE;
	LENGTH PROFIT_TAG $20;
	SET WORK.ONE;

	if (msrp - invoice) < 0 then
		PROFIT_TAG='Loss' else if (msrp - invoice) < 1000 then
			PROFIT_TAG='Low' else if (msrp - invoice) < 2500 then
				PROFIT_TAG='standard' else if (msrp - invoice) > 2500 then
					PROFIT_TAG='PREMIUM' else 'not calculated';
RUN;

DATA WORK.ONE(KEEP = invoice MSRP);
	set work.ONE;
run;

	DATA WORK.ONE(DROP =COST REVENUE);
		set work.ONE;
	run;
------------------------------	
DATA WORK.ONE;
	length profit_tag $10;
	missing x;
	set work.one( keep = msrp invoice);

	if (msrp -invoice >= 5000) then
		profit_tag='great';

	if (msrp -invoice >= 10000) then
		profit_tag='premium';

	if (msrp -invoice < 5000) then
		profit_tag='x';

	if (msrp -invoice < 2500) then
		profit_tag='low';

	if (msrp -invoice < 0) then
		profit_tag='negative';
run;

proc freq data=work.one;
run;
