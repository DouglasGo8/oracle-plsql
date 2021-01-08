----------------- Creating the type
    CREATE TYPE t_day AS OBJECT (
    v_date        DATE,
    v_day_number  INT
);
    ----------------- creating a nested table type
    CREATE TYPE t_days_tab IS
    TABLE OF t_day;
    ----------------- creating a regular table function
    CREATE OR REPLACE FUNCTION f_get_days (
    p_start_date  DATE,
    p_day_number  INT
) RETURN t_days_tab IS
    v_days t_days_tab := t_days_tab();
BEGIN
    FOR i IN 1..p_day_number LOOP
        v_days.extend();
        v_days(i).v_date := p_start_date + i;
        v_days(i).v_day_number := to_number(to_char(v_days(i).v_date, 'DDD'));

    END LOOP;

    RETURN v_days;
END;
    ----------------- querying from the regular table function
    SELECT
    *
FROM
    TABLE ( f_get_days(sysdate, 1000000) );
    ----------------- querying from the regular table function without the table operator
    SELECT
    *
FROM
    f_get_days(sysdate, 1000000);
    ----------------- creating a pipelined table function
    CREATE OR REPLACE FUNCTION f_get_days_piped (
    p_start_date  DATE,
    p_day_number  INT
) RETURN t_days_tab
    PIPELINED
IS
BEGIN
    FOR i IN 1..p_day_number LOOP
        PIPE ROW ( t_day(p_start_date + i, to_number(to_char(p_start_date + i, 'DDD'))) );
    END LOOP;

    return;
END;
    ----------------- querying from the pipelined table function
    SELECT
    *
FROM
    f_get_days_piped(sysdate, 1000000)