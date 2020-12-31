
declare
    --r_emp employees%rowtype;
    type t_emp is record (f_name varchar2(50));
    r_emp t_emp; -- mandatory
begin


    --select * into r_emp from employees where employee_id = 101;
    --select first_name from employees where employee_id = 101;
    
    r_emp.f_name := 'Douglas';
    
    --dbms_output.put_line(r_emp.last_name || ' ' || r_emp.salary);

    --r_emp.salary := 2000;

    --dbms_output.put_line(r_emp.last_name || ' ' || r_emp.salary);
    
    dbms_output.put_line(r_emp.f_name);

end;