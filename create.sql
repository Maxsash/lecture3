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
;