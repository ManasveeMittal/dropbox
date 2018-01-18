        
/*****Note: define library L with your own folder that contains data!********/     


libname L 'C:\SASCOURSE\data';


data people;
  set L.people;
run;

data income_info;
  set L.income_info;
run;


/**************examples of standardization*********************/

/*****use range method***********/
Proc stdize data=people out=people_std1 method=range;
  Var age income;
Run;



/*****use standard method***********/
Proc stdize data=people out=people_std2 method=std;
  Var _numeric_;
Run;




data indata;
 income_location=40000;
 income_scale=30000;
run;


proc stdize data=income_info out=income_std1 METHOD=IN(indata);
   var income;
   Location income_location;
   Scale income_scale;
run;



data std_lookup;
 _type_='LOCATION'; income=5000; age=18;
 output;
 _type_='SCALE'; income=17000; age=10;
 output;
run;


proc stdize data=income_info out=income_std2 METHOD=IN(std_lookup);
   var income age;
run;
