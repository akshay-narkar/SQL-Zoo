
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
     where name = 'Russia');

--2

SELECT name FROM world
  WHERE continent =  'Europe' and
    gdp/population > 
    (select gdp/population from world 
     where name = 'United Kingdom');

--3
select name,continent from world
where continent IN ((select continent from world where name = 'Argentina'),(select continent from world where name = 'Australia'));

order by name 

-- 4
select name, population from world
where population > (select population from world where name = 'Canada') AND population < (select population from world where name = 'Poland');

--5 

select name, Concat(Round(population/(select population from world where name = 'Germany')*100,0),'%') AS '%_pop' from world
where continent = 'Europe' ;

--6
select name from world where gdp > (select max(gdp) from world where continent = 'Europe') ;

--7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0);


--8
select distinct continent,name from world x
where name = (select name 
from world y 
where y.continent = x.continent
order by name
limit 1) ;

--9 
select name, continent, population from world x
where 25000000> ALL(select population from world y where y.continent = x.continent);

--10
select name, continent from world x
where population>=ALL(select population*3 from world y where y.continent = x.continent and population > 0 and y.name != x.name);


--SUM AND COUNT

--1 

SELECT SUM(population)
FROM worldl

--2 

select distinct continent from world;

--3
select sum(GDP) from world 
where continent = 'Africa';

--4 
select count(name) from world 
where area >= 1000000 ;

--5
select sum(population) from world 
where name IN  ('Estonia', 'Latvia', 'Lithuania') 

--6
select continent, count(*) from world
group by continent;

--7
select continent, count(name) from world
where population >= 10000000
group by continent;

--8
select continent from world
group by continent
having SUM(population)>100000000;

--JOIN and euros
--1

SELECT matchid,player FROM goal 
  WHERE teamid='GER'

  --2
  SELECT id,stadium,team1,team2
  FROM game
where id = 1012;

--3
SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid)
where teamid='GER';

--4
select team1,team2,player from game
join goal on (id=matchid)
where player like 'Mario%';

--5
SELECT player, teamid, coach,gtime
  FROM goal
join eteam on teamid=id 
 WHERE gtime<=10;

 --6
 select mdate,teamname from game
join eteam on (team1=eteam.id)
where coach = 'Fernando Santos';

--7
select player from goal 
join game on id=matchid
where stadium = 'National Stadium, Warsaw';

--8
SELECT distinct player
  FROM goal JOIN game ON matchid = id 
   where teamid <> 'GER'AND (team1 = 'GER' or team2 = 'GER');

--9
SELECT teamname, count(*) as Goals
  FROM eteam join goal on teamid=id
 group BY teamname;

 --10
 select stadium,count(*)
from game join goal on matchid=id
group by stadium

--11

SELECT matchid,mdate, count(matchid)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
group by matchid,mdate

--12

select matchid,mdate,count(matchid)
from goal join game on id=matchid
where teamid='GER'
group by matchid,mdate;

--13

select mdate,team1, 
SUM(case when teamid = team1 then 1 else 0 END) score1,
team2,
SUM(case when teamid = team2 then 1 else 0 END) score2
from game left join goal on id=matchid
group by mdate,team1,team2
order by mdate, matchid,team1,team2;


--NULL

--1

select name from teacher where dept is NULL;

--2
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id);

--3
SELECT teacher.name, dept.name
 FROM teacher left JOIN dept
           ON (teacher.dept=dept.id)

--4
SELECT teacher.name, dept.name
 FROM teacher right JOIN dept
           ON (teacher.dept=dept.id);

--5
SELECT name, COALESCE(mobile,'07986 444 2266') AS Contact
  FROM teacher;

  --6
  SELECT teacher.name, Coalesce(dept.name,'None')
 FROM teacher left JOIN dept
           ON (dept.id=teacher.dept) ;          

--7
select count(name),count(mobile)
from teacher;

--8
SELECT dept.name,count(teacher.name)
 FROM teacher right JOIN dept
           ON (teacher.dept=dept.id)
group by dept.name;

--9
select name,
case when dept = '1' or dept = '2' then 'Sci'
else 'Art'
end as Dept
from teacher ;

--10
select name,
case when dept = '1' or dept = '2' then 'Sci'
when dept = '3' then 'Art'
else 'None'
end as Dept
from teacher ;


--SELF JOIN

--1
select count(*)
from stops;

--2
select id from stops 
where name = 'Craiglockhart';

--3
select id,name from stops join route on id=stop
where num = '4' and company = 'LRT';

--4
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
Having Count(*) > 1;

--5
SELECT a.company,a.num,a.stop,b.stop
FROM route a JOIN route b ON
  (a.num = b.num )
WHERE a.stop=53 and b.stop=149;

--6
SELECT x.company, x.num, stopa.name, stopb.name
FROM route x JOIN route z ON
  (x.num=z.num)
  JOIN stops stopa ON (x.stop=stopa.id)
  JOIN stops stopb ON (z.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name = 'London Road';

--7
SELECT distinct a.company,a.num
FROM route a JOIN route b on 
(a.num = b.num)
where a.stop = 115 and b.stop = 137

--8
SELECT distinct a.company,a.num
FROM route a JOIN route b on 
(a.num = b.num)
join stops stopx on (a.stop=stopx.id)
join stops stopy on (b.stop=stopy.id)

where stopx.name = 'Craiglockhart' and stopy.name = 'Tollcross'

--9
SELECT distinct stopy.name,a.company,a.num
FROM route a JOIN route b on 
(a.num = b.num and a.company=b.company)
join stops stopx on (a.stop=stopx.id)
join stops stopy on (b.stop=stopy.id)

where stopx.name = 'Craiglockhart' and a.company = 'LRT';

--10

 SET max_join_size=18446744073709551615;


select  distinct a.num,a.company,stopy.name,c.num,c.company 
from route a join route b on (a.num = b.num and a.company = b.company) join (route c join route d ON (c.num = d.num and c.company = d.company))


join stops stopx on (a.stop=stopx.id)
join stops stopy on (b.stop=stopy.id)
join stops stopz on (c.stop=stopz.id)
join stops stopq on (d.stop=stopq.id)

where stopx.name = 'Craiglockhart' and stopq.name='Lochend' and stopy.name = stopz.name

order by 1,length(stopy.name),c.company,stopy.name,c.num;