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

-- about Foreign Keys
-- create another table and establish relationship beteween the tables
CREATE TABLE passengers(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    -- this references thing is the one that will link tables
    flight_id INTEGER REFERENCES flights
)
-- initiate it with an entry
INSERT INTO passengers(name, flight_id) VALUES('Alice', 1)

-- JOIN along with other clause
-- default is 'inner JOIN': shows only rows that have a match
-- also LEFT JOIN: makes sure all rows of table on left are included in result even without a match
-- similarly RIGHT JOIN
SELECT origin, destination, name FROM flights JOIN passengers ON 
passengers.flight_id = flights.id WHERE name = 'Alice'

-- a complicated query
-- returns details of flights whose id have more than 1 passengers corresponding to it
SELECT * FROM flights WHERE id IN 
(SELECT flight_id FROM passengers GROUP BY flight_id HAVING COUNT(*)>1)

-- SQL injection
-- connsider a login form. And the query to authorize it might look something like this:
SELECT * FROM users WHERE (username = 'alice') AND (password = '12345')
-- let's say the hacker inputs username = hacker 
-- and password = 1'OR'1'='1
-- this will make the query be like
SELECT * FROM users WHERE (username = 'hacker') AND (password = '1'OR'1'='1')
-- this will make the password clause always true.  This is called SQL injection.
;