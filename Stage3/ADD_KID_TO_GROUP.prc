CREATE OR REPLACE PROCEDURE ADD_KID_TO_GROUP (kid_id IN NUMBER, group_id IN NUMBER) IS
BEGIN
  INSERT INTO KID_IN_GROUP (id_kid, id_group)
  VALUES (kid_id, group_id);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('The kid is already in this group.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
