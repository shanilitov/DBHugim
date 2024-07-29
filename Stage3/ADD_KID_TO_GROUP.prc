CREATE OR REPLACE PROCEDURE ADD_KID_TO_GROUP (kid_id IN NUMBER, group_id IN NUMBER) IS
  v_group_count NUMBER;
BEGIN
  -- בדוק אם הקבוצה קיימת
  SELECT COUNT(*)
  INTO v_group_count
  FROM COURSE_GROUP
  WHERE idgroup = group_id;

  IF v_group_count = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Group ID ' || group_id || ' does not exist.');
    RETURN;
  END IF;

  -- הוסף את הילד לקבוצה
  INSERT INTO KID_IN_GROUP (idkid, idgroup)
  VALUES (kid_id, group_id);
  DBMS_OUTPUT.PUT_LINE('Kid ID ' || kid_id || ' added to group ID ' || group_id);

EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('The kid is already in this group.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
