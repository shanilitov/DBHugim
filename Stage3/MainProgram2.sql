DECLARE
  course_id NUMBER := 1000;
  new_name VARCHAR2(50) := 'swimming';
  avg_age NUMBER;
BEGIN
  -- קריאה לפונקציה לחישוב גיל ממוצע בקורס
  avg_age := AVGARAGE_AGE_IN_GROUP(course_id);
  DBMS_OUTPUT.PUT_LINE('Average age in course ' || course_id || ': ' || avg_age);

  -- קריאה לפרוצדורה לעדכון שם קורס
  UPDATE_COURSE_NAME(course_id, new_name);
  DBMS_OUTPUT.PUT_LINE('Course name updated to: ' || new_name);
END;
