-- DataCamp - Joining data in SQL

-- Part 1 INNER JOIN
------------------------
-- Join CITY table with COUNTRY table ON country code
SELECT cities.name AS city,countries.name AS country, countries.region
FROM cities
INNER JOIN countries
ON cities.country_code = countries.code;

-- Part 2 INNER JOIN(2)
------------------------
-- Join CITY table with ECONOMICS table ON country code
SELECT c.code AS country_code, c.name, e.year, e.inflation_rate
FROM countries AS c
  -- 1. Join to economies (alias e)
  INNER JOIN economies AS e
    -- 2. Match on code
    ON c.code = e.code;

-- Part 3 INNER JOIN (3)
------------------------
--Multiple inner joins in single query
SELECT c.code, name, region, e.year, fertility_rate, unemployment_rate
  -- 1. From countries (alias as c)
  FROM countries AS c
  -- 2. Join to populations (as p)
  INNER JOIN populations AS p
    -- 3. Match on country code
    ON c.code = p.country_code
  -- 4. Join to economies (as e)
  INNER JOIN economies AS e
    -- 5. Match on country code and year
    ON c.code = e.code AND e.year = p.year;

-- Part 4 INNER JOIN with USING
------------------------
-- When joining tables with common field name, USING is a shortcut
SELECT c.name AS country, c.continent, l.name AS language, l.official
  -- 1. From countries (alias as c)
  FROM countries AS c
  -- 2. Join to languages (as l)
  INNER JOIN languages AS l
    -- 3. Match using code
    USING(code);

