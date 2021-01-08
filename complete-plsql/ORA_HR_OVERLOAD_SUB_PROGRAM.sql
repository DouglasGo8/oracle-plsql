DECLARE
    PROCEDURE insert_high_paid_emp (
        p_emp employees%rowtype
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

        FUNCTION get_emp (
            emp_email employees.email%TYPE
        ) RETURN employees%rowtype IS
        BEGIN
            SELECT
                *
            INTO emp
            FROM
                employees
            WHERE
                email = emp_email;

            RETURN emp;
        END;

    BEGIN
        emp := get_emp(p_emp.employee_id);
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
            insert_high_paid_emp(r_emp);
        END IF;
    END LOOP;
END;
    ----------------- overloading with multiple usages
    DECLARE
    PROCEDURE insert_high_paid_emp (
        p_emp employees%rowtype
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

        FUNCTION get_emp (
            emp_email employees.email%TYPE
        ) RETURN employees%rowtype IS
        BEGIN
            SELECT
                *
            INTO emp
            FROM
                employees
            WHERE
                email = emp_email;

            RETURN emp;
        END;

        FUNCTION get_emp (
            f_name  VARCHAR2,
            l_name  VARCHAR2
        ) RETURN employees%rowtype IS
        BEGIN
            SELECT
                *
            INTO emp
            FROM
                employees
            WHERE
                    first_name = f_name
                AND last_name = l_name;

            RETURN emp;
        END;

    BEGIN
        emp := get_emp(p_emp.employee_id);
        INSERT INTO emps_high_paid VALUES emp;

        emp := get_emp(p_emp.email);
        INSERT INTO emps_high_paid VALUES emp;

        emp := get_emp(p_emp.first_name, p_emp.last_name);
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
            insert_high_paid_emp(r_emp);
        END IF;
    END LOOP;
END;