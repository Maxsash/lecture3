-- tutorial for PostgreSQL
-- we need to start a Postgres server to work on it. Locally or can find databases hosted online.
-- type $psql <name of database> in terminal
-- inside postgres, if prompt is '-' instead of '=' that means it is waiting for a ';' before execution.
-- \d lists the relations(tables) that have been created
CREATE TABLE flights (
    -- id on every single table is very practical
    -- serial is just an integer that automatically counts
    -- primary means it will be the primary way to refer to flights
    id SERIAL PRIMARY KEY,
    -- varchar is basically string
    -- it cannot have a NULL value. It needs to have an origin
    origin VARCHAR NOT NULL,
    -- it also needs to have a destination
    destination VARCHAR NOT NULL,
    -- duration in minutes
    duration INTEGER NOT NULL
    )

-- Inserting entries in the table. Values not specified are either serially added or take default values.
INSERT INTO flights
    (origin, destination, duration)
    VALUES ('New York', 'London', 415)

-- Reading the table requires SELECT query. 
-- * means select everything
SELECT * FROM flights
-- to view data only from origin and destination columns
SELECT origin, destination FROM flights
-- to have control over rows as well
SELECT * FROM flights WHERE id=1
-- other examples include
SELECT * FROM flights WHERE duration > 200 AND destination = 'Paris'
-- using functions 
SELECT AVG(duration) FROM flights
SELECT COUNT(*) FROM flights where origin = 'New York'
-- other popular functions include MIN, MAX, SUM
-- more ways to be specific
SELECT * FROM flights WHERE origin IN ('New York', 'Lima')
-- using REGEX
-- % will look for 0 or more amount of string followed by 'a' and then zero or more string
SELECT * FROM flights WHERE origin LIKE '%a%'
-- Limiting the number of results
SELECT * FROM flights LIMIT 2

-- UPDATE query 
UPDATE flights 
    SET duration = 430
    WHERE origin = 'NEW YORK'
    AND destination = 'London'

-- DELETE query
DELETE FROM flights 
    WHERE destination = 'Tokyo'

-- ORDERing the results
-- sorts in ascending order of duration; also DESC
SELECT * FROM flights ORDER BY duration ASC
-- GROUPing the results
-- will return the number of flights from each origin
SELECT origin, COUNT(*) FROM flights GROUP BY origin
-- HAVING clause
-- will only return the results with count greater than 1
SELECT origin, COUNT(*) FROM flights GROUP BY origin HAVING COUNT(*)>1
;