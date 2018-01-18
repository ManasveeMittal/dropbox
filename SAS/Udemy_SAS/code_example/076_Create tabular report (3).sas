
/*****Note: define library L with your own folder that contains data!********/

libname L 'C:\SASCOURSE\data';


/*********Combining Class and Computed Variables ********************/

PROC Tabulate DATA=L.sales;
 Var Sales_quantity;
 Class Transaction_type;
 Table Transaction_type all,
       Sales_quantity*(mean n max min)
 / BOX='Sales statistics by Transaction Type';
Run;



PROC Tabulate DATA=transaction;
 Var Amount;
 Class month online type;
 Table month online, amount*type*mean
 /BOX='Transaction Statistics' MISSTEXT='none';
Run;



PROC Tabulate DATA=L.sales;
 Var Sales_quantity;
 Class Transaction_type;
 Table Transaction_type,
       Sales_quantity*mean='Average' ;
Run;


PROC Tabulate DATA=L.sales;
 Var Sales_quantity;
 Class Transaction_type Promotion_ind;
 Table Transaction_type,
       Promotion_ind*n=' ';
Run;




PROC Tabulate DATA=L.sales;
 Var Sales_quantity;
 Class Transaction_type;
 Table Transaction_type all,
       Sales_quantity*(mean n max min)
 / BOX='Sales statistics by Transaction Type';
keylabel ALL = 'Total'
mean = 'Average'
n = 'Count'
max='Maximum'
min='Minimum';
Run;




PROC Tabulate DATA=transaction;
 Var Amount;
 Class month online type;
 Table month online, amount*type*mean;
Run;



PROC Tabulate DATA=transaction FORMAT=DOLLAR9.2;
 Var Amount;
 Class month online type;
 Table month online, amount*type*mean
 /BOX='Transaction Statistics' MISSTEXT='N/A';
Run;


PROC Tabulate DATA=L.allsales;
 Var Sales_quantity sales_amount Promotion_ind;
 Class Transaction_type ;
 Table Transaction_type all,
       Sales_quantity*(mean*f=6.1 sum*f=comma7.)
       sales_amount*(mean*f=DOLLAR7. sum*f=DOLLAR8.)
         (Promotion_ind='promotion')*(sum*f=comma7. pctn*f=6.1)
 / BOX='Sales statistics by Transaction Type';
keylabel ALL = 'Total'
mean = 'Average'
n = 'Count'
sum='Total'
PcTN='%';
Run;






/*Work with Missing Values for Class Variables*/

PROC Tabulate DATA=L.drinkdata;
 Var income Cups_Per_Week;
 Class Education Smoker;
 Table Education all,
       Smoker*(n*f=6. pctn*f=5.1)
       income*(mean*f=DOLLAR7.1 nmiss*f=comma7.)
         Cups_Per_Week*(mean*f=3. pctn)
 / BOX='Statistical Report';
keylabel ALL = 'Total'
mean = 'Average'
n = 'Count'
sum='Total'
PcTN='%'
nmiss='missing #';
Run;


PROC Tabulate DATA=L.drinkdata missing;
 Var income Cups_Per_Week;
 Class Education Smoker;
 Table Education all,
       Smoker*(n*f=6. pctn*f=5.1)
       income*(mean*f=DOLLAR7.1 nmiss*f=comma7.)
         Cups_Per_Week*(mean*f=3. pctn)
 / BOX='Statistical Report' MISSTEXT='Missing';
keylabel ALL = 'Total'
mean = 'Average'
n = 'Count'
sum='Total'
PcTN='%'
nmiss='missing #';
Run;
