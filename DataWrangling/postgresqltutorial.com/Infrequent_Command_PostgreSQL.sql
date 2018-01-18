---------
'ABBREVIATIONS': 
    Att  Attribute/Column
    Rel  Table/Relation
    Rec  Record/Row

--------_
 concatenate attributes(columns) in a Postgres SELECT:
     'Whatever the actual data types behind the curtain are, you can "fix" your statement by casting to text.
      Any type can be cast to text:'
          SELECT Att1::text || ', ' || Att2::text AS Att2 FROM Rel1;
    'If NULL values can be involved, use concat_ws() to avoid NULL results for only one ore some NULL arguments '
        SELECT concat_ws(', ', Att1::text, Att2::text) AS Att2 FROM Rel1;
    'Or just concat() if you do not need to add separators:'
        SELECT concat(a::text, b::text) AS ab FROM foo;


--------
'DATE_FORMAT'
    'use the literal date in ISO 8601 format i.e., YYYY-MM-DD    2007-02-07'

---------
'PATTERN_SELECTION'
    PostgreSQL provides two wildcard characters:
       Percent ( %)  for matching any sequence of characters.
       Underscore ( _)  for matching any single character.

------------------------------------------------
SingleLineComments    '--'
------------------------------------------------
LIKE case sensitive
ILIKE case IN_sensitive

    ~~ is equivalent to LIKE
    ~~* is equivalent to ILIKE
    !~~ is equivalent to NOT LIKE
    !~~* is equivalent to NOT ILIKE
------------------------------------------------
auto-increasing value in columns
    category_id int(11) serial
------------------------------------------------
Describing a relation(table)
select column_name, data_type, character_maximum_length
from INFORMATION_SCHEMA.COLUMNS where table_name = '<name of table>';
------------------------------------------------
FILTERS ON GROUP
To filter groups, you use the HAVING clause instead of WHERE clause.