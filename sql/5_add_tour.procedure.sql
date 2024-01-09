CREATE OR REPLACE FUNCTION create_tour(
    route_id INTEGER,
    start_date DATE,
    end_date DATE,
    tourist_ids INTEGER[]
)
RETURNS TABLE (
    guide_id INTEGER,
    transport_ids INTEGER[]
)
LANGUAGE plpgsql
AS $$
DECLARE
    tour_id INTEGER;
    guide RECORD;
    transports RECORD;
    tourist_id INTEGER;
BEGIN
    -- Создание нового похода
    INSERT INTO tours_log (start_date, end_date, route_id)
    VALUES (start_date, end_date, route_id)
    RETURNING id INTO tour_id;

    -- Добавление туристов на поход
    FOREACH tourist_id IN ARRAY tourist_ids
    LOOP
        INSERT INTO tours_logs_to_tourists (tours_log_id, tourist_id)
        VALUES (tour_id, tourist_id);
    END LOOP;

    -- Добавление гида на поход
    SELECT * INTO guide
    FROM guide
    WHERE guide_category_id >= (SELECT route_difficulty.min_guide_category_id FROM route_difficulty JOIN route ON route.route_difficulty_id = route_difficulty.id WHERE route.id = route_id)
    AND guide.id NOT IN (SELECT guide_id FROM tours_logs_to_guides WHERE tours_log_id IN (SELECT id FROM tours_log WHERE start_date <= end_date AND end_date >= start_date))
    LIMIT 1;

    IF guide IS NULL THEN
        RAISE EXCEPTION 'Нет доступных гидов';
    END IF;

    INSERT INTO tours_logs_to_guides (tours_log_id, guide_id)
    VALUES (tour_id, guide.id);

    -- Добавление транспорта на поход
    SELECT array_agg(id) INTO transports
    FROM transport
    WHERE id NOT IN (SELECT transport_id FROM tour_log_to_transport WHERE tour_log_id IN (SELECT id FROM tours_log WHERE start_date <= end_date AND end_date >= start_date))
    AND human_capacity >= (SELECT COUNT(*) FROM tours_logs_to_tourists WHERE tours_log_id = tour_id) + 1
    LIMIT 1;

    IF transports IS NULL THEN
        RAISE EXCEPTION 'Нет доступного транспорта';
    END IF;

    INSERT INTO tour_log_to_transport (tour_log_id, transport_id, count)
    VALUES (tour_id, transports, 1);

    RETURN NEXT;
END;
$$;
