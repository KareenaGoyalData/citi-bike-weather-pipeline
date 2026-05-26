# Citi Bike + Weather Data Pipeline

An end-to-end data pipeline analyzing the effect of weather on Citi Bike ridership in Jersey City, NJ (2016).

## Overview

This project loads, cleans, and merges 12 months of Citi Bike trip data with daily weather observations from Newark Airport into a normalized PostgreSQL database. SQL views are used to aggregate the data for analysis, and the results are visualized in Python.

## Tech Stack

- **Python** — pandas, SQLAlchemy, matplotlib, seaborn
- **PostgreSQL** — normalized schema with foreign key relationships
- **SQL** — analytics views for ridership, station, and weather summaries

## Data Sources

- [Citi Bike System Data](https://citibikenyc.com/system-data) — Jersey City 2016 monthly trip CSVs
- [NOAA Climate Data Online](https://www.ncdc.noaa.gov/cdo-web/) — Daily weather observations from Newark Liberty International Airport

## Database Schema

Three normalized tables:
- `trips` — one row per ride, foreign keys to stations, weather, and bikes
- `stations` — unique station reference table (primary key: `station_id`)
- `weather` — one row per day (primary key: `date`)

Three analytics views:
- `daily_ridership` — total rides, avg trip duration, and weather condition per day
- `station_popularity` — total departures per station
- `user_weather_summary` — avg trip duration by weather condition

## Key Findings

1. **Ridership strongly follows temperature.** Trips peak in the 61-80°F range and drop sharply in colder weather.
2. **Grove St PATH is the dominant station.** With 28,736 departures, it accounts for nearly 10,000 more trips than second-place Exchange Place.
3. **Weather has a modest effect on trip duration.** Rides tend to be slightly shorter on rainy and snowy days.
4. **Commuter patterns are clear in hourly data.** Average trips peak at 8am and 7pm — classic rush hours.
5. **Most trips are short.** The vast majority of rides are clustered under 30 minutes.
6. **Subscribers dominate ridership.** The overwhelming majority of rides are taken by subscribers rather than casual customers.

## Setup

### Running the notebook
1. Open `citibikepipeline.ipynb` in Google Colab or JupyterLab
2. Install dependencies: `pip install pandas numpy psycopg2-binary sqlalchemy matplotlib seaborn`
3. The data files are included in the `data/` folder — no additional downloads needed
4. Run all cells up to the PostgreSQL loading section

### Setting up the database locally
1. Install PostgreSQL and create a database named `citibike`
2. Run the notebook top to bottom to load data into the database
3. Run `sqlbikes.sql` in your PostgreSQL client to create the analytics views

## Repository Structure

```
citi-bike-weather-pipeline/
├── citibikepipeline.ipynb   # Full pipeline notebook
├── sqlbikes.sql             # SQL view definitions
├── data/                    # Raw CSV data files
├── rides_by_temp.png
├── station_popularity.png
├── weather_trip_duration.png
├── trips_by_hour.png
├── trip_duration_dist.png
├── user_type_counts.png
└── README.md
```
