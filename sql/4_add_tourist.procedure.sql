CREATE OR REPLACE FUNCTION register_tourist(
    first_name VARCHAR,
    last_name VARCHAR,
    second_name VARCHAR,
    passport VARCHAR,
    sex "public"."Sex",
    age INTEGER,
    tourist_category_id INTEGER
)
RETURNS TABLE (
    tour_id INTEGER,
    start_date DATE,
    end_date DATE,
    route_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO tourist (first_name, last_name, second_name, passport, sex, age, experience, tourist_category_id)
    VALUES (first_name, last_name, second_name, passport, sex, age, tourist_category_id);

    RETURN QUERY
    SELECT tours_log.id, tours_log.start_date, tours_log.end_date, tours_log.route_id, route.name
    FROM tours_log
    JOIN route ON tours_log.route_id = route.id
    JOIN route_difficulty ON route.route_difficulty_id = route_difficulty.id
    WHERE tours_log.start_date > CURRENT_DATE AND route_difficulty.min_tourist_category_id <= tourist_category_id;
END;
$$;
