#1. List the teachers who have NULL for their department.

SELECT name
FROM teacher
WHERE dept IS NULL

#3. Use a different JOIN so that all teachers are listed. 

SELECT teacher.name, dept.name
 FROM teacher LEFT OUTER JOIN dept
           ON (teacher.dept=dept.id)

#4. Use a different JOIN so that all departments are listed. 

SELECT teacher.name, dept.name
 FROM teacher RIGHT OUTER JOIN dept
           ON (teacher.dept=dept.id)

#5. Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'

SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher

#6. Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department. 

/**/

SELECT name
FROM actor
JOIN casting ON actor.id=actorid
JOIN movie ON movieid=movie.id
WHERE movieid=11768

#7. Obtain the cast list for the film 'Alien'

SELECT name
FROM actor
JOIN casting ON actor.id=actorid
JOIN movie ON movieid=movie.id
WHERE movie.title='Alien'

#8. List the films in which 'Harrison Ford' has appeared

SELECT title
FROM movie
JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE actor.name='Harrison Ford'

#9. List the films where 'Harrison Ford' has appeared - but not in the starring role

SELECT title
FROM movie
JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE actor.name='Harrison Ford'
AND casting.ord!=1

#10. List the films together with the leading star for all 1962 films.

SELECT movie.title, actor.name
FROM movie
JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE ord=1 AND yr=1962