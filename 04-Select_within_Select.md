# SELECT within SELECT Tutorial

https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial

#### 1 - Bigger than Russia
```sql
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
```

#### 2 - Richer than UK

```sql
SELECT name
FROM world
WHERE gdp/population > (
	SELECT gdp/population 
	FROM world 
	WHERE name = 'United kingdom'
	) 
	AND continent LIKE 'Europe';
```

#### 3 - Neighbours of Argentina and Australia

```sql
SELECT name, continent
FROM world
WHERE continent IN (SELECT DISTINCT continent FROM world
                   WHERE name IN ('Argentina', 'Australia'))
ORDER BY name
```

#### 4 - Between Canada and Poland

```sql
SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name LIKE 'CANADA') 
AND population < (SELECT population FROM world WHERE name LIKE 'POLAND');
```

#### 5 - Percentages of Germany
```sql
SELECT name, CONCAT(
             ROUND(population / (
                                 SELECT population FROM world WHERE name = 'Germany'
                                ) * 100
             ), '%')
 as percentage
  FROM world
  WHERE continent = 'Europe'
```

#### 6 - Bigger than every country in Europe

```sql
SELECT name
FROM world
WHERE gdp > ALL(SELECT gdp FROM world WHERE gdp > 0 AND continent = 'europe')
```

#### 7 - Largest in each continent

```sql
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)
```

#### 8 - First country of each continent (alphabetically)

```sql
SELECT continent, name
FROM world x
 WHERE name = (SELECT name FROM world y
    WHERE x.continent = y.continent  ORDER BY name LIMIT 1)
```
#### 9 - Difficult Questions That Utilize Techniques Not Covered In Prior Sections

```sql
SELECT name, continent, population
FROM world x
WHERE 25000000 >= ALL(SELECT population
FROM world y
WHERE y.continent = x.continent)
```
#### 10 - Difficult Questions That Utilize Techniques Not Covered In Prior Sections II

```sql
SELECT name, continent
FROM world x
WHERE population > ALL(SELECT (3 * population)
FROM world y
WHERE y.continent = x.continent AND x.name <> y.name)
```

# Quiz

https://sqlzoo.net/wiki/Nested_SELECT_Quiz

#### 1 - 

```sql
 SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0)
```

### 2 -

```sql
 SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)
```

### 3 -

```sql
SELECT name, region FROM bbc x
 WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)
```

### 4 -

| France|
| -------- |
| Germany | 
| Russia | 
| Turkey | 

### 5 -

```sql
SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')
```

### 6 -

```sql
SELECT name FROM bbc
 WHERE population < (SELECT population FROM bbc WHERE name='Russia')
   AND population > (SELECT population FROM bbc WHERE name='Denmark')
```

### 7 -

| Bangladesh|
| ------|
| India|
| Pakistan|
