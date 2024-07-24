--  מבט ראשון מנקודת מבט של המקור(חוגים) שמקבצת לקבוצה את מס הילדים בכל קבוצה את שם המורה ואת היום והשעה
CREATE OR REPLACE VIEW GROUPDETAILS AS
SELECT
    g.idGroup AS GroupID,
    COUNT(kig.idKid) AS NumberOfKids,
    t.name AS TeacherName,
    s.sday AS ScheduleDay,
    s.shour AS ScheduleHour
FROM
    Course_Group g
    LEFT JOIN Kid_In_Group kig ON g.idGroup = kig.idGroup
    LEFT JOIN group_in_schedulle gis ON g.idGroup = gis.idGroup
    LEFT JOIN Schedule s ON gis.idSchedule = s.idSchedule
    LEFT JOIN Teacher_In_Schedule tis ON s.idSchedule = tis.idSchedule
    LEFT JOIN Teachers t ON tis.idTeacher = t.idTeacher
GROUP BY
    g.idGroup,
    t.name,
    s.sday,
    s.shour;
