title 'compress function|removes leading spaces and then trailing spaces';

title 'concatenate function||strings "cat" or "||" | numeric and string "catx" or cats" or "||"';
title 'The || keyword inserts multiple spaces when numeric and text values are concatenated.';
title 'CATS strips both leading and trailing blanks, and does not insert separators.';
title 'CATX strips both leading and trailing blanks, and inserts separators. The first argument to CATX specifies the separator.';
data _null_;
    a = 'abc';
    b = 'xyz';
    c = a || b;
    d = cat(a,b);
    x = "Temp";
	y = 22;
	z = x||y;
	z1 = cats(x,y);
	z2 = catx("",x,y);
    put c= d = z= z1= z2=;
    run;

title 'SCAN( text, nth word, <delimiters>)|extracts words within a value that is marked by delimiters';
data _null_;
string='Hello SAS community people!';
first_word=scan(string, 1, ' ' );
last_word=scan(string, -1, ' ' );
beginning= scan( string, 1, 'S' ); ** returns "Hello ";
middle = scan( string, 2, 'S' ); ** returns "A";
end= scan( string, 3, 'S' ); **returns " community people";
put first_word = last_word=  beginning= middle= END= ;
run;

TITLE 'substr(old_var, starting_position, number of characters to keep)';
TITLE 'SUBSTR(Left of =) Function: replaces a portion of string with new string';
TITLE 'UPCASE|LOWCASE|PROPCASE';

TITLE 'INDEX|finds characters or words in a character variable';
/* To select all the records having 'ian' in their character. */
    if index(name,'ian') > 0;
 /*To select all the records having first letter 'H' */
    if name =: 'H';

data _null_;
set = sashelp.cars;
a_index = index(make, "a");
run;

title 'FIND (character-value, find-string <,"modifiers"> <,start>)|replaces all occurrences of a word in a character string';
FIND("abcxyzabc","abc",4);

title 'TRANWRD (variable name, find what , replace with)';
Example :  name : Mrs. Joan Smith
name=tranwrd(name, "Mrs.", "Ms.");

title 'TRANSLATE(source, replace with, find what)|replaces specific characters in a character expression';
 Examples:
x = translate('XYZW','AB','VW');
Result :  "XYZB"

title ' PRXMATCH (perl-regular-expression, source)| identify existense of alphanumerics| saearch char variable for multiple diff strings';
/*
    ^ - start with 
    $ - end with 
    \D - any non digits 
    \d - digits 
    ? - may or may not have? 
    | - or 
    * - repeating 
    ( i:) - turns ON the case insensitive search
    (-i:) - turn OFF the case insensitive search
*/

DATA test;
INPUT string $ 1-8;
prxmatch_result=prxmatch("/[a-zA-Z]/",string);
CARDS;
ACBED
11
12
zx
11 2c
abc123
;
run; 
Examples: Replace multiple words with a new word
    if prxmatch('/Luthir|Luthr|Luther/',name) then name='Luthra' ;

 title 'INPUT:convert character variable to numeric| new_num=input(character-variable, 4.)';
 title 'PUT:convert numeric variable to char| new_num=put(numeric-variable, 4.0)';
data temp;
x = '12345';
input_x = input(x,5.);
put_x = put(input_x,5.);
run;

title 'LENGTH: returns string length';
data _null_;
x = 12345;
cnt = length(strip(put(x,12.))); 'number of digits in a numeric variable';
cnt_using_log = int(log10(x)) + 1;
put cnt= cnt_using_log=;
run;

title 'IF-then: replace entire phrase';

title 'count(string, "search_str",  [option ]):number of times that a specified substring appears| The "i" modifier ignores case sensitivity ';
title 'countw:number of words in a character string|uses delimiter';
data _null_;
name = "DeepAnshu Bhalla";
x = count(name,"a");
x1 = count(name,"a","i");
put x= x1=;
run;


