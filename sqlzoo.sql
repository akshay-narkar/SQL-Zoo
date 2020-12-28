
-- Select Queries 

-- Select basic
-- 1
SELECT population FROM world
WHERE name = 'Germany';

-- 2
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

--  3
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

-- Select on World

-- 1
SELECT name, continent, population FROM world;

-- 2
SELECT name FROM world WHERE population >= 200000000;

-- 3
SELECT name, GDP/population
  FROM world
 WHERE population >= 200000000 ;

-- 4
 SELECT name, population/1000000 As Million_Pop
  FROM world
 WHERE continent = 'South America'; 

--  5
SELECT name, population
  FROM world
 WHERE name IN('France','Germany','Italy'); 

--  6
SELECT name
  FROM world
 WHERE name Like '%United%'; 

--  7
SELECT name, population,area
  FROM world
 WHERE population > 250000000 or area > 3000000;

--  8
SELECT name, population,area
  FROM world
 WHERE population > 250000000 XOR area > 3000000;

 --9
 select name,ROUND(population/1000000,2) as Population ,ROUND(GDP/1000000000,2) as GDP
from world
where continent = 'South America';


-- 10
select name, Round(GDP/population,-3)
from world
where GDP > 1000000000000;

--11
SELECT name,capital
  FROM world
 WHERE Length(name)=length(capital);

 --12

 SELECT name, capital
FROM world
where LEFT(name,1) = LEFT(capital,1) and 
name <> capital;

--13
SELECT name
   FROM world
WHERE name LIKE '%a%' and
name LIKE '%e%' and 
name LIKE '%i%' and
name LIKE '%o%' and
name LIKE '%u%'
and 
name not LIKE '% %';


-- nobel 

--1 
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;

--2
 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';

--3
select yr
from nobel 
where winner='Albert Einstein';

--4
select winner 
from nobel 
where subject='Peace'
and yr >= 2000;

--5
select yr,subject,winner
from nobel;

where yr > 1979 and yr < 1990 and subject = 'Literature';

--6
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson','Jimmy Carter','Barack Obama');

--7
SELECT winner FROM nobel
where winner like 'John%';

--8
select * from nobel
where subject = 'Physics' and yr = 1980 
or subject = 'Chemistry' and yr = 1984; 

--9
select * from nobel
where subject NOT IN ('Chemistry','Medicine') and yr = 1980 

--10
select * from nobel
where subject = 'Medicine' and yr < 1910 
or subject = 'Literature' and yr > 2003; 

--11
select * from nobel
where winner = 'PETER GRÜNBERG'; 

--12
select * from nobel
where winner = "EUGENE O\'NEILL";

--13

select winner,yr,subject from nobel
where winner like 'Sir%'
order by yr desc;

--14

SELECT winner, subject FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'),subject,winner;



-- Select tutorial

--1 

SELECT name FROM world
  WHERE population > 
   (select population from world 
     where name = 'Russia')

--2

SELECT name FROM world
  WHERE continent =  'Europe' and
    gdp/population > 
    (select gdp/population from world 
     where name = 'United Kingdom')

--3
select name,continent from world
where continent IN ((select continent from world where name = 'Argentina'),(select continent from world where name = 'Australia'))

order by name 
