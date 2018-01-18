--A1
select distinct name 
from Reviewer, Rating, Movie
where Reviewer.rid = Rating.rid
    and  Movie.mid = rating.mid
    and Movie.title = 'Gone with the Wind';

--Q2
--    For any rating where the reviewer is the same as the director of the 
--    movie, return the reviewer name, movie title, and number of stars.
--A2
select distinct name, title, stars 
from Reviewer, Rating, Movie
where Reviewer.rid = Rating.rid
    and  Movie.mid = rating.mid
    and Movie.director = Reviewer.name;

--Q3
--Return all reviewer names and movie names  together in a single list, alphabetized.
--A3
  select name 
from Reviewer, Rating, Movie
union
  select title 
from Reviewer, Rating, Movie;

--Q4
--Find the titles of all movies not reviewed by Chris Jackson
--A4
Select distinct title
from Reviewer, Rating, Movie
where Reviewer.rid = Rating.rid
    and  Movie.mid = rating.mid
    and Reviewer.name <> 'Chris Jackson';


--Q5
--For all pairs of reviewers such that both reviewers gave a rating to the same movie,
--return the names of both reviewers. Eliminate duplicates, don't pair reviewers with
--themselves, and include each pair only once. For each pair, return the names in the
--pair in alphabetical order
--A5
Select  distinct Rr1.name as name1, Rr2.name as name2
from Reviewer Rr1,Reviewer Rr2, Movie Me1, Rating Rg1
where Rr1.rId < Rr2.rId 
    and Rr1.rid = Rg1.rid
    and Me1.mid = Rg1.mid 
    --and Rr2.rid = Rg1.rid
order by name1, name2;

Select  distinct Rr1.name as name1, Rr2.name as name2
from Reviewer Rr1,Reviewer Rr2
where Rr1.rId < Rr2.rId
order by name1, name2;

Select * from Rating
whwre Rg1.mid = Rg2.mid and 
  Rg1.rid <> Rg2.rId;


His full title is a mouthful: His Holiness Francis, Bishop of Rome, Vicar of Jesus Christ, Successor of the Prince of the Apostles, Supreme Pontiff of the Universal Church, Primate of Italy, Archbishop and Metropolitan of the Roman Province, Sovereign of the Vatican City State, Servant of the servants of God.
