
/*****Note: define library L with your own folder that contains data!********/

libname L 'C:\SASCOURSE\data';


/***Using Some Symbols in PROC TABULATE*****************/
PROC Tabulate DATA=L.sales;
 Var Sales_quantity;
 Class Transaction_type Promotion_ind;
 Table Transaction_type Promotion_ind Sales_quantity;
Run;


PROC Tabulate DATA=L.sales;
 Var Sales_quantity;
 Class Transaction_type Promotion_ind;
 Table Transaction_type,
       (Promotion_ind Sales_quantity*(mean sum));
Run;


PROC Tabulate DATA=L.sales;
 Var Sales_quantity;
 Class Transaction_type Promotion_ind;
 Table Transaction_type*Promotion_ind;
Run;


PROC Tabulate DATA=L.sales;
 Var Sales_quantity;
 Class Transaction_type Promotion_ind;
 Table Transaction_type,
       Promotion_ind;
Run;

PROC Tabulate DATA=L.sales;
 Var Promotion_ind;
 Class Transaction_type;
 Table Transaction_type, Promotion_ind*mean;
Run;


PROC Tabulate DATA=L.sales;
 Var Sales_quantity;
 Class Transaction_type Promotion_ind;
 Table Transaction_type,
       Sales_quantity*mean (Transaction_type Promotion_ind)*n;
Run;
