CREATE TABLE IF NOT EXISTS weather (
    date DATE PRIMARY KEY,
    awnd NUMERIC(6,2),
    prcp NUMERIC(6,2),
    snow NUMERIC(6,2),
    snwd NUMERIC(6,2),
    tavg NUMERIC(6,2),
    tmax NUMERIC(6,2),
    tmin NUMERIC(6,2),
    wdf2 NUMERIC(6,2),
    wdf5 NUMERIC(6,2),
    wsf2 NUMERIC(6,2),
    wsf5 NUMERIC(6,2)
);

CREATE TABLE IF NOT EXISTS stations (
    station_id INTEGER PRIMARY KEY,
    station_name TEXT,
    latitude NUMERIC(8,4),
    longitude NUMERIC(8,4)
);

CREATE TABLE IF NOT EXISTS trips (
    id SERIAL PRIMARY KEY,
    date DATE REFERENCES weather(date),
    start_time TIME,
    stop_time TIME,
    trip_duration INTEGER,
    trip_duration_mins NUMERIC(10,2),
    start_station_id INTEGER REFERENCES stations(station_id),
    end_station_id INTEGER REFERENCES stations(station_id),
    bike_id INTEGER,
    user_type TEXT,
    birth_year INTEGER,
    gender INTEGER
);