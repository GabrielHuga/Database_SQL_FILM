-- create database
create database movie;

-- create tables
create table actor (
	act_id int primary key,
	act_fname varchar,
	act_lname varchar,
	act_gender varchar
);

create table genres (
	gen_id int primary key,
	gen_title varchar
);

create table director (
	dir_id int primary key,
	dir_fname varchar,
	dir_lname varchar
);

create table movie (
	mov_id int primary key,
	mov_title varchar,
	mov_year int,
	mov_time int,
	mov_lang varchar,
	mov_dt_rel date,
	mov_rel_country varchar
);

create table movie_genres (
	mov_id int,
	gen_id int
);

create table movie_direction (
	dir_id int,
	mov_id int
);

create table reviewer (
	rev_id int primary key,
	rev_name varchar
);

create table rating (
	mov_id int,
	rev_id int,
	rev_stars numeric,
	num_o_ratings int
);

create table movie_cast (
	act_id int,
	mov_id int,
	role varchar
);