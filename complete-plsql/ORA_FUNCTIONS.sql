CREATE OR REPLACE FUNCTION get_avg_sal (
    p_dept_id departments.department_id%TYPE
) RETURN NUMBER AS
    v_avg_sal NUMBER;
BEGIN
    SELECT
        AVG(salary)
    INTO v_avg_sal
    FROM
        employees
    WHERE
        department_id = p_dept_id;

    RETURN v_avg_sal;
END get_avg_sal;
    ----------------- using a function in begin-end block
    DECLARE
    v_avg_salary NUMBER;
BEGIN
    v_avg_salary := get_avg_sal(50);
    dbms_output.put_line(v_avg_salary);
END;
    ----------------- using functions in a select clause
    SELECT
    employee_id,
    first_name,
    salary,
    department_id,
    get_avg_sal(department_id) avg_sal
FROM
    employees;
    ----------------- using functions in group by, order by, where clauses 
    SELECT
    get_avg_sal(department_id)
FROM
    employees
WHERE
    salary > get_avg_sal(department_id)
GROUP BY
    get_avg_sal(department_id)
ORDER BY
    get_avg_sal(department_id);
    ----------------- dropping a function
    DROP FUNCTION get_avg_sal;