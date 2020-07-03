# The JOIN operation

https://sqlzoo.net/wiki/The_JOIN_operation

#### 1 - 

```sql
SELECT * FROM goal 
  WHERE player LIKE '%Bender'
```

#### 2 - 

```sql
SELECT id,stadium,team1,team2
  FROM game
```

#### 3 - 

```sql
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id = matchid) WHERE teamid = 'GER'
```

#### 4 - 

```sql
SELECT team1, team2, player FROM goal
  JOIN game ON (id = matchid)
  WHERE player LIKE 'Mario%'
```

#### 5 - 

```sql
SELECT player, teamid, coach, gtime FROM goal
  JOIN eteam ON teamid = id
  WHERE gtime <= 10
```

#### 6 - 

```sql
SELECT mdate, teamname FROM eteam
  JOIN game ON (eteam.id = game.team1)
  WHERE coach = 'Fernando Santos'
```

#### 7 - 

```sql
SELECT player FROM game
  JOIN goal ON (matchid = id)
  WHERE stadium LIKE '%Warsaw'
```

#### 8 - 

```sql
SELECT DISTINCT player FROM goal
  JOIN game ON (id = matchid)
  WHERE (team1 = 'GER' OR team2 = 'GER')
    AND teamid != 'GER'
```

#### 9 - 

```sql
SELECT teamname, COUNT(*) as goals FROM eteam
  JOIN goal ON id=teamid
  GROUP BY teamid
  ORDER BY teamname
```

#### 10 - 

```sql
SELECT stadium, COUNT(*) as goals FROM game
  JOIN goal ON id = matchid
  GROUP BY stadium
```

#### 11 - 

```sql
SELECT matchid, mdate, COUNT(*) FROM game
  JOIN goal ON matchid = id 
  WHERE (team1 = 'POL' OR team2 = 'POL')
  GROUP BY matchid
```

#### 12 - 

```sql
SELECT matchid, mdate, COUNT(*) FROM game
  JOIN goal ON matchid = id 
  WHERE teamid = 'GER'
  GROUP BY matchid
```

#### 13 - 

```sql
SELECT
  mdate,
  team1,
  SUM
(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) as score1,
  team2,
  SUM
(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) as score2

  FROM game

  LEFT JOIN goal ON matchid = id
  GROUP BY game.id
  ORDER BY mdate, matchid
```

# Quiz

https://sqlzoo.net/wiki/JOIN_Quiz

#### 1 - 

```sql
game  JOIN goal ON (id=matchid)
```

### 2 -

```sql
matchid, teamid, player, gtime, id, teamname, coach
```

### 3 -

```sql
SELECT player, teamid, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = "GRE" OR team2 = "GRE")
   AND teamid != 'GRE'
 GROUP BY player, teamid
```

### 4 -

|DEN|9 June 2012|
|-|-|
|GER|9 June 2012|

### 5 -

```sql
  SELECT DISTINCT player, teamid 
   FROM game JOIN goal ON matchid = id 
  WHERE stadium = 'National Stadium, Warsaw' 
 AND (team1 = 'POL' OR team2 = 'POL')
   AND teamid != 'POL'
```

### 6 -

```sql
SELECT DISTINCT player, teamid, gtime
  FROM game JOIN goal ON matchid = id
 WHERE stadium = 'Stadion Miejski (Wroclaw)'
   AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))
```

### 7 -

| Netherlands| 2 |
| ------| - |
| Poland	| 2 |
| Republic of Ireland	| 1|
| Ukraine		| 2 |
