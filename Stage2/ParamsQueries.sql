-- ParamsQueries.sql

-- שאילתא 1
-- שאילתה שמחזירה את כל המורים שנולדו אחרי תאריך מסוים ושמם מתחיל באות "D".
SELECT *
FROM Teachers
WHERE date_Of_Birth > TO_DATE(&some_date, 'YYYY-MM-DD')  -- כאן יכנס תאריך פרמטר
  AND t_name LIKE 'D%';  

--שאילתא 2
--שאילתה שמחזירה את כל הילדים שנולדו בין שני תאריכים נתונים.
SELECT *
FROM Kids
WHERE date_of_birth BETWEEN TO_DATE(&some_date, 'YYYY-MM-DD') AND TO_DATE(&some_date, 'YYYY-MM-DD');

-- שאילתא 3
--שאילתה שמחזירה את כל הקורסים שעלותם בטווח מחירים נתון ושהם מתאימים לקבוצות גיל שונות.
SELECT *
FROM Courses
WHERE price BETWEEN &num1 AND &num2  -- כאן ייכנסו מחירי מינימום ומקסימום כפרמטרים
  AND age_Min >= &age1  -- כאן ייכנס גיל מינימלי כפרמטר
  AND age_Max <= &age2;  -- כאן ייכנס גיל מקסימלי כפרמטר

-- שאילתא 4: שאילתת SELECT עם רמז (hint)
--שאילתה שמחזירה את כל השעות בלוח זמנים של קבוצות מסוימות, תוך שימוש ברמז לשיפור הביצועים.
SELECT /*+ INDEX(group_In_Schedulle idx_group_schedule) */
  s_hour, s_day
FROM Schedule
JOIN group_In_Schedulle ON Schedule.id_Schedule = group_In_Schedulle.id_Schedule
WHERE group_In_Schedulle.Id_Group = &group_id;  -- כאן ייכנס מזהה קבוצה כפרמטר
