-- Shows messages
SET SERVEROUTPUT ON;

-- Declaring bind variables
VARIABLE bound_var  VARCHAR2(20);
VARIABLE sub_var    VARCHAR2(20);

-- Declaring variables
DECLARE
    current_month   NUMBER;
    current_year    NUMBER;
    current_day		VARCHAR2(9);
    
    -- Set the data type to the data type
    -- of the matching column
    first_name          employees.first_name%TYPE;
    foo                 NUMBER;
    fifth_first_name    customers.customer_first_name%TYPE;
    char_alignment      characters.alignment%TYPE;
    
    -- Declare a cursor
    CURSOR char_cursor IS 
        SELECT character_id, primary_class, alignment FROM characters
        WHERE LOWER(race) LIKE ('%dark elf%');
        
    -- Declare a nested table
    TYPE employee_names_array   IS TABLE OF VARCHAR2(50);
    employee_name               employee_names_array := employee_names_array('Ralph', 'Olivia', 'Robert', 'Rhea');
    -- Instead of TABLE, we could've made this a VARRAY
    -- but then we would've needed to declare a fixed length, and couldn't add to it.
    
    -- Declare an associative array
    TYPE colour_scheme          IS TABLE OF VARCHAR2(50)
                                INDEX BY VARCHAR2(50);
    colours                     colour_scheme;
    
    TYPE character_array        IS TABLE OF VARCHAR2(300)
                                INDEX BY BINARY_INTEGER;
    feats_arr                   character_array;
    
    name_check              VARCHAR(500);
    vendor_name_to_check    VARCHAR(20);

-- The code that gets run. Since this block
-- doesn't have a name, it is "anonymous", unlike
-- blocks stored in the database itself, 
-- which we'll cover later.

BEGIN
	DBMS_OUTPUT.PUT_LINE('This is how you print.' || CHR(10));
    DBMS_OUTPUT.PUT_LINE('So if we wanted to get the month, we could just say it''s ' || EXTRACT(MONTH FROM SYSDATE));

    -- Let's use an if statement
    IF EXTRACT(MONTH FROM SYSDATE) = 10 THEN
	    DBMS_OUTPUT.PUT_LINE('Happy Hallowe''en' || CHR(10));
	ELSIF EXTRACT(MONTH FROM SYSDATE) = 12 THEN
		DBMS_OUTPUT.PUT_LINE('Happy Holidays' || CHR(10));
	ELSE
		DBMS_OUTPUT.PUT_LINE('Happy ' || TO_CHAR(SYSDATE, 'Day') || CHR(10));
    END IF;
    
    -- But that's a lot of repetition. 
    -- Let's use variables to make that statement more concise
    current_month := EXTRACT(MONTH FROM SYSDATE);
    current_year := EXTRACT(YEAR FROM SYSDATE);
    current_day	:= TO_CHAR(SYSDATE, 'Day');
    
    -- Let's use an if statement
    IF current_month = 2 THEN
	    DBMS_OUTPUT.PUT_LINE('Happy Valentine''s Day' || CHR(10));
	ELSIF current_year = 2019 THEN
		DBMS_OUTPUT.PUT_LINE('Happy New Year!' || CHR(10));
	ELSE
		DBMS_OUTPUT.PUT_LINE('Have a good ' || current_day || CHR(10));
    END IF;
    
    -- But if we're only testing against one
    -- variable, we can use a case statement
    CASE current_month
        WHEN 1 THEN
            DBMS_OUTPUT.PUT_LINE('Brrrr!' || CHR(10));
        WHEN 4 THEN
            DBMS_OUTPUT.PUT_LINE('Put away that winter coat' || CHR(10));
        WHEN 7 THEN
            DBMS_OUTPUT.PUT_LINE('Don''t forget the sunscreen!' || CHR(10));
        ELSE
            DBMS_OUTPUT.PUT_LINE('You''re a grown-up, wear whatever you like.' || CHR(10));
    END CASE;
    
    
    -- So that's a case statement. But what about a loop?
    -- And when do we start incorporating the actual data from 
    -- the database?
    FOR i IN (SELECT employee_id, first_name FROM employees) LOOP
        DBMS_OUTPUT.PUT_LINE('What''s up, ' || i.first_name || '?');
    END LOOP;
    
    -- Cool cool. So that's a for loop getting data from a table.
    -- What about a while loop that actually updates a table?
    foo := 1;
    WHILE foo < 6 LOOP
        UPDATE customers 
        SET customer_first_name = 'George'
        WHERE customer_id = foo;
        foo := foo + 1;
    END LOOP;
    
    -- Let's check to see if our DML worked
    SELECT customer_first_name 
    INTO fifth_first_name
    FROM customers
    WHERE customer_id = 5;
    
    DBMS_OUTPUT.PUT_LINE(CHR(10) || 'We set their names to ' || fifth_first_name || CHR(10));
    
    -- Let's try using a cursor
    char_alignment := 'Lawful neutral';
    
    FOR char_row IN char_cursor LOOP
        IF (char_row.alignment IS NULL) THEN
            UPDATE characters 
            SET alignment = char_alignment
            WHERE character_id = char_row.character_id;
    
    -- It's a great idea to output the results with DBMS_OUTPUT inside your loop
        DBMS_OUTPUT.PUT_LINE('Updated the alignment of ' || char_row.character_id || ' (a ' || char_row.primary_class || ') to ' || char_alignment || '.');
        
        END IF;
    END LOOP;
    
    -- Collections
    IF (employee_name.COUNT = 4) THEN
        employee_name.EXTEND(1);
        employee_name(5) := 'Paulo';
    END IF;
    
    FOR i IN 1..employee_name.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Get a birthday card for ' || employee_name(i));
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(CHR(10));

    colours('Blue') := 'Dining room table';
    colours('Salmon') := 'Flatware';
    colours('Burgundy') := 'Table linens';
    
    DBMS_OUTPUT.PUT_LINE('The ' || LOWER(colours('Salmon')) || ' should be salmon coloured.' || CHR(10));

    SELECT DISTINCT feats
    BULK COLLECT INTO feats_arr
    FROM characters
    WHERE charisma > 10;
    
    FOR i IN 1..feats_arr.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Collected ' || feats_arr(i));
    END LOOP;
    
    :sub_var := '&sub_var';
    
    DBMS_OUTPUT.PUT_LINE('You could do Madlibs in PL/SQL, but that would be ' || :sub_var || CHR(10));
    
    :bound_var := 'bind variables';
    
    DBMS_OUTPUT.PUT_LINE('Most variables are scoped to their block, but not ' || :bound_var || CHR(10));
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('Look at me using ' || :bound_var || ' in different blocks!');
END;
