# More JOIN operations

https://sqlzoo.net/wiki/More_JOIN_operations

#### 1 - 1962 movies

```sql
SELECT id, title
 FROM movie
 WHERE yr=1962
```

#### 2 - When was Citizen Kane released?

```sql
SELECT yr
FROM movie
WHERE title LIKE "CITIZEN%"
```

#### 3 - Star Trek movies

```sql
SELECT id, title, yr
FROM movie 
WHERE title LIKE "%star trek%"
ORDER BY yr
```

#### 4 - id for actor Glenn Close

```sql
SELECT id
FROM actor
WHERE name LIKE "Glenn Close"
```

#### 5 - id for Casablanca

```sql
SELECT id
FROM movie
WHERE title LIKE "casabl%"
```

#### 6 - Cast list for Casablanca

```sql
SELECT name
FROM movie
JOIN casting ON id=movieid
JOIN actor ON casting.actorid=actor.id
WHERE movie.title LIKE "CASABLANCA"
```

#### 7 - Alien cast list

```sql
SELECT name
FROM movie
JOIN casting ON id=movieid
JOIN actor ON casting.actorid=actor.id
WHERE movie.title LIKE "ALIEN"
```

#### 8 - Harrison Ford movies

```sql
SELECT title
FROM movie
JOIN casting ON id=movieid
JOIN actor ON casting.actorid=actor.id
WHERE actor.name LIKE "HARRISON FORD"
```

#### 9 - Harrison Ford as a supporting actor

```sql
SELECT title
FROM movie
JOIN casting ON id=movieid
JOIN actor ON casting.actorid=actor.id
WHERE actor.name LIKE "HARRISON FORD" AND casting.ord > 1
```

#### 10 - Lead actors in 1962 movies

```sql
SELECT title, actor.name
FROM movie
JOIN casting ON id=movieid
JOIN actor ON casting.actorid=actor.id
WHERE yr=1962 AND casting.ord = 1
```

#### 11 - Busy years for Rock Hudson

```sql
SELECT yr,COUNT(title) 
FROM movie 
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE name='ROCK HUDSON'
GROUP BY yr
HAVING COUNT(title) > 2
```

#### 12 - Lead actor in Julie Andrews movies

```sql
SELECT title,name
FROM movie JOIN casting ON (movieid=movie.id AND ord=1)
JOIN actor ON (actorid=actor.id)
WHERE movie.id IN (
SELECT movieid FROM casting
WHERE actorid IN (
SELECT id FROM actor
WHERE name='JULIE ANDREWS'))
```

#### 13 - Actors with 15 leading roles

```sql
SELECT name
FROM casting
JOIN actor ON actor.id = casting.actorid
WHERE ord = 1
GROUP BY name
HAVING sum(ord) >= 15
ORDER BY name
```

#### 14 - List the films released in the year 1978 ordered by the number of actors in the cast, then by title.

```sql
SELECT title, COUNT(actorid)
FROM movie
JOIN casting ON  id=movieid
JOIN actor ON actor.id=casting.actorid
WHERE yr=1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title 
```


#### 15 - List all the people who have worked with 'Art Garfunkel'.

```sql
SELECT name
FROM movie
JOIN casting ON (movieid=movie.id)
JOIN actor ON actor.id=casting.actorid
WHERE movie.title IN (SELECT title
FROM movie 
JOIN casting ON (movieid=movie.id)
JOIN actor ON actor.id=casting.actorid
WHERE name = 'Art Garfunkel')
AND
actor.name !='Art Garfunkel'
```
# Quiz

https://sqlzoo.net/wiki/JOIN_Quiz_2

#### 1 - 

```sql
SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
 WHERE gross < budget
```

#### 2 -

```sql
SELECT *
  FROM actor JOIN casting ON actor.id = actorid
  JOIN movie ON movie.id = movieid
```

#### 3 -

```sql
SELECT name, COUNT(movieid)
  FROM casting JOIN actor ON actorid=actor.id
 WHERE name LIKE 'John %'
 GROUP BY name ORDER BY 2 DESC
```

#### 4 -

|"Crocodile" Dundee|
|-|
|Crocodile Dundee in Los Angeles|
|Flipper|
|Lightning Jack|

#### 5 -

```sql
SELECT name
  FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351
```

#### 6 -

* link the director column in movies with the primary key in actor
* connect the primary keys of movie and actor via the casting table

#### 7 -

| A Bronx Tale	| 1993 |
| ------| - |
| Bang the Drum Slowly	| 1973 |
| Limitless	| 2011|
