DECLARE
    TYPE r_emp IS RECORD (
        v_first_name  employees.first_name%TYPE,
        v_last_name   employees.last_name%TYPE
    );
    v_emp r_emp;
    CURSOR c_emps IS
    SELECT
        first_name,
        last_name
    FROM
        employees;

BEGIN
    OPEN c_emps;
    FETCH c_emps INTO v_emp;
    dbms_output.put_line(v_emp.v_first_name
                         || ' '
                         || v_emp.v_last_name);
    CLOSE c_emps;
END;