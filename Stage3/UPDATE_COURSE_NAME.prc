CREATE OR REPLACE PROCEDURE UPDATE_COURSE_NAME (course_id IN NUMBER, new_name IN VARCHAR2) IS
BEGIN
  UPDATE COURSES
  SET course_name = new_name
  WHERE id_course = course_id;
END;
/
