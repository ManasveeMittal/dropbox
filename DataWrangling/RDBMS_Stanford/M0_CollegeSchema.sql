drop table if exists College;
drop table if exists Student;
drop table if exists Apply;

create table College(cName text, state text, enrollment int);
create table Student(sID int, sName text, GPA real, sizeHS int);
create table Apply(sID int, cName text, major text, decision text);


/*
drop table if exists College;
drop table if exists Student;
drop table if exists Apply;

create table College(cName text PRIMARY KEY,
 state text NOT NULL, 
 enrollment int NOT NULL);
 
create table Student(
sID int PRIMARY KEY,
 sName text  NOT NULL,
  GPA real, 
  sizeHS int);
  
create table Apply(
 sID int ,
 cName text, 
 major text ,
 decision text DEFAULT 'UNHDECIDED',
PRIMARY KEY (sID, cName, major));
*/
