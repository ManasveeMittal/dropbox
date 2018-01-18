/* Delete the tables if they already exist */
drop table if exists Movie;
drop table if exists Reviewer;
drop table if exists Rating;

/* Create the schema for our tables */
create table Movie(mID int, title text, year int, director text);
create table Reviewer(rID int, name text);
create table Rating(rID int, mID int, stars int, ratingDate date);

/*

create table Movie(
mID integer PRIMARY KEY,
title text NOT NULL,
year INTEGER4 NOT NULL,
director varchar );

create table Review(
rID integer Primary key,
name text );

create table Rating(
rID integer,
mID	integer,
stars integer1
ratingDate  date DEFAULT CURDATE(),
PRIMARY KEY(rID, mID),
);
*/

/* Populate the tables with our data */
insert into Movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into Movie values(102, 'Star Wars', 1977, 'George Lucas');
insert into Movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into Movie values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into Movie values(105, 'Titanic', 1997, 'James Cameron');
insert into Movie values(106, 'Snow White', 1937, null);
insert into Movie values(107, 'Avatar', 2009, 'James Cameron');
insert into Movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

insert into Reviewer values(201, 'Sarah Martinez');
insert into Reviewer values(202, 'Daniel Lewis');
insert into Reviewer values(203, 'Brittany Harris');
insert into Reviewer values(204, 'Mike Anderson');
insert into Reviewer values(205, 'Chris Jackson');
insert into Reviewer values(206, 'Elizabeth Thomas');
insert into Reviewer values(207, 'James Cameron');
insert into Reviewer values(208, 'Ashley White');

insert into Rating values(201, 101, 2, '2011-01-22');
insert into Rating values(201, 101, 4, '2011-01-27');
insert into Rating values(202, 106, 4, null);
insert into Rating values(203, 103, 2, '2011-01-20');
insert into Rating values(203, 108, 4, '2011-01-12');
insert into Rating values(203, 108, 2, '2011-01-30');
insert into Rating values(204, 101, 3, '2011-01-09');
insert into Rating values(205, 103, 3, '2011-01-27');
insert into Rating values(205, 104, 2, '2011-01-22');
insert into Rating values(205, 108, 4, null);
insert into Rating values(206, 107, 3, '2011-01-15');
insert into Rating values(206, 106, 5, '2011-01-19');
insert into Rating values(207, 107, 5, '2011-01-20');
insert into Rating values(208, 104, 3, '2011-01-02');

-----ANSWER1-----
	select title from Movie where director = 'Steven Spielberg';
-----ANSWER2-----
Select distinct M.year from 
Rating R , Movie M
where R.mid = M.mid and R.stars in (4,5)
order by  year asc;
-----ANSWER3-----
Select M.title
from Rating R, Movie m
where R.mid = M.mid and R.starts <1
-----ANSWER4-----
Select R.name
from Reviewer R
where R.rID in (select rID from Rating where ratingDate is null);
-----ANSWER4-----

select Rr.name, Me.title, Rg.stars, Rg.ratingDate
from Rating Rg, Movie Me, Reviewer Rr
where Rg.mID = Me.mID and Rg.rID = Rr.rID
order by name, title, stars;
--------------------
 Q6
(1 point possible)
For all cases where the same reviewer rated the same movie twice and gave it 
a higher rating the second time, return the reviewer name and the title of 
the movie. 
A6


select Rr.name, Me.title, 
from Rating Rg, Movie Me, Reviewer Rr
where Rg.mID = Me.mID and
 Rg.rID = Rr.rID;
