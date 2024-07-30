CREATE OR REPLACE FUNCTION GET_COURSES_FOR_TEACHER (teacher_id IN NUMBER)
RETURN SYS_REFCURSOR IS
  courses_cursor SYS_REFCURSOR;
BEGIN
  OPEN courses_cursor FOR
       select coursename 
       from course_has_teacher ct
       join courses c on ct.idcourse = c.idcourse
       where idteacher = teacher_id;
   

  RETURN courses_cursor;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    RETURN NULL;
END;
/
