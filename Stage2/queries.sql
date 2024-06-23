-- 4 ùàéìúåú SELECT

-- ùàéìúà äîöéâä àú îñôø äéìãéí áëì ÷áåöú ÷åøñ òí îéåï ìôé îñôø äéìãéí áñãø éåøã
SELECT CG.id_Course, C.Course_Name, COUNT(KG.id_Kid) AS NumberOfKids
FROM Course_Group as CG
JOIN Kid_In_Group as KG ON CG.Id_Group = KG.Id_Group
JOIN Courses as C ON CG.id_Course = C.id_Course
GROUP BY CG.id_Course, C.Course_Name
ORDER BY NumberOfKids DESC;

-- ùàéìúà äîöéâä àú îñôø äéìãéí áëì ÷áåöú ÷åøñ ìôé éåí åùòä:
SELECT S.s_day, S.s_hour, CG.id_Course, C.Course_Name, COUNT(KG.id_Kid) AS NumberOfKids
FROM group_In_Schedulle GS
LEFT JOIN Schedule S ON GS.id_Schedule = S.id_Schedule
LEFT JOIN Course_Group CG ON GS.Id_Group = CG.Id_Group
LEFT JOIN Courses C ON CG.id_Course = C.id_Course
LEFT JOIN Kid_In_Group KG ON CG.Id_Group = KG.Id_Group
GROUP BY S.s_day, S.s_hour, CG.id_Course, C.Course_Name
ORDER BY S.s_day, S.s_hour;

-- ùàéìúà äîöéâä àú ôøèé ëì äîåøéí òí îñôø ä÷åøñéí ùäí îìîãéí åîñôø äúìîéãéí áëì ÷åøñ:
SELECT 
    T.id_Teacher, 
    T.t_name, 
    T.phone, 
    C.id_Course, 
    C.Course_Name, 
    COUNT(KG.id_Kid) AS NumberOfKids
FROM 
    Teachers T
JOIN 
    Course_Has_Teacher CHT ON T.id_Teacher = CHT.id_Teacher
JOIN 
    Courses C ON CHT.id_Course = C.id_Course
JOIN 
    Course_Group CG ON C.id_Course = CG.id_Course
JOIN 
    Kid_In_Group KG ON CG.Id_Group = KG.Id_Group
GROUP BY 
    T.id_Teacher, 
    T.t_name, 
    T.phone, 
    C.id_Course, 
    C.Course_Name
ORDER BY 
    T.t_name, 
    C.Course_Name;


-- ùàéìúà äîöéâä àú äúùìåîéí äàçøåðéí (ìôé úàøéê) ùáåöòå òáåø ëììã:
SELECT 
    K.k_name, 
    P.id_Payment, 
    P.payment_Method, 
    MAX(P.payment_Date) AS Last_Payment_Date
FROM 
    Kids K
JOIN 
    payment P ON K.id_Kid = P.id_Kid
GROUP BY 
    K.k_name, 
    P.id_Payment, 
    P.payment_Method
ORDER BY 
    Last_Payment_Date DESC;


-- 2 ùàéìúåú DELETE
-- מחיקת המערכת חוגים אם יש חוג שיש לו מערכת שכבר קיימת:
Delete from group_in_schedulle g1
where 1 < (select count(g2.id_schedule)
           from group_in_schedulle g2
           where g1.id_schedule = g2.id_schedule);

-- îçé÷ú ëì äîåøéí ùìà î÷åùøéí ìùåí ÷åøñ:
DELETE FROM Teachers
WHERE id_Teacher NOT IN (SELECT DISTINCT id_Teacher FROM Course_Has_Teacher);


-- 2 ùàéìúåú UPDATE
-- òãëåï äîçéø ùì ëì ä÷åøñéí ùîùåéëéí ì÷áåöä òí éåúø î-10 éìãéí á-5%:
UPDATE Courses
SET price = price * 1.05
WHERE id_Course IN (
    SELECT id_Course 
    FROM Course_Group CG
    JOIN Kid_In_Group KG ON CG.Id_Group = KG.Id_Group
    GROUP BY id_Course
    HAVING COUNT(KG.id_Kid) > 10
);

-- ùàéìúä ùîåñéôä äðçä ìëì ä÷åøñéí ùàéï ìäí úìîéãéí òãéï.
UPDATE Courses
SET price = price * 0.85
WHERE id_Course IN (
    SELECT C.id_Course
    FROM Courses C
    LEFT JOIN Course_Group CG ON C.id_Course = CG.id_Course
    LEFT JOIN Kid_In_Group KG ON CG.Id_Group = KG.Id_Group
    WHERE KG.id_Kid IS NULL
);




