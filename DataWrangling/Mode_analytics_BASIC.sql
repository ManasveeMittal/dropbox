
SELECT *
  FROM tutorial.us_housing_units
  
SELECT year,
       month,
       west
FROM tutorial.us_housing_units

SELECT *
  FROM tutorial.us_housing_units
 LIMIT 15;
 
 SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name != 'January'
 
 SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name > 'January'
 
 SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name = 'February'
 
  SELECT distinct(month_name)
  FROM tutorial.us_housing_units
 WHERE month_name <= 'O'
 
 SELECT year,
       month,
       west,
       south,
       west + south AS south_plus_west
  FROM tutorial.us_housing_units

 
 SELECT south+west+midwest+northeast AS all_regions
  FROM tutorial.us_housing_units
 
 SELECT *
  FROM tutorial.us_housing_units
  where west>midwest+northeast
 
SELECT year,
       month,
       west/(west + south + midwest + northeast)*100 AS west_pct,
       south/(west + south + midwest + northeast)*100 AS south_pct,
       midwest/(west + south + midwest + northeast)*100 AS midwest_pct,
       northeast/(west + south + midwest + northeast)*100 AS northeast_pct
  FROM tutorial.us_housing_units
 WHERE year >= 2000
 
 select * from
 tutorial.us_housing_units  where
 west > 50
 
  select * from
 tutorial.us_housing_units  where
 south <= 20
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 ORDER BY year DESC, year_rank
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE '%Ludacris%'
 
  SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" LIKE 'DJ%'
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist IN ('Taylor Swift', 'Usher', 'Ludacris')
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" IN ('M.C. Hammer', 'Hammer', 'Elvis Presley')
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank BETWEEN 5 AND 10
 
  SELECT count(*)
  FROM tutorial.billboard_top_100_year_end
   WHERE year_rank<= 100
   and year between 1985 and 1990
  
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist IS NULL
 
  
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE song_name IS NULl
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2012
   AND year_rank <= 10
   AND "group" ILIKE '%feat%'

  SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 10
   AND "group" ILIKE '%ludacris%'
   
     SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank =1
 and year in(1999,2000,2010)
  
     SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE song_name ilike '%love%'
 and year between 1960 and 1969;
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND ("group" ILIKE '%macklemore%' OR "group" ILIKE '%timberlake%')
   
    SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 10 
    AND ("group" ILIKE '%Katy Perry%' OR "group" ILIKE '%Bon Jovi%')
 
     SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE song_name ilike '%California%'
    AND ((year between 1990 and 1999) or (year between 1970 and 1979))

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE '%dr. dre%'
   AND (year <= 2000 OR year >= 2010)
   
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE song_name not ILIKE '%a%'
   AND year=2013

   
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year=2012 
 order by song_name desc;
 
    
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year=2010
 order by year_rank, artist;
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year in (1193,2003,2013) and --select rows only for years 
  year_rank between 10 and 20 -- select rows for songs that ranked between 10 and 20
 order by year,year_rank;

 
 
 
 
 
 

 
 
 
 
 
 
 
 
 
 