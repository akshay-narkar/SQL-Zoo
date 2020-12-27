
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
  WHERE area BETWEEN 200000 AND 250000 

-- Select on World

-- 1
SELECT name, continent, population FROM world

-- 2
SELECT name FROM world WHERE population >= 200000000