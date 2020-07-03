# SUM and COUNT

https://sqlzoo.net/wiki/SUM_and_COUNT

#### 1 - Total world population

```sql
SELECT SUM(population)
FROM world
```

#### 2 - List of continents

```sql
SELECT DISTINCT continent
FROM world
```

#### 3 - GDP of Africa

```sql
SELECT SUM(gdp)
FROM world
WHERE continent LIKE 'Africa'
```

#### 4 - Count the big countries

```sql
SELECT COUNT(name)
FROM world
WHERE area >= 1000000
```

#### 5 - Baltic states population

```sql
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')
```

#### 6 - Counting the countries of each continent

```sql
SELECT continent, COUNT(name)
FROM world
GROUP BY continent

```

#### 7 - Counting big countries in each continent

```sql
SELECT continent, COUNT(name)
FROM world
WHERE population > 10000000
GROUP BY continent
```

#### 8 - Counting big continents

```sql
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) > 100000000

```

# Quiz

https://sqlzoo.net/wiki/SUM_and_COUNT_Quiz

#### 1 - 

```sql
 SELECT SUM(population) FROM bbc WHERE region = 'Europe'
```

### 2 -

```sql
 SELECT COUNT(name) FROM bbc WHERE population < 150000
```

### 3 -

```sql
AVG(), COUNT(), MAX(), MIN(), SUM()
```

### 4 -

```sql
No result due to invalid use of the WHERE function
```

### 5 -

```sql
SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')
```

### 6 -

```sql
 SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region
```
### 7 - 

```sql
 SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)
 ```
 
### 8 -

| Americas| 732240 |
| ------| - |
| Middle East	| 13403102 |
| South America	| 17740392|
| South Asia		| 9437710 |
