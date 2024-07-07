CREATE OR REPLACE FUNCTION TOTAL_PAYMENTS_BY_KID (kid_id IN NUMBER) 
RETURN NUMBER IS
  total_payment NUMBER;
BEGIN
  SELECT SUM(payment_sum)
  INTO total_payment
  FROM PAYMENT
  WHERE id_kid = kid_id;

  RETURN total_payment;
END;
/
