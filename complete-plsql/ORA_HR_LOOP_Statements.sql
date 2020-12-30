--SET SERVEROUTPUT ON;

DECLARE
    v_counter NUMBER(2) := 1;
BEGIN
    LOOP
        dbms_output.put_line('Counter ' || v_counter);
        v_counter := v_counter + 1;
        EXIT WHEN v_counter > 10;
    END LOOP;

    v_counter := 1;
    WHILE v_counter <= 10 LOOP
        dbms_output.put_line('Counter ' || v_counter);
        v_counter := v_counter + 1;
    END LOOP;

    v_counter := 1;
    FOR v_counter IN v_counter..10 -- [REVERSE] last to the first
     LOOP
        dbms_output.put_line('Counter ' || v_counter);
    END LOOP;

END;