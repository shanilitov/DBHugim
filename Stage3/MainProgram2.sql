DECLARE
  course_id NUMBER := 1000;
  new_name VARCHAR2(50) := 'swimming';
  avg_age NUMBER;
BEGIN
  -- ����� �������� ������ ��� ����� �����
  avg_age := AVGARAGE_AGE_IN_GROUP(course_id);
  DBMS_OUTPUT.PUT_LINE('Average age in course ' || course_id || ': ' || avg_age);

  -- ����� ��������� ������ �� ����
  UPDATE_COURSE_NAME(course_id, new_name);
  DBMS_OUTPUT.PUT_LINE('Course name updated to: ' || new_name);
END;
