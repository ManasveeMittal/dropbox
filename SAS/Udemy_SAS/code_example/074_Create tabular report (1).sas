/**use proc tabulate to produce tablar report****/
/*****Note: define library L with your own folder that contains data!********/

libname L 'C:\SASCOURSE\data';

Data transaction;
  Input Month $ Online $ Type $ Amount;
  Transaction=_n_;
  Format Amount Dollar10.0;
Datalines;
Jan NO Food 52
Jan YES Clothes 105
Jan NO Other 132
Jan NO Food 72
Jan YES Clothes 75
Jan YES Other 101
Feb NO Food 93
Feb YES Clothes 71
Feb NO Other 111
Feb YES Food 87
Feb NO Clothes 67
Feb NO Other 121
Mar YES Food 83
Mar NO Clothes 123
Mar NO Other 171
Mar YES Food 62
Mar NO Clothes 103
;
Run;


PROC Tabulate DATA=transaction;
 Var Amount;
 Class month type;
 Table month, amount*(type all)*mean;
Run;



PROC Tabulate DATA=L.sales;
 Var Sales_quantity;
 Class Transaction_type;
 Table Transaction_type*n;
Run;




PROC Tabulate DATA=L.sales;
 Var Sales_quantity;
 Class Transaction_type;
 Table Transaction_type,
       Sales_quantity*(mean n max min);
Run;
