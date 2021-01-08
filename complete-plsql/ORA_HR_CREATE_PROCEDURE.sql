----------------- Creating a procedure
    CREATE PROCEDURE increase_salaries AS

    CURSOR c_emps IS
    SELECT
        *
    FROM
        employees_copy
    FOR UPDATE;

    v_salary_increase  NUMBER := 1.10;
    v_old_salary       NUMBER;
BEGIN
    FOR r_emp IN c_emps LOOP
        v_old_salary := r_emp.salary;
        r_emp.salary := r_emp.salary * v_salary_increase + r_emp.salary * nvl(r_emp.commission_pct, 0);

        UPDATE employees_copy
        SET
            row = r_emp
        WHERE
            CURRENT OF c_emps;

        dbms_output.put_line('The salary of : '
                             || r_emp.employee_id
                             || ' is increased from '
                             || v_old_salary
                             || ' to '
                             || r_emp.salary);

    END LOOP;
END;
    ----------------- Multiple procedure usage
    BEGIN
    dbms_output.put_line('Increasing the salaries!...');
    increase_salaries;
    increase_salaries;
    increase_salaries;
    increase_salaries;
    dbms_output.put_line('All the salaries are successfully increased!...');
END;
    ----------------- Different procedures in one block
    BEGIN
    dbms_output.put_line('Increasing the salaries!...');
    increase_salaries;
    new_line;
    increase_salaries;
    new_line;
    increase_salaries;
    new_line;
    increase_salaries;
    dbms_output.put_line('All the salaries are successfully increased!...');
END;
    -----------------Creating a procedure to ease the dbms_output.put_line procedure 
    CREATE PROCEDURE new_line AS
BEGIN
    dbms_output.put_line('------------------------------------------');
END;
    -----------------Modifying the procedure with using the OR REPLACE command.
    CREATE OR replace PROCEDURE increase_salaries AS

    CURSOR c_emps IS
    SELECT
        *
    FROM
        employees_copy
    FOR UPDATE;

    v_salary_increase  NUMBER := 1.10;
    v_old_salary       NUMBER;
BEGIN
    FOR r_emp IN c_emps LOOP
        v_old_salary := r_emp.salary;
        r_emp.salary := r_emp.salary * v_salary_increase + r_emp.salary * nvl(r_emp.commission_pct, 0);

        UPDATE employees_copy
        SET
            row = r_emp
        WHERE
            CURRENT OF c_emps;

        dbms_output.put_line('The salary of : '
                             || r_emp.employee_id
                             || ' is increased from '
                             || v_old_salary
                             || ' to '
                             || r_emp.salary);

    END LOOP;

    dbms_output.put_line('Procedure finished executing!');
END