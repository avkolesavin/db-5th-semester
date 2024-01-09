DO
$$
BEGIN
    IF EXISTS (SELECT 1 FROM pg_trigger WHERE tgname = 'check_season_trigger') THEN
        DROP TRIGGER check_season_trigger ON tour_log_to_equipment;
    END IF;
END
$$;

CREATE OR REPLACE FUNCTION check_season() RETURNS TRIGGER AS $$
DECLARE
    equipment_season_id INTEGER;
    tour_season_id INTEGER;
BEGIN
    SELECT season_id INTO equipment_season_id FROM equipment_type
    JOIN equipment ON equipment.equipment_type_id = equipment_type.id
    WHERE equipment.id = NEW.equipment_id;

    SELECT season_id INTO tour_season_id FROM tours_log
    JOIN route ON route.id = tours_log.route_id
    WHERE tours_log.id = NEW.tour_log_id;

    IF equipment_season_id != tour_season_id THEN
        RAISE NOTICE 'Сезон инвентаря не соответствует сезону похода';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_season_trigger
BEFORE INSERT ON tour_log_to_equipment
FOR EACH ROW EXECUTE PROCEDURE check_season();
