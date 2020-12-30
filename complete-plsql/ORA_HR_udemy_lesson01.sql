-----------------------===================-----------------------
-----------------------DECLARING VARIABLES-----------------------
-----------------------===================-----------------------
SET SERVEROUTPUT ON;

DECLARE
    v VARCHAR2(20) := 2 + 25 * 3;
BEGIN
    dbms_output.put_line(v);
END;
-----------------------===================-----------------------
DECLARE
    v_text     VARCHAR2(50) NOT NULL DEFAULT 'Hello';
    v_number1  NUMBER := 50;
    v_number2  NUMBER(2) := 50.42;
    v_number3  NUMBER(10, 2) := 50.42;
    v_number4  PLS_INTEGER := 50;
    v_number5  BINARY_FLOAT := 50.42;
    v_date1    DATE := '22-NOV-18 12:01:32';
    v_date2    TIMESTAMP := systimestamp;
    v_date3    TIMESTAMP(9) WITH TIME ZONE := systimestamp;
    v_date4    INTERVAL DAY ( 4 ) TO SECOND ( 3 ) := '124 02:05:21.012 ';
    v_date5    INTERVAL YEAR TO MONTH := '12-3';
BEGIN
    v_text := 'PL/SQL' || 'Course';
    dbms_output.put_line(v_text);
    dbms_output.put_line(v_number1);
    dbms_output.put_line(v_number2);
    dbms_output.put_line(v_number3);
    dbms_output.put_line(v_number4);
    dbms_output.put_line(v_number5);
    dbms_output.put_line(v_date1);
    dbms_output.put_line(v_date2);
    dbms_output.put_line(v_date3);
    dbms_output.put_line(v_date4);
    dbms_output.put_line(v_date5);
END;
----------------==================================---------------
----------------USING BOOLEAN DATA TYPE in PL/SQL----------------
----------------==================================---------------
DECLARE
    v_boolean BOOLEAN := true;
BEGIN
    dbms_output.put_line(sys.diutil.bool_to_int(v_boolean));
END;
----------------==================================-------------