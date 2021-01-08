----------------- creating and using subprograms in anonymous blocks - false usage
    CREATE TABLE emps_high_paid
    AS
        SELECT
            *
        FROM
            employees
        WHERE
            1 = 2;
/

DECLARE
    PROCEDURE insert_high_paid_emp (
        emp_id employees.employee_id%TYPE
    ) IS
        emp employees%rowtype;
    BEGIN
        emp := get_emp(emp_id);
        INSERT INTO emps_high_paid VALUES emp;

    END;

    FUNCTION get_emp (
        emp_num employees.employee_id%TYPE
    ) RETURN employees%rowtype IS
        emp employees%rowtype;
    BEGIN
        SELECT
            *
        INTO emp
        FROM
            employees
        WHERE
            employee_id = emp_num;

        RETURN emp;
    END;

BEGIN
    FOR r_emp IN (
        SELECT
            *
        FROM
            employees
    ) LOOP
        IF r_emp.salary > 15000 THEN
            insert_high_paid_emp(r_emp.employee_id);
        END IF;
    END LOOP;
END;
    ----------------- reating and using subprograms in anonymous blocks - true usage
    DECLARE
    FUNCTION get_emp (
        emp_num employees.employee_id%TYPE
    ) RETURN employees%rowtype IS
        emp employees%rowtype;
    BEGIN
        SELECT
            *
        INTO emp
        FROM
            employees
        WHERE
            employee_id = emp_num;

        RETURN emp;
    END;

    PROCEDURE insert_high_paid_emp (
        emp_id employees.employee_id%TYPE
    ) IS
        emp employees%rowtype;
    BEGIN
        emp := get_emp(emp_id);
        INSERT INTO emps_high_paid VALUES emp;

    END;

BEGIN
    FOR r_emp IN (
        SELECT
            *
        FROM
            employees
    ) LOOP
        IF r_emp.salary > 15000 THEN
            insert_high_paid_emp(r_emp.employee_id);
        END IF;
    END LOOP;
END;
    ----------------- The scope of emp record
    DECLARE
    PROCEDURE insert_high_paid_emp (
        emp_id employees.employee_id%TYPE
    ) IS

        emp   employees%rowtype;
        e_id  NUMBER;

        FUNCTION get_emp (
            emp_num employees.employee_id%TYPE
        ) RETURN employees%rowtype IS
        BEGIN
            SELECT
                *
            INTO emp
            FROM
                employees
            WHERE
                employee_id = emp_num;

            RETURN emp;
        END;

    BEGIN
        emp := get_emp(emp_id);
        INSERT INTO emps_high_paid VALUES emp;

    END;

BEGIN
    FOR r_emp IN (
        SELECT
            *
        FROM
            employees
    ) LOOP
        IF r_emp.salary > 15000 THEN
            insert_high_paid_emp(r_emp.employee_id);
        END IF;
    END LOOP;
END;