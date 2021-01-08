DECLARE
    v_emp employees%rowtype; -- bad practice
    CURSOR c_emps IS
    SELECT
        first_name,
        last_name
    FROM
        employees;

BEGIN
    OPEN c_emps;
    FETCH c_emps INTO
        v_emp.first_name,
        v_emp.last_name;
    dbms_output.put_line(v_emp.first_name
                         || ' '
                         || v_emp.last_name);
    CLOSE c_emps;
END;