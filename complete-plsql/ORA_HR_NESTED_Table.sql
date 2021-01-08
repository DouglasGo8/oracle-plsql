DECLARE

TYPE e_list IS TABLE OF VARCHAR2(50);
emps e_list;

BEGIN
    emps := e_list('Alex', 'Bruce', 'John');
    FOR i IN 1..emps.count() LOOP
        dbms_output.put_line(emps(i));
    END LOOP;
END;
--------------- Adding a new value to a nested table after the initialization
DECLARE 

TYPE e_list IS TABLE OF VARCHAR2(50);
emps e_list;

BEGIN
    emps := e_list('Alex', 'Bruce', 'John');
    emps.extend;
    emps(4) := 'Bob';
    FOR i IN 1..emps.count() LOOP
        dbms_output.put_line(emps(i));
    END LOOP;

END;


TYPE e_list IS TABLE OF employees.first_name%TYPE;
emps e_list := e_list();
idx pls_integer := 1;

begin
      for x in 100 .. 110 loop
        emps.extend;
        select first_name into emps(idx) from employees where employee_id = x;
        idx := idx + 1;
      end loop;
      for i in 1..emps.count() loop
        dbms_output.put_line(emps(i));
      end loop;
    end;
    ---------------delete example
    declare
      type e_list is table of employees.first_name%type;
      emps e_list := e_list();idx
pls_integer := 1;

BEGIN
    FOR x IN 100..110 LOOP
        emps.extend;
        SELECT
            first_name
        INTO
            emps
        (idx)
        FROM
            employees
        WHERE
            employee_id = x;

        idx := idx + 1;
    END LOOP;

    emps.DELETE(3);
    FOR i IN 1..emps.count() LOOP
        IF emps.EXISTS(i) THEN
            dbms_output.put_line(emps(i));
        END IF;
    END LOOP;

END;

