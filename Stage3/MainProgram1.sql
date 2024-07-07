BEGIN
  -- קריאה לפונקציה לחישוב סך התשלומים על ידי ילד
  DECLARE
    total_payment NUMBER;
  BEGIN
    total_payment := TOTAL_PAYMENTS_BY_KID(1261);
    DBMS_OUTPUT.PUT_LINE('Total payments by kid 1261: ' || total_payment);
  END;

  -- קריאה לפרוצדורה להוספת ילד לקבוצה
  ADD_KID_TO_GROUP(1000, 1000);
END;
