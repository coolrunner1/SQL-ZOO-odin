#1. Modify it to show the matchid and player name for all goals scored by Germany.

SELECT matchid, player FROM goal
  WHERE teamid='GER'


#2. Show id, stadium, team1, team2 for just game 1012

SELECT id,stadium,team1,team2
  FROM game
WHERE id=1012

#3. Modify it to show the player, teamid, stadium and mdate for every German goal.

SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid="GER"

#4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'

SELECT team1, team2, player
FROM game
JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'

/*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/

#5. Find the countries that start with C and end with ia

SELECT name FROM world
  WHERE name LIKE 'C%' AND name LIKE "%ia"

#6. Find the country that has oo in the name

SELECT name FROM world
  WHERE name LIKE '%oo%'

#7. Find the countries that have three or more a in the name

SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

#8. Find the countries that have "t" as the second character.

SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

#9. Find the countries that have two "o" characters separated by two others.

SELECT name FROM world
 WHERE name LIKE '%o__o%'

#10. Find the countries that have exactly four characters.

SELECT name FROM world
 WHERE name LIKE '____'

#11. Find the country where the name is the capital city.

SELECT name
  FROM world
 WHERE name = capital

#12. Find the country where the capital is the country plus "City".

SELECT name
  FROM world
 WHERE concat(name, ' City') = capital

#13. Find the capital and the name where the capital includes the name of the country.

SELECT capital, name
 FROM world
WHERE capital LIKE concat('%', name, '%')

#14. Find the capital and the name where the capital is an extension of name of the country.

SELECT capital, name
  FROM world
WHERE capital LIKE concat(name, "_%")

#15. Show the name and the extension where the capital is a proper (non-empty) extension of name of the country.

SELECT name, REPLACE (capital, name, '')
  FROM world
WHERE capital LIKE concat(name, "_%")
