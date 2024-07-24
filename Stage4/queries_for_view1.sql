select * 
form GROUPDETAILS
where teacherName = &teacher;

select groupId, teachername, numberofkids
from GROUPDETAILS
where scheduleday = &some_day
and schedulehour = &some_hour;
