DECLARE -- strong cursor
    TYPE t_emps IS REF CURSOR RETURN employees%rowtype;
    rc_emps  t_emps;
    r_emps   employees%rowtype;
BEGIN
    OPEN rc_emps FOR SELECT
                         *
                     FROM
                         employees;

    LOOP
        FETCH rc_emps INTO r_emps;
        EXIT WHEN rc_emps%notfound;
        dbms_output.put_line(r_emps.first_name
                             || ' '
                             || r_emps.last_name);
    END LOOP;

    CLOSE rc_emps;
END;
    --------------- in two different queries
    DECLARE
    TYPE t_emps IS REF CURSOR RETURN employees%rowtype;
    rc_emps  t_emps;
    r_emps   employees%rowtype;
BEGIN
    OPEN rc_emps FOR SELECT
                         *
                     FROM
                         retired_employees;

    LOOP
        FETCH rc_emps INTO r_emps;
        EXIT WHEN rc_emps%notfound;
        dbms_output.put_line(r_emps.first_name
                             || ' '
                             || r_emps.last_name);
    END LOOP;

    CLOSE rc_emps;
    dbms_output.put_line('--------------');
    OPEN rc_emps FOR SELECT
                         *
                     FROM
                         employees
                     WHERE
                         job_id = 'IT_PROG';

    LOOP
        FETCH rc_emps INTO r_emps;
        EXIT WHEN rc_emps%notfound;
        dbms_output.put_line(r_emps.first_name
                             || ' '
                             || r_emps.last_name);
    END LOOP;

    CLOSE rc_emps;
END;
    ---------------Example of using with %type when declaring records first
    DECLARE
    r_emps   employees%rowtype;
    TYPE t_emps IS REF CURSOR RETURN r_emps%TYPE;
    rc_emps  t_emps;
     --type t_emps2 is ref cursor return rc_emps%rowtype;
    BEGIN
    OPEN rc_emps FOR SELECT
                         *
                     FROM
                         retired_employees;

    LOOP
        FETCH rc_emps INTO r_emps;
        EXIT WHEN rc_emps%notfound;
        dbms_output.put_line(r_emps.first_name
                             || ' '
                             || r_emps.last_name);
    END LOOP;

    CLOSE rc_emps;
    dbms_output.put_line('--------------');
    OPEN rc_emps FOR SELECT
                         *
                     FROM
                         employees
                     WHERE
                         job_id = 'IT_PROG';

    LOOP
        FETCH rc_emps INTO r_emps;
        EXIT WHEN rc_emps%notfound;
        dbms_output.put_line(r_emps.first_name
                             || ' '
                             || r_emps.last_name);
    END LOOP;

    CLOSE rc_emps;
END;
    ---------------manually declared record type with cursors example
    DECLARE
    TYPE ty_emps IS RECORD (
        e_id             NUMBER,
        first_name       employees.last_name%TYPE,
        last_name        employees.last_name%TYPE,
        department_name  departments.department_name%TYPE
    );
    r_emps   ty_emps;
    TYPE t_emps IS REF CURSOR RETURN ty_emps;
    rc_emps  t_emps;
BEGIN
    OPEN rc_emps FOR SELECT
                         employee_id,
                         first_name,
                         last_name,
                         department_name
                     FROM
                              employees
                         JOIN departments USING ( department_id );

    LOOP
        FETCH rc_emps INTO r_emps;
        EXIT WHEN rc_emps%notfound;
        dbms_output.put_line(r_emps.first_name
                             || ' '
                             || r_emps.last_name
                             || ' is at the department of : '
                             || r_emps.department_name);

    END LOOP;

    CLOSE rc_emps;
END;
    ---------------first example of weak ref cursors
    DECLARE
    TYPE ty_emps IS RECORD (
        e_id             NUMBER,
        first_name       employees.last_name%TYPE,
        last_name        employees.last_name%TYPE,
        department_name  departments.department_name%TYPE
    );
    r_emps   ty_emps;
    TYPE t_emps IS REF CURSOR;
    rc_emps  t_emps;
    q        VARCHAR2(200);
BEGIN
    q := 'select employee_id,first_name,last_name,department_name 
                          from employees join departments using (department_id)';
    OPEN rc_emps FOR q;

    LOOP
        FETCH rc_emps INTO r_emps;
        EXIT WHEN rc_emps%notfound;
        dbms_output.put_line(r_emps.first_name
                             || ' '
                             || r_emps.last_name
                             || ' is at the department of : '
                             || r_emps.department_name);

    END LOOP;

    CLOSE rc_emps;
END;
    --------------- bind variables with cursors example
    DECLARE
    TYPE ty_emps IS RECORD (
        e_id             NUMBER,
        first_name       employees.last_name%TYPE,
        last_name        employees.last_name%TYPE,
        department_name  departments.department_name%TYPE
    );
    r_emps   ty_emps;
    TYPE t_emps IS REF CURSOR;
    rc_emps  t_emps;
    r_depts  departments%rowtype;
     --r t_emps%rowtype;
         q        VARCHAR2(200);
BEGIN
    q := 'select employee_id,first_name,last_name,department_name 
                          from employees join departments using (department_id)
                          where department_id = :t';
    OPEN rc_emps FOR q
        USING '50';

    LOOP
        FETCH rc_emps INTO r_emps;
        EXIT WHEN rc_emps%notfound;
        dbms_output.put_line(r_emps.first_name
                             || ' '
                             || r_emps.last_name
                             || ' is at the department of : '
                             || r_emps.department_name);

    END LOOP;

    CLOSE rc_emps;
    OPEN rc_emps FOR SELECT
                         *
                     FROM
                         departments;

    LOOP
        FETCH rc_emps INTO r_depts;
        EXIT WHEN rc_emps%notfound;
        dbms_output.put_line(r_depts.department_id
                             || ' '
                             || r_depts.department_name);
    END LOOP;

    CLOSE rc_emps;
END;
    ---------------sys_refcursor example
    DECLARE
    TYPE ty_emps IS RECORD (
        e_id             NUMBER,
        first_name       employees.last_name%TYPE,
        last_name        employees.last_name%TYPE,
        department_name  departments.department_name%TYPE
    );
    r_emps   ty_emps;
    -- type t_emps is ref cursor;
         rc_emps  SYS_REFCURSOR;
    r_depts  departments%rowtype;
     --r t_emps%rowtype;
         q        VARCHAR2(200);
BEGIN
    q := 'select employee_id,first_name,last_name,department_name 
                          from employees join departments using (department_id)
                          where department_id = :t';
    OPEN rc_emps FOR q
        USING '50';

    LOOP
        FETCH rc_emps INTO r_emps;
        EXIT WHEN rc_emps%notfound;
        dbms_output.put_line(r_emps.first_name
                             || ' '
                             || r_emps.last_name
                             || ' is at the department of : '
                             || r_emps.department_name);

    END LOOP;

    CLOSE rc_emps;
    OPEN rc_emps FOR SELECT
                         *
                     FROM
                         departments;

    LOOP
        FETCH rc_emps INTO r_depts;
        EXIT WHEN rc_emps%notfound;
        dbms_output.put_line(r_depts.department_id
                             || ' '
                             || r_depts.department_name);
    END LOOP;

    CLOSE rc_emps;
END;