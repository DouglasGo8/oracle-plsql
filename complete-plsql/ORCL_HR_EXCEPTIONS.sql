----------------- Handling the exception
DECLARE
    v_name VARCHAR2(6);
BEGIN
    SELECT
        first_name
    INTO v_name
    FROM
        employees
    WHERE
        employee_id = 50;

    dbms_output.put_line('Hello');
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('There is no employee with the selected id');
END;
    ----------------- Handling multiple exceptions

DECLARE
    v_name              VARCHAR2(6);
    v_department_name   VARCHAR2(100);
BEGIN
    SELECT
        first_name
    INTO v_name
    FROM
        employees
    WHERE
        employee_id = 100;

    SELECT
        department_id
    INTO v_department_name
    FROM
        employees
    WHERE
        first_name = v_name;

    dbms_output.put_line('Hello '
                         || v_name
                         || '. Your department id is : '
                         || v_department_name);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('There is no employee with the selected id');
    WHEN too_many_rows THEN
        dbms_output.put_line('There are more than one employees with the name ' || v_name);
        dbms_output.put_line('Try with a different employee');
END;
    ----------------- when others then example

DECLARE
    v_name              VARCHAR2(6);
    v_department_name   VARCHAR2(100);
BEGIN
    SELECT
        first_name
    INTO v_name
    FROM
        employees
    WHERE
        employee_id = 103;

    SELECT
        department_id
    INTO v_department_name
    FROM
        employees
    WHERE
        first_name = v_name;

    dbms_output.put_line('Hello '
                         || v_name
                         || '. Your department id is : '
                         || v_department_name);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('There is no employee with the selected id');
    WHEN too_many_rows THEN
        dbms_output.put_line('There are more than one employees with the name ' || v_name);
        dbms_output.put_line('Try with a different employee');
    WHEN OTHERS THEN
        dbms_output.put_line('An unexpected error happened. Connect with the programmer..');
END;
    ----------------- sqlerrm & sqlcode example

DECLARE
    v_name              VARCHAR2(6);
    v_department_name   VARCHAR2(100);
BEGIN
    SELECT
        first_name
    INTO v_name
    FROM
        employees
    WHERE
        employee_id = 103;

    SELECT
        department_id
    INTO v_department_name
    FROM
        employees
    WHERE
        first_name = v_name;

    dbms_output.put_line('Hello '
                         || v_name
                         || '. Your department id is : '
                         || v_department_name);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('There is no employee with the selected id');
    WHEN too_many_rows THEN
        dbms_output.put_line('There are more than one employees with the name ' || v_name);
        dbms_output.put_line('Try with a different employee');
    WHEN OTHERS THEN
        dbms_output.put_line('An unexpected error happened. Connect with the programmer..');
        dbms_output.put_line(sqlcode
                             || ' ---> '
                             || sqlerrm);
END;
    ----------------- Inner block exception example

DECLARE
    v_name              VARCHAR2(6);
    v_department_name   VARCHAR2(100);
BEGIN
    SELECT
        first_name
    INTO v_name
    FROM
        employees
    WHERE
        employee_id = 100;

    BEGIN
        SELECT
            department_id
        INTO v_department_name
        FROM
            employees
        WHERE
            first_name = v_name;

    EXCEPTION
        WHEN too_many_rows THEN
            v_department_name := 'Error in department_name';
    END;

    dbms_output.put_line('Hello '
                         || v_name
                         || '. Your department id is : '
                         || v_department_name);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('There is no employee with the selected id');
    WHEN too_many_rows THEN
        dbms_output.put_line('There are more than one employees with the name ' || v_name);
        dbms_output.put_line('Try with a different employee');
    WHEN OTHERS THEN
        dbms_output.put_line('An unexpected error happened. Connect with the programmer..');
        dbms_output.put_line(sqlcode
                             || ' ---> '
                             || sqlerrm);
END;
/

SELECT
    *
FROM
    employees
WHERE
    first_name = 'Steven';