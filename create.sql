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
);