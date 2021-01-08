----------------- A standard procedure creation with a default value
    CREATE OR REPLACE PROCEDURE print (
    text IN VARCHAR2 := 'This is the print function!.'
) IS
BEGIN
    dbms_output.put_line(text);
END;
    -----------------Executing a procedure without any parameter. It runs because it has a default value.
    EXEC print();
    -----------------Running a procedure with null value will not use the default value 
    EXEC print(NULL);
    -----------------Procedure creation of a default value usage
    CREATE OR REPLACE PROCEDURE add_job (
    job_id      PLS_INTEGER,
    job_title   VARCHAR2,
    min_salary  NUMBER DEFAULT 1000,
    max_salary  NUMBER DEFAULT NULL
) IS
BEGIN
    INSERT INTO jobs VALUES (
        job_id,
        job_title,
        min_salary,
        max_salary
    );

    print('The job : '
          || job_title
          || ' is inserted!..');
END;
-----------------A standard run of the procedure
    EXEC add_job('IT_DIR', 'IT Director', 5000, 20000); 
-----------------Running a procedure with using the default values
    EXEC add_job('IT_DIR2', 'IT Director', 5000); 
    -----------------Running a procedure with the named notation
    EXEC add_job('IT_DIR5', 'IT Director',
max_salary => 10000); 
    -----------------Running a procedure with the named notation example 2
    EXEC add_job(job_title => 'IT Director', job_id => 'IT_DIR7', max_salary => 10000, min_salary => 500);