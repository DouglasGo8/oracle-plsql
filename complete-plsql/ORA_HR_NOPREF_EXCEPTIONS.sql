BEGIN
    UPDATE employees_copy
    SET
        email = NULL
    WHERE
        employee_id = 100;

END;
    -----------------HANDLING a nonpredefined exception

DECLARE
    cannot_update_to_null EXCEPTION;
    PRAGMA exception_init ( cannot_update_to_null, -01407 );
BEGIN
    UPDATE employees_copy
    SET
        email = NULL
    WHERE
        employee_id = 100;

EXCEPTION
    WHEN cannot_update_to_null THEN
        dbms_output.put_line('You cannot update with a null value!');
END;