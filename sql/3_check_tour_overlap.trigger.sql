CREATE OR REPLACE FUNCTION check_tour_overlap() RETURNS TRIGGER AS $$
DECLARE
    overlaps_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO overlaps_count
    FROM tours_logs_to_tourists
    JOIN tours_log ON tours_logs_to_tourists.tours_log_id = tours_log.id
    WHERE tours_logs_to_tourists.tourist_id = NEW.tourist_id
    AND tours_log.start_date <= NEW.end_date
    AND tours_log.end_date >= NEW.start_date;

    IF overlaps_count > 0 THEN
        RAISE EXCEPTION 'Турист уже участвует в другом походе в эти даты.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_tour_overlap
BEFORE INSERT ON tours_logs_to_tourists
FOR EACH ROW EXECUTE PROCEDURE check_tour_overlap();
