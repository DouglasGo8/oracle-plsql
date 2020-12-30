SET SERVEROUTPUT ON;
--------------------------============----------------------------  
--begin <<outer>> to access scope outer.var_foo
DECLARE
    
    v_name CHAR(10) NOT NULL DEFAULT 'Douglas';
    
BEGIN
    
    ---- BEGIN SCOPE v_inner ----
    
    DECLARE
        v_inner INTEGER := 10; -- just can be used insed to BEGIN down below
    BEGIN
        dbms_output.put_line(v_name);
    END;
    
    ---- END SCOPE v_inner ----
    
    -- dbms_output.put_line(v_inner); -- error scope out of declaration
END;
--------------------------============---------------------------------
--end of <<outer>>