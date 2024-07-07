CREATE OR REPLACE FUNCTION AVGARAGE_AGE_IN_GROUP (group_id IN NUMBER)
RETURN NUMBER IS
  avg_age NUMBER;
BEGIN
  SELECT AVG(TRUNC((SYSDATE - K.date_of_birth) / 365))
  INTO avg_age
  FROM KID_IN_GROUP KG
  LEFT JOIN KIDS K ON K.id_kid = KG.id_kid
  WHERE KG.id_group = group_id;

  RETURN avg_age;
END;
/
