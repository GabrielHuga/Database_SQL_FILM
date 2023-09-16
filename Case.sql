-- 1. Find movie title that start with the word ‘The’
-- 2. Find movies’ title that directed by James Cameron (recommended output: director name, movie title)
-- 3. List all first name of actor and director (only one column, no redundancy, and sorted alphabetically)
-- 4. Find how many Mystery, Drama, and Adventure movies in the movie table (recommended output: genre title, number of movies)
-- 5. Label the duration with this rule:
-- 	mov_time < 100 = short movie
-- 	mov_time > 130 = long movie
-- 	mov_time between 100 and 130 = normal movie
-- Then, count the movies of each label (recommended output: label duration, number of movies)


-- Nomor 1
select * from movie m where mov_title like 'The%';


-- Nomor 2
select concat(dir_fname,' ',dir_lname) as Director_Name, mov_title as Movie_Title
from director d
join movie_direction md on md.dir_id = d.dir_id
join movie m on m.mov_id = md.mov_id
where dir_fname in ('James') and dir_lname in ('Cameron');


-- Nomor 3
SELECT DISTINCT act_fname FROM (
    SELECT act_fname FROM actor
    UNION ALL
    SELECT dir_fname FROM director
) AS combined_names
ORDER BY act_fname ASC;

--atau (3b) 
with actor_director_names as (
    select concat (a.act_fname, ' : ', d.dir_fname) as first_name_of_Act_and_Dir
    from actor a
    join movie_cast mc on mc.act_id = a.act_id
    join movie m on m.mov_id = mc.mov_id
    join movie_direction md on md.mov_id = m.mov_id
    join director d on d.dir_id = md.dir_id
)
select distinct first_name_of_Act_and_Dir
from actor_director_names
order by first_name_of_Act_and_Dir;


-- Nomor 4
SELECT g.gen_title as genre_title, COUNT(*) as number_of_movies
FROM movie m
JOIN movie_genres mg ON m.mov_id = mg.mov_id
JOIN genres g ON mg.gen_id = g.gen_id
WHERE g.gen_title IN ('Mystery', 'Drama', 'Adventure')
GROUP BY g.gen_title;



-- Nomor 5 
select
    case
        when mov_time < 100 then 'Short Movie'
        when mov_time > 130 then 'Long Movie'
        else 'Normal Movie'
        end as label_duration,
        count(*) as number_of_movies
from
    movie
group by
    label_duration;