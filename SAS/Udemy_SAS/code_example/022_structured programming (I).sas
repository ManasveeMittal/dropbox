/*****if statements*****/
/*first input the following data**/

Data my_friends;
  length name $15.;
  Input name $ @@;
Datalines;
Kent John Rita Larry Gary Mike Kevin Lora
;
Run;

Data hot;
 Set my_friends;
 If name in ('Rita', 'Gary') then do;
    hot = 1;
    If name = 'Rita' then available = 1;
  End;
  Else do;
      hot = 0;  available = 0;
 End;
 Label hot = '1-friend is hot'
 available = '1-friend is available';
Run;


DATA available_and_hot;
  set hot;
  if hot=1 and available=1;
RUN;


DATA available_nomissing;
  set hot;
  if available=. then delete;
RUN;


DATA available_or_hot;
  set hot;
  if hot=1 or available=1 or _n_=1;
RUN;
