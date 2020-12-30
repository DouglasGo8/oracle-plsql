--------------------------BIND VARIABLES--------------------------
    SET SERVEROUTPUT ON;

SET AUTOPRINT ON;
    
    variable var_text varchar2(30);
   
    variable var_number NUMBER;
    
    variable var_date DATE;
   
    declare
    v_text varchar2(30);
    begin
    :var_text := 'Hello SQL';
    :var_number := 20;
    v_text := :var_text;
    --dbms_output.put_line(v_text);
    --dbms_output.put_line(:var_text);
    end;
 
    print var_text;
  
    variable var_sql NUMBER;
   
BEGIN
    :var_sql := 100;
END;
/

SELECT
    *
FROM
    employees
WHERE
    employee_id = :var_sql;
     
    -----NOTE: When you run a bind variable creation and select statement together, SQL Developer may return an error. But when you execute them separately, there will be no problem--------
    ------------------------------------------------------------------