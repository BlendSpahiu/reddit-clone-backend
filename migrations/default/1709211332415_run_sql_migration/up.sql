CREATE FUNCTION check_author_active()
    RETURNS trigger AS $BODY$
    DECLARE active_author BOOLEAN;
    BEGIN
    SELECT author.is_active INTO active_author FROM "authors" author WHERE author.id = NEW."author_id";
    IF active_author != TRUE THEN
        RAISE EXCEPTION 'Author must be active';
    END IF;
    RETURN NEW;
    END;
    $BODY$ LANGUAGE plpgsql;
