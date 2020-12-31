CREATE TABLE table1
    AS
        SELECT
            *
        FROM
            employees
        WHERE
            1 = 2; -- just employee table structure
---
SELECT
    *
FROM
    table1;

DECLARE
    r_emp employees%rowtype;
BEGIN
    SELECT
        *
    INTO r_emp
    FROM
        employees
    WHERE
        employee_id = 104;

    r_emp.salary := 10;
    r_emp.commission_port := 0;
    INSERT INTO table1 VALUES r_emp;

    UPDATE table1
    SET
        row = r_emp
    WHERE
        employee_id = 104; -- ROW Keyword will update all rows
END;