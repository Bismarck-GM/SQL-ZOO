# SELECT basics

https://sqlzoo.net/wiki/SELECT_basics

#### 1 - Introducing the world table of countries
```
SELECT population FROM world
  WHERE name = 'Germany'
```

#### 2 - Scandinavia

```
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');
```

#### 3 - Just the right size

```
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
```

## Quiz

https://sqlzoo.net/wiki/SELECT_Quiz

#### 1 - 

```
SELECT name, population
  FROM world
 WHERE population BETWEEN 1000000 AND 1250000
```

### 2 -

Table-E

| Albania| Algeria| 
| ------ |--------| 
| 3200000|32900000| 

### 3 -

```
SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l'
```

### 4 -


| name | length(name) |
| -------- | -------- |
| italy     | 5     |
| Malta | 5 |
| Spain     | 5     |

### 5 -

| Andorra | 936 |
| ---- | --- |

### 6 -

```
  FROM world
 WHERE area > 50000 AND population < 10000000
```

### 7 -

```
SELECT name, population/area
  FROM world
 WHERE name IN ('China', 'Nigeria', 'France', 'Australia')
```
