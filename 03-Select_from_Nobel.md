# SELECT from Nobel Tutorial

https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial

#### 1 - Winners from 1950
```sql
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
```

#### 2 - 1962 Literature

```sql
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'literature'
```

#### 3 - Albert Einstein

```sql
SELECT yr, subject
FROM nobel
WHERE winner LIKE 'Albert Einstein';
```

#### 4 - Recent Peace Prizes

```sql
SELECT winner
FROM nobel
WHERE yr >= 2000
AND subject LIKE 'peace';
```

#### 5 - Literature in the 1980's
```sql
SELECT yr, subject, winner
FROM nobel
WHERE yr BETWEEN 1980 AND 1989
AND subject LIKE 'literature';
```

#### 6 - Only Presidents

```sql
SELECT * FROM nobel
 WHERE winner IN ('theodore roosevelt', 'woodrow wilson', 'jimmy carter', 'barack obama');
```

#### 7 - John

```sql
SELECT winner 
FROM nobel
WHERE winner LIKE 'John%';
```

#### 8 - Chemistry and Physics from different years

```sql
SELECT yr, subject, winner FROM nobel
  WHERE (yr = 1980 AND subject = 'Physics')
  OR (yr = 1984 AND subject = 'Chemistry')
```
#### 9 - Exclude Chemists and Medics

```sql
SELECT * FROM nobel
WHERE yr = 1980
AND subject NOT IN ('chemistry', 'medicine');
```
#### 10 - Early Medicine, Late Literature

```sql
SELECT * FROM nobel
WHERE (yr < 1910 AND subject LIKE 'medicine')
OR (subject LIKE 'literature' AND yr >= 2004);
```
#### 11 - Umlaut

```sql
SELECT * FROM nobel
WHERE winner LIKE 'Peter gr%';
```

#### 12 - Apostrophe

```sql
SELECT * FROM nobel
WHERE winner LIKE 'Eugene o%';
```

#### 13 - Knights of the realm

```sql
SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'Sir %'
ORDER BY yr DESC;
```

#### 14 - Chemistry and Physics last

```sql
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('physics', 'chemistry'), subject,winner
```

# Quiz

https://sqlzoo.net/wiki/Nobel_Quiz

#### 1 - 

```sql
SELECT winner FROM nobel
 WHERE winner LIKE 'C%' AND winner LIKE '%n'
```

### 2 -

```sql
SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960
```

### 3 -

```sql
SELECT COUNT(DISTINCT yr) FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')
```

### 4 -

| Medicine| Sir John Eccles  |
| -------- | -------- |
| Medicine | Sir Frank Macfarlane Burnet |

### 5 -

```sql
SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'))
```

### 6 -

```sql
SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')
```

### 7 -

| Chemistry| 1 |
| ------| - |
| Literature| 1|
| Medicine| 2 |
| Peace | 1 |
| Physics| 1|
