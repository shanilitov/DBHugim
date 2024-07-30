DECLARE
  teacher_id NUMBER := 9157;
  courses_cursor SYS_REFCURSOR;
  course_name VARCHAR2(50);
  total_rows NUMBER;
  current_row NUMBER := 0;
  
  kid_id NUMBER := 1000;
  group_id NUMBER := 1009;
BEGIN
  add_kids_to_group(kid_id, group_id); 

  -- Get the ref cursor
  courses_cursor := GET_COURSES_FOR_TEACHER(teacher_id);

  -- Count the total number of rows
  EXECUTE IMMEDIATE
    'SELECT COUNT(*) FROM (SELECT C.coursename FROM COURSES C JOIN COURSE_HAS_TEACHER CT ON C.idcourse = CT.idcourse WHERE CT.idteacher = :teacher_id)' 
    INTO total_rows
    USING teacher_id;

  -- Output the total number of rows
  DBMS_OUTPUT.PUT_LINE('Total courses for teacher ' || teacher_id || ': ' || total_rows);

  -- Loop to fetch and print each row
  DBMS_OUTPUT.PUT_LINE('Fetching courses for teacher ' || teacher_id);
  LOOP
    FETCH courses_cursor INTO course_name;
    EXIT WHEN courses_cursor%NOTFOUND;
    current_row := current_row + 1;
    DBMS_OUTPUT.PUT_LINE('Course ' || current_row || ' of ' || total_rows || ': ' || course_name);
    -- Add a debugging line to confirm the loop is iterating correctly
    DBMS_OUTPUT.PUT_LINE('Debug: Fetched course name - ' || course_name);
  END LOOP;

  -- Confirmation message
  DBMS_OUTPUT.PUT_LINE('Finished fetching courses.');

  CLOSE courses_cursor;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred in the main program: ' || SQLERRM);
END;
