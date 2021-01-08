----------------- An unhandled exception in function
    CREATE OR REPLACE FUNCTION get_emp (
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
    ----------------- calling that function in an anonymous block
    DECLARE
    v_emp employees%rowtype;
BEGIN
    dbms_output.put_line('Fetching the employee data!..');
    v_emp := get_emp(10);
    dbms_output.put_line('Some information of the employee are : ');
    dbms_output.put_line('The name of the employee is : ' || v_emp.first_name);
    dbms_output.put_line('The email of the employee is : ' || v_emp.email);
    dbms_output.put_line('The salary of the employee is : ' || v_emp.salary);
END;
    ----------------- hanling the exception wihout the return clause - not working
    CREATE OR REPLACE FUNCTION get_emp (
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
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('There is no employee with the id ' || emp_num);
END;
    ----------------- handling and raising the exception
    CREATE OR REPLACE FUNCTION get_emp (
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
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('There is no employee with the id ' || emp_num);
        RAISE no_data_found;
END;
    ----------------- handling all possible exception cases
    CREATE OR REPLACE FUNCTION get_emp (
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
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('There is no employee with the id ' || emp_num);
        RAISE no_data_found;
    WHEN OTHERS THEN
        dbms_output.put_line('Something unexpected happened!.');
        RETURN NULL;
END;