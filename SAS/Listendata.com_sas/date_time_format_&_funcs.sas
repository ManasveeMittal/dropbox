
    data _null_;
    a = date();
    b = today();
    c = "&sysdate"d;
    a1 = date();
    b1 = today();
    c1 = "&sysdate"d;
    put 'Without Format:' a = b = c =;
    format a1 b1 c1 ddmmyy10.;
    put 'With Format: ' a1 = b1 = c1 = ;
    run;
    
    data dates;
date1 = put(date(),mmddyy8.);
date2 = put(date(),WORDDATE.);
run; 

data _null_;
birthdt = '22oct91'd;
date1 = day(birthdt);
date2 = month(birthdt);
date3 = year(birthdt);
date4 = qtr(birthdt);
date5 = weekday(birthdt);
put date1 date2 date3 date4 date5;
run;

title' Functions - DATDIF and INTCK';
    data _null_;
    birthdt = '22oct91'd;
    date5 = datdif(birthdt, date(), 'ACT/ACT');
    date55 = intck('day',birthdt, date());
    date6 = intck('year',birthdt, date());
    date7 = intck('qtr',birthdt, date());
    date8 = intck('week',birthdt, date());
    date10 = intnx('month',date(), 5, 'sameday');
	date11 = intnx('month',date(), 5, 'end');
	put date5 date55 date6 date7 date8 date10 date11;
    run;
    
title 'Subsetting Date Formatted Data';
    data temp2;
    set temp;
    where date >= '1jan1991'd;
    run;
    
title 'datepart/timepart: return date/time from a sas datetime value';
data _null_;
x='21oct16:8:45'dt;
xx=datepart(x);
xxx=timepart(x);
put xx worddate.;
put xxx time.;
run;