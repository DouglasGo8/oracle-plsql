
declare
    --r_emp employees%rowtype;
    type t_emp is record (f_name varchar2(50));
begin
    --select * into r_emp from employees where employee_id = 101;
    --select first_name from employees where employee_id = 101;
    
    t_emp := 'Douglas';
    
    --dbms_output.put_line(r_emp.last_name || ' ' || r_emp.salary);

    --r_emp.salary := 2000;

    --dbms_output.put_line(r_emp.last_name || ' ' || r_emp.salary);

end;