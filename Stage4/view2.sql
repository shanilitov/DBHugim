CREATE OR REPLACE VIEW GradeDetails AS
SELECT 
    g.grade_id AS GradeID,
    g.grade_name AS GradeName,
    c.id_class AS ClassID,
    COUNT(kig.idKid) AS NumberOfKids,
    s.sday AS ScheduleDay,
    s.shour AS ScheduleHour,
    t.name AS TeacherName,
    sub.subject_name AS SubjectName
FROM 
    Grade g
    JOIN classes c ON g.grade_id = c.grade_id
    LEFT JOIN kid_in_grade kig ON c.id_class = kig.grade_id
    LEFT JOIN class_has_schedule chs ON c.id_class = chs.id_class
    LEFT JOIN Schedule s ON chs.idSchedule = s.idSchedule
    LEFT JOIN Teacher_In_Schedule tis ON s.idSchedule = tis.idSchedule
    LEFT JOIN Teachers t ON tis.idTeacher = t.idTeacher
    LEFT JOIN class_has_subject chsub ON c.id_class = chsub.id_class
    LEFT JOIN Subject sub ON chsub.idSubject = sub.idSubject
GROUP BY 
    g.grade_id,
    g.grade_name,
    c.id_class,
    s.sday,
    s.shour,
    t.name,
    sub.subject_name;
