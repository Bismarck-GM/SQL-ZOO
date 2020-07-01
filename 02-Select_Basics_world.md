# SELECT basics World

https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial

#### 1 - Introduction
```
SELECT name, continent, population FROM world
```

#### 2 - Large Countries

```
SELECT name FROM world
WHERE population > 200000000
```

#### 3 - Per capita GDP

```
SELECT name, (gdp/population) AS per_capita_GDP
FROM world
WHERE population > 200000000
```

#### 4 - South America In millions

```
SELECT name, (population/1000000) AS pop_in_mill
FROM world
WHERE continent LIKE 'South America';
```

#### 5 - France, Germany, Italy
```
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');
```

#### 6 - United

```
SELECT name
FROM world
WHERE name LIKE "%united%";
```

#### 7 - Two ways to be big

```
SELECT name, population, area
FROM world
WHERE area >= 3000000 OR population >= 250000000;
```

#### 8 - One or the other (but not both)

```
SELECT name, population, area
FROM world
WHERE area >= 3000000 XOR population >= 250000000;
```
#### 9 - Rounding

```
SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2)
FROM world
WHERE continent LIKE 'South America';
```
#### 10 - Trillion dollar economies

```
SELECT name, ROUND(gdp/population, -3) AS per_capita_gdp
FROM world
WHERE gdp >= 1000000000000;
```
#### 11 - Name and capital have the same length

```
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital);
```

#### 12 - Matching name and capital

```
SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital;
```

#### 13 - All the vowels

```
SELECT name
   FROM world
WHERE (
  name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
) AND name NOT LIKE '% %';
```


# Quiz

https://sqlzoo.net/wiki/BBC_QUIZ

#### 1 - 

```
SELECT name
  FROM world
 WHERE name LIKE 'U%'
```

### 2 -

```
SELECT population
  FROM world
 WHERE name = 'United Kingdom'
```

### 3 -

```
'name' should be name
```

### 4 -

| Naru     | 990     |
| -------- | -------- |

### 5 -

```
SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia')
```

### 6 -

```
SELECT name FROM world
 WHERE name IN ('Cuba', 'Togo')
```

### 7 -

| Brazil|
| ------|
| Colombia|
