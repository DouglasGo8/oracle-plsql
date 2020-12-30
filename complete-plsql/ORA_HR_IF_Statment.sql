SET SERVEROUTPUT ON;

DECLARE
    v_number INT := 10;
BEGIN
    IF (
        v_number > 4
        AND v_number < 6
    ) THEN
        dbms_output.put_line(v_number);
    ELSIF ( v_number < 4 ) THEN
        dbms_output.put_line('Invalid ' || v_number);
    ELSE
        dbms_output.put_line('Nobody cares');
    END IF;
END;