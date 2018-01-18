     data dummy;
    input q1 q3 q4 q2 q6$ bu$ q5;
    cards;
    1 2 3 5 sa an 3
    2 4 3 6 sm sa 4
    6 5 3 8 cb na 3
    ;
    run;
    
title 'specifying varaible list';
title 'single dash (-) : consecutively numbered variables';
title 'double dash (--): consecutively ordered  variables';
data dummy1 (drop= q1--q5);
set dummy;
sum = sum(of q1-q4);
sum1 = sum(of q1--q4);
proc print;
run;

title 'numeric only variables';l
data dummy1 (drop= q1--q5);
set dummy;
sum = sum(of _numeric_);
proc print; run;

title 'use double dash in array';
data dummy1;
set dummy;
array vars1 q1--q4;
do over vars1;
vars1 = vars1 - q1;
end;

proc print;
run;

Title 'numerical only vars in double dash';
proc print;
var q1-numeric-q6;
run;

Title 'character only vars in double dash';
proc print;
var q1-character-q6;
run;
