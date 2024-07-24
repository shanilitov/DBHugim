select * 
from GradeDetails
where gradename = &some_grade_name;

select subjectname
from GradeDetails
where scheduleday = &some_day;
