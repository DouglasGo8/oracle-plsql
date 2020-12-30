---------------------%TYPE ATTRIBUTE---------------------
SET SERVEROUTPUT ON;

DESC employees;

DECLARE
    v_type   employees.job_id%TYPE;
    v_type2  v_type%TYPE;
    v_type3  employees.job_id%TYPE;
BEGIN
    v_type := 'IT_PROG';
    v_type2 := 'SA_MAN';
    v_type3 := NULL;
    dbms_output.put_line(v_type);
    dbms_output.put_line(v_type2);
    dbms_output.put_line('HELLO' || v_type3);
END;
---------------------------------------------------------