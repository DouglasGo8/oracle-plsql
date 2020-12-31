--set serveroutput on;
DECLARE
    v_name          VARCHAR2(50);
    v_salary        employees.salary%TYPE;
    v_employee_id   employees.employee_id%TYPE := 120;
BEGIN
    SELECT
        last_name,
        salary
    INTO
        v_name,
        v_salary
    FROM
        employees
    WHERE
        employee_id = v_employee_id;

    dbms_output.put_line(v_name
                         || ' '
                         || v_salary);
END;