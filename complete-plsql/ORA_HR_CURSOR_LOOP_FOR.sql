DECLARE
    CURSOR c_emps IS
    SELECT
        *
    FROM
        employees
    WHERE
        department_id = 30;

BEGIN
    FOR stmt IN c_emps LOOP -- in (select * from employees ...)
        dbms_output.put_line(stmt.first_name);
    END LOOP;
END;