DECLARE
    CURSOR c_emps IS
    SELECT
        *
    FROM
        employees
    WHERE
        department_id = 30;

    v_emps c_emps%rowtype;
BEGIN
    OPEN c_emps;
    --FETCH c_emps INTO v_emps; -- must used with while -- bad practice
    -- while c_emps%found loop
    LOOP 
        FETCH c_emps INTO v_emps;
        EXIT WHEN c_emps%notfound; -- comment when use while
        dbms_output.put_line(v_emps.first_name);
    END LOOP;

    CLOSE c_emps;
END;