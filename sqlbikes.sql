SELECT * FROM daily_ridership LIMIT 10;

SELECT * FROM station_popularity LIMIT 10;

CREATE VIEW user_weather_summary AS
SELECT
    t.user_type,
    t.gender,
    CASE
        WHEN w.prcp = 0 AND w.snow = 0 THEN 'Clear'
        WHEN w.prcp > 0 AND w.snow = 0 THEN 'Rainy'
        WHEN w.snow > 0 THEN 'Snowy'
    END AS weather_condition,
    COUNT(t.id) AS total_rides,
    AVG(t.trip_duration) AS avg_trip_duration,
    AVG(w.tavg) AS avg_temp
FROM trips t
JOIN weather w ON t.date = w.date
GROUP BY t.user_type, t.gender, weather_condition
ORDER BY t.user_type, weather_condition;

SELECT * FROM user_weather_summary LIMIT 10;