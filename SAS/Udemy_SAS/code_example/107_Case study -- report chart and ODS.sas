libname L 'C:\SASCOURSE\data';  


ODS PDF FILE='C:\SASCOURSE\data\salesreport.pdf';

PROC report data=L.productsales NOWD split='|' headskip headline;
  Column area month sale_amount ;
  define month / width=12 group 'Month';
  define area / width=12 cross 'Transaction Number by Area';
  define sale_amount /width=12 sum 'Sales Amount';
  rbreak after / summarize skip dul;

Run ;


PROC report data=L.productsales NOWD split='|' headskip headline;
  Column month product sale_amount;
  define month / width=12 group 'Month';
  define product / width=12 group 'Product';
  define sale_amount /width=12 'Sales Amount AVG' sum;
  break after product / skip ol;
  rbreak after / summarize skip dul;
  title2 'Sales Amount by Product' ;
Run ;

 proc gchart data=L.productsales;
  VBAR3D product /NOSTATS CTEXT=BLACK subgroup=area
              sumvar=sale_amount
              type=sum;
  Title 'Sales Amount by Province and Product';
 run;

ODS PDF close;
