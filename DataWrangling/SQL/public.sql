/*
-- Schema: public

-- DROP SCHEMA public;

CREATE SCHEMA public
  AUTHORIZATION postgres;

GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;
COMMENT ON SCHEMA public
  IS 'standard public schema';

create table company(
id       int     primary key, 
name     text    not null,
age      int     not null,
address  CHAR(50) ,
salary   real);
*/
create table department(
id     int         primary key,
dept   char(50)    not null,
emp_id int         not null
);
