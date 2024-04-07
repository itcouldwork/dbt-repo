WITH forecast_day_data AS (
    SELECT * 
    FROM {{ref('staging_forecast_day')}}
)
add_features AS (
    SELECT *,
        ,TO_DATE('date', 'YYYY-MM-DD') AS date,
        date_part('day', date) AS day_of_month,
        to_char(date, 'Month') AS month_of_year,
        date_part('day', year) AS AS year,
        to_char(date, 'Day') AS day_of_week,
        date_part('week', date) AS week_of_year,
        to_char(date, 'IYYY-IW') AS year_and_week

    FROM forecast_day_data
)
SELECT *
FROM add_features;

-- Update NULL values for specific columns
UPDATE forecast_day_data SET moonrise = NULL WHERE moonrise = 'No moonrise';
UPDATE forecast_day_data SET moonset = NULL WHERE moonset = 'No moonset';
UPDATE forecast_day_data SET sunrise = NULL WHERE sunrise = 'No sunrise';
UPDATE forecast_day_data SET sunset = NULL WHERE sunset = 'No sunset';