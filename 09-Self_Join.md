# Self Join

https://sqlzoo.net/wiki/Self_join

#### 1 - Summary

```sql
SELECT COUNT(name)
FROM stops
```

#### 2 - INNER JOIN misses the teachers with no department

```sql
SELECT id
FROM stops
WHERE stops.name = 'Craiglockhart'
```

#### 3 - Use a different JOIN so that all teachers are listed.

```sql
SELECT id, name
FROM stops 
INNER JOIN route 
ON id = route.stop
WHERE route.num = '4' 
AND route.company = 'LRT'
```

#### 4 - Use a different JOIN so that all departments are listed.

```sql
SELECT company, num, COUNT(*) AS stops
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING stops > 1
```

#### 5 - Using the COALESCE function

```sql
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b 
ON (a.company=b.company AND a.num=b.num)
WHERE a.stop=53
AND b.stop = 149
```

#### 6 - Use the COALESCE function and a LEFT JOIN

```sql
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name = 'London Road'
```

#### 7 - Use COUNT to show the number of teachers and the number of mobile phones.

```sql
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115
AND b.stop = 137
```

#### 8 - Use COUNT and GROUP BY dept.name to show each department and the number of staff. 

```sql
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name = 'Tollcross'
```

#### 9 - Using CASE

```sql
SELECT stopb.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
```

#### 10 - Using CASE II

```sql
SELECT bus1.busnumber AS 'num', bus1.company, bus2.transfer AS 'name', bus2.busnumber AS 'num', bus2.company 
  FROM (SELECT r1.num AS 'busnumber', r1.company AS 'company', r2.stop AS 'stopp' FROM route r1 
  JOIN route r2 ON (r1.num = r2.num AND r1.company = r2.company) JOIN stops s1 ON s1.id = r1.stop
  JOIN stops s2 ON s2.id = r2.stop WHERE s1.name = 'Craiglockhart') bus1
  JOIN
  (SELECT s1.name AS 'transfer', r1.num AS 'busnumber', r1.company AS 'company', r1.stop AS 'stopp', r1.pos AS 'pos' 
  FROM route r1 JOIN route r2 ON (r1.num = r2.num AND r1.company = r2.company) JOIN stops s1 ON s1.id = r1.stop
  JOIN stops s2 ON s2.id = r2.stop WHERE s2.name = 'Lochend') bus2
  ON bus1.stopp = bus2.stopp ORDER BY bus1.busnumber, name, 4
```

# Quiz

https://sqlzoo.net/wiki/Self_join_Quiz

#### 1 - 

```sql
SELECT DISTINCT a.name, b.name
  FROM stops a JOIN route z ON a.id=z.stop
  JOIN route y ON y.num = z.num
  JOIN stops b ON y.stop=b.id
 WHERE a.name='Craiglockhart' AND b.name ='Haymarket'
```

#### 2 -

```sql
SELECT S2.id, S2.name, R2.company, R2.num
  FROM stops S1, stops S2, route R1, route R2
 WHERE S1.name='Haymarket' AND S1.id=R1.stop
   AND R1.company=R2.company AND R1.num=R2.num
   AND R2.stop=S2.id AND R2.num='2A'
```

#### 3 -

```sql
SELECT a.company, a.num, stopa.name, stopb.name
  FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
 WHERE stopa.name='Tollcross'
```
