-- יצירת טבלה TEACHERS
create table TEACHERS
(
  id_teacher    NUMBER(5) not null,
  t_name        VARCHAR2(15),
  date_of_birth DATE,
  phone         NUMBER(9) not null,
  address       VARCHAR2(15)
)
;
alter table TEACHERS
  add primary key (ID_TEACHER);
-- הכנסה לטבלת Teachers
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (3229, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (3230, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (3231, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (9157, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (1203, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (96794, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (39600, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (65750, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (5634, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (33809, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (16890, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (15575, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (13046, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (10896, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (29186, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (12978, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (89444, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (77857, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (23038, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (30575, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (61365, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (63453, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (44929, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (13055, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (17104, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (54085, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (19775, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (67226, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (33445, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (17923, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');

-- יצירת טבלה kids
create table KIDS
(
  id_kid        NUMBER(5) not null,
  k_name        VARCHAR2(15) not null,
  date_of_birth DATE,
  phone         NUMBER(9) not null,
  adress        VARCHAR2(15)
)
;
alter table KIDS
  add primary key (ID_KID);
-- הכנסה לטבלת Kids
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1001, 'Sophia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1002, 'Benjamin', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1003, 'Ryan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1004, 'Grace', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1005, 'Joshua', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1006, 'Isabella', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1007, 'Isabella', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1008, 'Elizabeth', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1009, 'Emma', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1010, 'Andrew', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1011, 'David', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1012, 'Gabriel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1013, 'Luke', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1014, 'Chloe', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1015, 'Noah', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1016, 'Ryan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1017, 'Amelia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1018, 'Samuel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1019, 'Scarlett', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1020, 'Evelyn', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1021, 'Harper', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1022, 'Ella', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1023, 'Nicholas', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1024, 'Ava', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1025, 'Alexander', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1026, 'Madison', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1027, 'James', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1028, 'Layla', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1029, 'Joseph', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1030, 'Olivia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1031, 'Samuel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1032, 'Christopher', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1033, 'Noah', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1034, 'Joseph', null, 527345656, 'Israel');


--  COURSES יצירת הטבלה
create table COURSES
(
  id_course   NUMBER(5) not null,
  course_name VARCHAR2(15) not null,
  price       FLOAT not null,
  age_min     INTEGER not null,
  age_max     INTEGER not null
);
alter table COURSES
  add primary key (ID_COURSE);
-- הכנסה לטבלת Courses
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8027, 'pottery', 180, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1523, 'yoga', 170, 11, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9642, 'photography', 177, 13, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3216, 'pottery', 193, 6, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2744, 'photography', 162, 8, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7333, 'fencing', 189, 9, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3064, 'yoga', 174, 10, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4336, 'photography', 199, 6, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5531, 'origami', 182, 10, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2593, 'yoga', 164, 8, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9655, 'gardening', 174, 10, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5642, 'salsa dancing', 155, 12, 14);

-- יצירת טבלה SCHEDULE
create table SCHEDULE
(
  s_hour      NUMBER(2) not null,
  s_day       VARCHAR2(15) not null,
  id_schedule NUMBER(5) not null
)
;
alter table SCHEDULE
  add primary key (ID_SCHEDULE);
-- הכנסה לטבלת Schedule
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Wednesday', 62066);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Monday', 71691);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Tuesday', 38310);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Monday', 58282);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Thursday', 78691);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Thursday', 71383);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Sunday', 40351);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Wednesday', 81306);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Thursday', 57157);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Monday', 28526);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Thursday', 56036);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Thursday', 55060);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Sunday', 94269);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Wednesday', 46263);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Wednesday', 25806);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Tuesday', 69408);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Wednesday', 78128);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Monday', 66523);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Wednesday', 58651);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Thursday', 76363);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Sunday', 23308);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Wednesday', 34990);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Sunday', 10550);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Thursday', 77636);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Tuesday', 11646);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Monday', 57408);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Tuesday', 84344);

--  COURSE_GROUP יצירת טבלה 
create table COURSE_GROUP
(
  id_group  INTEGER not null,
  id_course NUMBER(5) not null
)
;
alter table COURSE_GROUP
  add primary key (ID_GROUP);
alter table COURSE_GROUP
  add foreign key (ID_COURSE)
  references COURSES (ID_COURSE);
-- הכנסה לטבלת Course_Group
insert into COURSE_GROUP (id_group, id_course)
values (1000, 1112);
insert into COURSE_GROUP (id_group, id_course)
values (1001, 2840);
insert into COURSE_GROUP (id_group, id_course)
values (1002, 9760);
insert into COURSE_GROUP (id_group, id_course)
values (1003, 7611);
insert into COURSE_GROUP (id_group, id_course)
values (1004, 1485);
insert into COURSE_GROUP (id_group, id_course)
values (1005, 3141);
insert into COURSE_GROUP (id_group, id_course)
values (1006, 6337);
insert into COURSE_GROUP (id_group, id_course)
values (1007, 5770);
insert into COURSE_GROUP (id_group, id_course)
values (1008, 9472);
insert into COURSE_GROUP (id_group, id_course)
values (1009, 4336);
insert into COURSE_GROUP (id_group, id_course)
values (1010, 9994);
insert into COURSE_GROUP (id_group, id_course)
values (1011, 9217);
insert into COURSE_GROUP (id_group, id_course)
values (1012, 5097);
insert into COURSE_GROUP (id_group, id_course)
values (1013, 9757);
insert into COURSE_GROUP (id_group, id_course)
values (1014, 9850);

--
create table ROOMS
(
  id_room    NUMBER(5) not null,
  r_type     VARCHAR2(15) not null,
  r_location VARCHAR2(15) not null,
  id_group   INTEGER not null
)
;
alter table ROOMS
  add primary key (ID_ROOM);
alter table ROOMS
  add foreign key (ID_GROUP)
  references COURSE_GROUP (ID_GROUP);
-- הכנסה לטבלת Rooms
insert into ROOMS (id_room, r_type, r_location, id_group)
values (1, 'Pool', 'Room1111', 1286);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (2, 'Kitchen', 'Room1112', 1102);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (3, 'Lab', 'Room1113', 1116);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (4, 'Kitchen', 'Room1114', 1176);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (5, 'Lab', 'Room1115', 1119);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (6, 'Pool', 'Room1116', 1282);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (7, 'Kitchen', 'Room1117', 1003);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (8, 'Computers', 'Room1118', 1082);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (9, 'Computers', 'Room1119', 1372);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (10, 'Jym', 'Room1120', 1010);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (11, 'Pool', 'Room1121', 1337);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (12, 'Jym', 'Room1122', 1381);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (13, 'Computers', 'Room1123', 1349);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (14, 'Kitchen', 'Room1124', 1026);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (15, 'Jym', 'Room1125', 1058);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (16, 'Jym', 'Room1126', 1074);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (17, 'Pool', 'Room1127', 1286);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (18, 'Kitchen', 'Room1128', 1237);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (19, 'Computers', 'Room1129', 1310);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (20, 'Computers', 'Room1130', 1239);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (21, 'Jym', 'Room1131', 1148);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (22, 'Pool', 'Room1132', 1338);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (23, 'Jym', 'Room1133', 1043);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (24, 'Computers', 'Room1134', 1167);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (25, 'Kitchen', 'Room1135', 1239);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (26, 'Kitchen', 'Room1136', 1065);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (27, 'Kitchen', 'Room1137', 1242);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (28, 'Jym', 'Room1138', 1319);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (29, 'Computers', 'Room1139', 1053);
insert into ROOMS (id_room, r_type, r_location, id_group)
values (30, 'Kitchen', 'Room1140', 1268);

-- יצירת טבלה course_has_teachers
create table COURSE_HAS_TEACHER
(
  id_course  NUMBER(5) not null,
  id_teacher NUMBER(5) not null
)
;
alter table COURSE_HAS_TEACHER
  add primary key (ID_COURSE, ID_TEACHER);
alter table COURSE_HAS_TEACHER
  add foreign key (ID_COURSE)
  references COURSES (ID_COURSE);
alter table COURSE_HAS_TEACHER
  add foreign key (ID_TEACHER)
  references TEACHERS (ID_TEACHER);
-- הכנסה לטבלת Course_Has_Teacher
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (3216, 42866);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (3411, 36290);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (3567, 9157);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (3596, 16300);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (3718, 7465);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (3895, 62866);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (3973, 88459);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (4153, 96971);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (4447, 74076);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (4521, 51383);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (4623, 32101);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (4630, 44929);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (5497, 71659);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (5538, 35472);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (5575, 96490);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (5755, 65537);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (5862, 37566);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (6075, 18984);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (6816, 75182);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (6940, 18571);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (7073, 86375);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (7163, 95960);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (7336, 4164);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (7336, 14970);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (7543, 5634);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (8040, 78811);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (8104, 86375);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (8274, 83394);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (8421, 43117);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (8536, 74076);

--
create table PAYMENT
(
  id_payment     NUMBER(5) not null,
  payment_method VARCHAR2(15) not null,
  id_kid         NUMBER(5) not null,
  payment_sum    NUMBER(5),
  payment_date   DATE
)
;
alter table PAYMENT
  add primary key (ID_PAYMENT);
alter table PAYMENT
  add foreign key (ID_KID)
  references KIDS (ID_KID);
-- הכנסה לטבלת payment
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (1, 'Check', 1261, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (2, 'Cash', 1240, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (3, 'Bit', 1356, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (4, 'Check', 1063, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (5, 'PayBox', 1062, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (6, 'Check', 1202, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (7, 'Bit', 1148, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (8, 'Cash', 1209, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (9, 'Cash', 1103, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (10, 'Bit', 1196, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (11, 'Bit', 1065, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (12, 'Cash', 1075, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (13, 'Check', 1388, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (14, 'Cash', 1004, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (15, 'Check', 1132, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (16, 'Credit', 1183, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (17, 'Check', 1243, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (18, 'PayBox', 1208, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (19, 'Bit', 1082, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (20, 'Cash', 1295, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (21, 'Bit', 1077, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (22, 'Cash', 1005, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (23, 'Credit', 1176, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (24, 'Credit', 1184, null, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (25, 'Bit', 1252, null, null);

--
create table KID_IN_GROUP
(
  id_kid   NUMBER(5) not null,
  id_group INTEGER not null
)
;
alter table KID_IN_GROUP
  add primary key (ID_KID, ID_GROUP);
alter table KID_IN_GROUP
  add foreign key (ID_KID)
  references KIDS (ID_KID);
alter table KID_IN_GROUP
  add foreign key (ID_GROUP)
  references COURSE_GROUP (ID_GROUP);
-- הכנסה לטבלת Kid_In_Group
insert into KID_IN_GROUP (id_kid, id_group)
values (1262, 1151);
insert into KID_IN_GROUP (id_kid, id_group)
values (1267, 1349);
insert into KID_IN_GROUP (id_kid, id_group)
values (1269, 1112);
insert into KID_IN_GROUP (id_kid, id_group)
values (1296, 1021);
insert into KID_IN_GROUP (id_kid, id_group)
values (1302, 1326);
insert into KID_IN_GROUP (id_kid, id_group)
values (1303, 1274);
insert into KID_IN_GROUP (id_kid, id_group)
values (1307, 1119);
insert into KID_IN_GROUP (id_kid, id_group)
values (1321, 1128);
insert into KID_IN_GROUP (id_kid, id_group)
values (1337, 1277);
insert into KID_IN_GROUP (id_kid, id_group)
values (1340, 1008);
insert into KID_IN_GROUP (id_kid, id_group)
values (1363, 1382);
insert into KID_IN_GROUP (id_kid, id_group)
values (1397, 1279);

-- יצירת טבלה GROUP_IN_SCHEDULLE
create table GROUP_IN_SCHEDULLE
(
  id_group    INTEGER not null,
  id_schedule INTEGER not null
)
;
alter table GROUP_IN_SCHEDULLE
  add primary key (ID_GROUP);
alter table GROUP_IN_SCHEDULLE
  add foreign key (ID_GROUP)
  references COURSE_GROUP (ID_GROUP);
alter table GROUP_IN_SCHEDULLE
  add foreign key (ID_SCHEDULE)
  references SCHEDULE (ID_SCHEDULE);
-- הכנסה לטבלת group_In_Schedulle
insert into GROUP_IN_SCHEDULLE (id_group, id_schedule)
values (1090, 99757);
insert into GROUP_IN_SCHEDULLE (id_group, id_schedule)
values (1286, 23636);
insert into GROUP_IN_SCHEDULLE (id_group, id_schedule)
values (1045, 88172);
insert into GROUP_IN_SCHEDULLE (id_group, id_schedule)
values (1115, 10674);
insert into GROUP_IN_SCHEDULLE (id_group, id_schedule)
values (1072, 26826);
insert into GROUP_IN_SCHEDULLE (id_group, id_schedule)
values (1095, 17);
insert into GROUP_IN_SCHEDULLE (id_group, id_schedule)
values (1153, 99442);
insert into GROUP_IN_SCHEDULLE (id_group, id_schedule)
values (1378, 68536);
insert into GROUP_IN_SCHEDULLE (id_group, id_schedule)
values (1189, 56815);
insert into GROUP_IN_SCHEDULLE (id_group, id_schedule)
values (1183, 25852);
insert into GROUP_IN_SCHEDULLE (id_group, id_schedule)
values (1201, 38310);
insert into GROUP_IN_SCHEDULLE (id_group, id_schedule)
values (1074, 23763);
insert into GROUP_IN_SCHEDULLE (id_group, id_schedule)
values (1250, 86232);
insert into GROUP_IN_SCHEDULLE (id_group, id_schedule)
values (1046, 36387);
insert into GROUP_IN_SCHEDULLE (id_group, id_schedule)
values (1342, 96354);
insert into GROUP_IN_SCHEDULLE (id_group, id_schedule)
values (1380, 70967);
