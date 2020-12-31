# The Complete PL/SQL Bootcamp: "Beginner to Advanced PL/SQL"

---

```bash
docker run --name orac --restart always -d -p 49161:1521 -e ORACLE_DISABLE_ASYNCH_IO=true oracleinanutshell/oracle-xe-11g
````

### Default values

hostname: localhost
port: 49161
sid: xe
username: system
password: oracle

### Starting code

1. In PL/SQL we need write your code in blocks

* BLOCKS
  * DECLARE (Optional)
  * BEGIN (Mandatory)
  * EXCEPTION (Optional)
  *END; (Mandatory)

* Three block types
  * Anonymous Blocks
  * Procedures
  * Functions

* PL/SQL Variable Types
  
  * Scalar
    CHAR (max_length)
    VARCHAR2 (max_length)
    NUMBER [precision, sale]
    BINARY_INTEGER = PLSINTEGER
    BINARY_FLOAT
    BINARY_DOUBLE
    BOOLEAN
    DATE
    TIMESTAMP
    TIMESTAMP(p) with time zone
    INTERVAL

  * Reference

  * Large Objects

  * Composite

### Variable Conventions

* VARIABLE         - v_variable_name
* CURSOR           - cur_cursor_name
* EXCEPTION        - e_exception_name
* PROCEDURE        - p_procedure_name
* BIND VARIABLE    - b_bind_name

### Bind variables
* Increase the performance
* Created in the host environment

### Composite Types
* Records - Represents one entire record of table just one row
* Nested tables store data within indexes starting increasing by index
* Varrays works like predefined bounded length array
* Associated Arrays index by any value positive or negative
* In memory tables used to work with DML DDL etc in memory way