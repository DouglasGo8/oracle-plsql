DECLARE
    CURSOR c_emps IS
    SELECT
        first_name,
        last_name,
        d.department_name
    FROM
             employees
        JOIN departments d USING ( department_id )
    WHERE
        department_id BETWEEN 30 AND 60;

    v_first_name       employees.first_name%TYPE;
    v_last_name        employees.last_name%TYPE;
    v_department_name  departments.department_name%TYPE;
BEGIN
    OPEN c_emps;
    FETCH c_emps INTO
        v_first_name,
        v_last_name,
        v_department_name;
    dbms_output.put_line(v_first_name
                         || ' '
                         || v_last_name
                         || ' in department '
                         || v_department_name);

    CLOSE c_emps;
END;