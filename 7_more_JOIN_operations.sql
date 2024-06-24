#2. Give year of 'Citizen Kane'.

SELECT yr
FROM movie
WHERE title='Citizen Kane'

#3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.

SELECT id, title, yr
FROM movie
WHERE title LIKE "Star Trek%"
ORDER BY yr

#4. What id number does the actor 'Glenn Close' have?

/**/

SELECT team1, team2, player
FROM game
JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'

#5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10

SELECT player, teamid, coach, gtime
  FROM goal
JOIN eteam ON (teamid=id)
 WHERE gtime<=10

#6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

SELECT mdate, teamname
FROM game
JOIN goal ON (game.id=matchid)
JOIN eteam ON (teamid=eteam.id)
WHERE team1=teamid AND coach='Fernando Santos'

#7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

SELECT player
FROM goal
JOIN game ON (id=matchid)
WHERE stadium='National Stadium, Warsaw'

#8. Instead show the name of all players who scored a goal against Germany.

SELECT DISTINCT player
  FROM goal JOIN game ON id = matchid
    WHERE (team1='GER' OR team2='GER') AND goal.teamid<>'GER'

#9. Show teamname and the total number of goals scored.

SELECT teamname, COUNT(*)
  FROM goal JOIN eteam ON teamid=id
GROUP BY teamid
 ORDER BY teamname


#10. Show the stadium and the number of goals scored in each stadium.

SELECT stadium, COUNT(*)
  FROM goal JOIN game ON matchid=id
GROUP BY stadium

#11. For every match involving 'POL', show the matchid, date and the number of goals scored.

SELECT matchid, mdate, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid

#12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

SELECT matchid, mdate, COUNT(*)
FROM game
JOIN goal ON matchid=id
WHERE teamid='GER'
GROUP BY matchid

#13. List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.

SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate, matchid, team1, team2
ORDER BY mdate, matchid, team1, team2


#14. Find the capital and the name where the capital is an extension of name of the country.

SELECT capital, name
  FROM world
WHERE capital LIKE concat(name, "_%")

#15. Show the name and the extension where the capital is a proper (non-empty) extension of name of the country.

SELECT name, REPLACE (capital, name, '')
  FROM world
WHERE capital LIKE concat(name, "_%")

