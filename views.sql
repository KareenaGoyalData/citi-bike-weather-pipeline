CREATE VIEW daily_ridership AS
SELECT
    t.date,
    COUNT(t.id) AS total_rides,
    AVG(t.trip_duration_mins) AS avg_trip_duration_mins,
    CASE
        WHEN w.prcp = 0 AND w.snow = 0 THEN 'Clear'
        WHEN w.prcp > 0 AND w.snow = 0 THEN 'Rainy'
        WHEN w.snow > 0 THEN 'Snowy'
    END AS weather_condition,
    w.tavg AS avg_temp
FROM trips t
JOIN weather w ON t.date = w.date
GROUP BY t.date, weather_condition, w.tavg
ORDER BY t.date;

CREATE VIEW station_popularity AS
SELECT
    s.station_name,
    COUNT(t.id) AS total_departures
FROM trips t
JOIN stations s ON t.start_station_id = s.station_id
GROUP BY s.station_name
ORDER BY total_departures DESC;

CREATE VIEW user_weather_summary AS
SELECT
    t.user_type,
    CASE
        WHEN w.prcp = 0 AND w.snow = 0 THEN 'Clear'
        WHEN w.prcp > 0 AND w.snow = 0 THEN 'Rainy'
        WHEN w.snow > 0 THEN 'Snowy'
    END AS weather_condition,
    COUNT(t.id) AS total_rides,
    AVG(t.trip_duration_mins) AS avg_trip_duration_mins,
    AVG(w.tavg) AS avg_temp
FROM trips t
JOIN weather w ON t.date = w.date
GROUP BY t.user_type, weather_condition
ORDER BY t.user_type, weather_condition;