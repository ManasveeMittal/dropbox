/***do.. to.. while statement***/

data customer;
  do id=1 to 1000;
    output;
  end;
run;

data sum;
  sum=0;
  seq=0;
  n=1;
  do while (seq<600);
    n=n+1;
    sum=sum+n;
      seq=seq+2;
      output;
  end;
run;



data invest;
  amount=100;
  yearall=10;
  year=1;
  output;
  do until(year>10);
    amount=amount*(1+0.1);
      year=year+1;
      output;
  end;
  keep year amount;
run;
