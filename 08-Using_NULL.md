# Using Null

https://sqlzoo.net/wiki/Using_Null

#### 1 - NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN

```sql
SELECT name
FROM teacher
WHERE dept IS NULL
```

#### 2 - INNER JOIN misses the teachers with no department

```sql
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)
```

#### 3 - Use a different JOIN so that all teachers are listed.

```sql
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)
```

#### 4 - Use a different JOIN so that all departments are listed.

```sql
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)
```

#### 5 - Using the COALESCE function

```sql
SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher
```

#### 6 - Use the COALESCE function and a LEFT JOIN

```sql
SELECT teacher.name, COALESCE(dept.name, 'None')
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)
```

#### 7 - Use COUNT to show the number of teachers and the number of mobile phones.

```sql
SELECT COUNT(name), COUNT(mobile)
FROM teacher
```

#### 8 - Use COUNT and GROUP BY dept.name to show each department and the number of staff. 

```sql
SELECT dept.name, COUNT(teacher.name)
FROM teacher RIGHT JOIN dept ON teacher.dept=dept.id
GROUP BY dept.name
```

#### 9 - Using CASE

```sql
SELECT name, CASE 
WHEN dept = 1 OR dept = 2
THEN "Sci"
ELSE "Art"
END
FROM teacher

```

#### 10 - Using CASE II

```sql
SELECT name, CASE 
WHEN dept = 1 OR dept = 2
THEN "Sci"
WHEN dept = 3
THEN "Art"
ELSE "None"
END
FROM teacher
```

# Quiz

https://sqlzoo.net/wiki/Using_Null_Quiz

#### 1 - 

```sql
SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id)
```

#### 2 -

```sql
 SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower'

```

#### 3 -

```sql
 SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name

```

#### 4 -

```sql
display 0 in result column for all teachers without department
```

#### 5 -

	* 'four' for Throd

#### 6 -

Table-A
|Shrivell |	Computing|
|- |	-|
|Throd |	Computing|
|Splint	| Computing|
|Spiregrain |	Other|
|Cutflower |	Other|
|Deadyawn |	Other|
