CREATE TABLE public.weather (
  date date NOT NULL,
  awnd numeric,
  prcp numeric,
  snow numeric,
  snwd numeric,
  tavg numeric,
  tmax numeric,
  tmin numeric,
  wdf2 numeric,
  wdf5 numeric,
  wsf2 numeric,
  wsf5 numeric,
  CONSTRAINT weather_pkey PRIMARY KEY (date)
);

CREATE TABLE public.stations (
  station_id integer NOT NULL,
  station_name text,
  latitude numeric,
  longitude numeric,
  CONSTRAINT stations_pkey PRIMARY KEY (station_id)
);

CREATE TABLE public.trips (
  id integer NOT NULL DEFAULT nextval('trips_id_seq'::regclass),
  date date,
  start_time time without time zone,
  stop_time time without time zone,
  trip_duration integer,
  trip_duration_mins numeric,
  start_station_id integer,
  end_station_id integer,
  bike_id integer,
  user_type text,
  birth_year integer,
  gender integer,
  CONSTRAINT trips_pkey PRIMARY KEY (id),
  CONSTRAINT trips_date_fkey FOREIGN KEY (date) REFERENCES public.weather(date),
  CONSTRAINT trips_start_station_id_fkey FOREIGN KEY (start_station_id) REFERENCES public.stations(station_id),
  CONSTRAINT trips_end_station_id_fkey FOREIGN KEY (end_station_id) REFERENCES public.stations(station_id)
);