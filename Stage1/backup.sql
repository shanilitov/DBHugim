prompt PL/SQL Developer import file
prompt Created on יום ראשון 02 יוני 2024 by shani
set feedback off
set define off
prompt Creating COURSES...
create table COURSES
(
  id_course   NUMBER(5) not null,
  course_name VARCHAR2(15) not null,
  price       FLOAT not null,
  age_min     INTEGER not null,
  age_max     INTEGER not null
)
;
alter table COURSES
  add primary key (ID_COURSE);

prompt Creating COURSE_GROUP...
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

prompt Creating TEACHERS...
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

prompt Creating COURSE_HAS_TEACHER...
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

prompt Creating SCHEDULE...
create table SCHEDULE
(
  s_hour      NUMBER(2) not null,
  s_day       VARCHAR2(15) not null,
  id_schedule NUMBER(5) not null
)
;
alter table SCHEDULE
  add primary key (ID_SCHEDULE);

prompt Creating GROUP_IN_SCHEDULLE...
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

prompt Creating KIDS...
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

prompt Creating KID_IN_GROUP...
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

prompt Creating PAYMENT...
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

prompt Creating ROOMS...
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

prompt Loading COURSES...
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
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8661, 'salsa dancing', 187, 13, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1974, 'photography', 169, 7, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9757, 'karate', 170, 10, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7543, 'photography', 198, 12, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3867, 'pottery', 184, 9, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7498, 'pottery', 181, 9, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7852, 'pottery', 183, 6, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3705, 'karate', 174, 10, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4004, 'pottery', 153, 12, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4259, 'origami', 156, 8, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2541, 'photography', 180, 9, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2660, 'photography', 150, 12, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4837, 'gardening', 167, 8, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3442, 'photography', 172, 10, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6449, 'gardening', 152, 7, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7069, 'origami', 187, 13, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3984, 'fencing', 180, 12, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1495, 'origami', 196, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7253, 'karate', 199, 13, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9748, 'salsa dancing', 177, 13, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7073, 'pottery', 187, 6, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4884, 'pottery', 198, 6, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3464, 'karate', 195, 7, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3596, 'salsa dancing', 161, 9, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8117, 'origami', 173, 11, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4920, 'karate', 175, 9, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9078, 'pottery', 189, 6, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2840, 'yoga', 176, 11, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5775, 'pottery', 176, 13, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8104, 'photography', 174, 6, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2181, 'salsa dancing', 164, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8648, 'gardening', 181, 9, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9850, 'karate', 190, 9, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6746, 'origami', 153, 8, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7726, 'origami', 200, 8, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7911, 'photography', 151, 7, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5726, 'calligraphy', 180, 12, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3701, 'gardening', 194, 6, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5770, 'calligraphy', 194, 6, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1726, 'fencing', 164, 12, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1221, 'karate', 168, 13, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5038, 'yoga', 191, 12, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2696, 'photography', 157, 6, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8286, 'salsa dancing', 187, 7, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9076, 'yoga', 183, 12, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5125, 'photography', 151, 12, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5377, 'gardening', 162, 7, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8421, 'karate', 173, 9, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4725, 'gardening', 188, 9, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5224, 'calligraphy', 178, 7, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5146, 'pottery', 182, 8, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6654, 'pottery', 181, 9, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4305, 'gardening', 151, 9, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3063, 'photography', 160, 8, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3824, 'yoga', 152, 8, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4077, 'pottery', 153, 10, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5064, 'karate', 181, 8, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5981, 'fencing', 170, 10, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3553, 'salsa dancing', 176, 7, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7287, 'origami', 198, 7, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8995, 'calligraphy', 157, 10, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9143, 'karate', 170, 12, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6705, 'yoga', 189, 11, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8555, 'pottery', 179, 13, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2725, 'yoga', 190, 10, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4283, 'fencing', 162, 10, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3567, 'calligraphy', 182, 6, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9134, 'fencing', 168, 8, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8542, 'salsa dancing', 170, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5365, 'fencing', 194, 9, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9691, 'origami', 181, 6, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9493, 'fencing', 187, 10, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6977, 'pottery', 162, 12, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6816, 'yoga', 175, 13, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7611, 'photography', 172, 12, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1516, 'salsa dancing', 158, 8, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3192, 'origami', 176, 6, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2257, 'karate', 187, 11, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4965, 'yoga', 166, 10, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5842, 'gardening', 163, 6, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9221, 'calligraphy', 160, 10, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2955, 'origami', 188, 10, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8452, 'karate', 198, 8, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9938, 'photography', 157, 10, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1149, 'fencing', 190, 11, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9650, 'calligraphy', 176, 11, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9991, 'fencing', 190, 8, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1153, 'yoga', 167, 7, 16);
commit;
prompt 100 records committed...
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8572, 'origami', 159, 10, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6620, 'pottery', 153, 13, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7302, 'calligraphy', 189, 13, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2730, 'gardening', 154, 8, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5716, 'photography', 196, 11, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3527, 'gardening', 167, 11, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7298, 'karate', 159, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7197, 'karate', 190, 9, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4966, 'salsa dancing', 182, 10, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2961, 'calligraphy', 163, 10, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1922, 'salsa dancing', 174, 9, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6940, 'pottery', 159, 9, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5342, 'photography', 173, 11, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1749, 'origami', 175, 7, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2559, 'salsa dancing', 195, 8, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5470, 'pottery', 176, 13, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5960, 'yoga', 150, 10, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6337, 'calligraphy', 174, 11, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9692, 'yoga', 151, 7, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9086, 'gardening', 158, 10, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3198, 'salsa dancing', 169, 10, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7760, 'calligraphy', 154, 13, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3496, 'photography', 200, 12, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4353, 'yoga', 178, 7, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1878, 'salsa dancing', 167, 9, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4673, 'karate', 175, 12, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8362, 'origami', 157, 6, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1261, 'photography', 194, 11, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3209, 'salsa dancing', 178, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6632, 'fencing', 161, 8, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5297, 'fencing', 160, 6, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9906, 'origami', 151, 7, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6199, 'salsa dancing', 160, 12, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4678, 'origami', 171, 6, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3569, 'photography', 179, 9, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9105, 'gardening', 192, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9472, 'fencing', 160, 7, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8209, 'origami', 177, 10, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3074, 'salsa dancing', 164, 13, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9387, 'calligraphy', 171, 10, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8040, 'yoga', 193, 6, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2664, 'gardening', 175, 8, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3323, 'salsa dancing', 173, 7, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1473, 'calligraphy', 153, 11, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4555, 'pottery', 179, 7, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8172, 'salsa dancing', 183, 12, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6732, 'gardening', 192, 6, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5497, 'pottery', 161, 8, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9442, 'photography', 184, 13, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9359, 'salsa dancing', 159, 7, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9193, 'yoga', 163, 12, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8829, 'fencing', 150, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4447, 'salsa dancing', 200, 9, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9306, 'calligraphy', 178, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7715, 'photography', 168, 13, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5755, 'fencing', 157, 6, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6950, 'salsa dancing', 171, 10, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1914, 'yoga', 180, 13, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4481, 'salsa dancing', 177, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4029, 'photography', 193, 13, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2156, 'salsa dancing', 190, 6, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4153, 'pottery', 155, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4816, 'karate', 194, 6, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2654, 'gardening', 184, 11, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2235, 'gardening', 151, 9, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4335, 'photography', 155, 13, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7936, 'gardening', 173, 6, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9247, 'salsa dancing', 182, 13, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8274, 'calligraphy', 181, 8, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8536, 'salsa dancing', 157, 6, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2716, 'photography', 153, 9, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2202, 'origami', 190, 10, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6665, 'karate', 151, 11, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2739, 'yoga', 159, 11, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8627, 'origami', 152, 6, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3026, 'gardening', 167, 12, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8870, 'fencing', 183, 8, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8332, 'pottery', 189, 7, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1926, 'calligraphy', 187, 7, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7112, 'salsa dancing', 188, 7, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1976, 'photography', 184, 6, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2899, 'karate', 185, 7, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7931, 'gardening', 169, 8, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6075, 'pottery', 187, 6, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4783, 'fencing', 159, 11, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5097, 'fencing', 181, 9, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1689, 'gardening', 199, 10, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4521, 'karate', 154, 6, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6497, 'fencing', 199, 9, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3141, 'origami', 194, 11, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6353, 'karate', 152, 11, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9868, 'gardening', 183, 7, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7163, 'pottery', 178, 12, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5947, 'photography', 188, 9, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1586, 'fencing', 158, 13, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2180, 'fencing', 167, 10, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9382, 'pottery', 153, 6, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1667, 'photography', 186, 8, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4266, 'origami', 200, 10, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3488, 'pottery', 177, 13, 13);
commit;
prompt 200 records committed...
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2882, 'salsa dancing', 175, 6, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4630, 'karate', 195, 12, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1702, 'karate', 197, 6, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1816, 'origami', 154, 8, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2358, 'yoga', 157, 8, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8032, 'salsa dancing', 157, 6, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4993, 'gardening', 167, 7, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8827, 'photography', 190, 9, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3796, 'gardening', 190, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9495, 'origami', 178, 13, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5538, 'fencing', 195, 13, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7358, 'fencing', 192, 6, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4996, 'yoga', 161, 7, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8009, 'pottery', 182, 9, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9182, 'yoga', 152, 9, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8167, 'gardening', 190, 8, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7739, 'calligraphy', 188, 9, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6516, 'fencing', 184, 13, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1485, 'gardening', 193, 10, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3511, 'yoga', 152, 8, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4970, 'yoga', 167, 7, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5624, 'origami', 170, 6, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5888, 'gardening', 191, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8646, 'yoga', 152, 9, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9217, 'karate', 183, 10, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8037, 'origami', 155, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2374, 'origami', 163, 13, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7184, 'karate', 171, 11, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8356, 'fencing', 174, 8, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9293, 'photography', 162, 6, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1333, 'karate', 158, 12, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7650, 'karate', 167, 10, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3302, 'gardening', 156, 11, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1940, 'fencing', 200, 13, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5487, 'gardening', 192, 10, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4975, 'photography', 196, 10, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9301, 'fencing', 174, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3973, 'photography', 184, 12, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3411, 'fencing', 195, 9, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8483, 'photography', 152, 8, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5679, 'karate', 156, 9, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4525, 'yoga', 179, 10, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3895, 'karate', 152, 13, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7865, 'yoga', 182, 8, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4552, 'calligraphy', 176, 6, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6997, 'photography', 175, 7, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8892, 'yoga', 193, 9, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8862, 'fencing', 171, 9, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4717, 'gardening', 150, 11, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5228, 'pottery', 175, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1479, 'origami', 165, 6, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2388, 'origami', 197, 8, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1630, 'origami', 152, 11, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5601, 'fencing', 200, 6, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5283, 'pottery', 184, 10, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6868, 'pottery', 175, 9, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7734, 'fencing', 159, 13, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9487, 'photography', 161, 11, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4407, 'photography', 172, 11, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9760, 'fencing', 152, 10, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9915, 'fencing', 170, 9, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3054, 'salsa dancing', 191, 13, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8846, 'gardening', 184, 10, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8823, 'calligraphy', 183, 6, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7755, 'photography', 183, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7049, 'origami', 167, 11, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1825, 'photography', 182, 6, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2335, 'origami', 181, 11, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9994, 'photography', 183, 11, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4227, 'karate', 185, 9, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1469, 'pottery', 189, 12, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7316, 'fencing', 171, 13, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3194, 'pottery', 191, 11, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3876, 'fencing', 151, 9, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6176, 'yoga', 178, 10, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3298, 'fencing', 175, 10, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3999, 'karate', 180, 9, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8137, 'pottery', 163, 11, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1127, 'karate', 164, 9, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5467, 'salsa dancing', 176, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6989, 'fencing', 191, 7, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1157, 'gardening', 185, 13, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5932, 'origami', 189, 10, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8650, 'karate', 153, 7, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2636, 'yoga', 162, 10, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6986, 'origami', 188, 11, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1090, 'photography', 159, 10, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3570, 'gardening', 199, 10, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5328, 'pottery', 199, 6, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1422, 'yoga', 182, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1118, 'photography', 181, 6, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3698, 'yoga', 171, 8, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3517, 'origami', 169, 8, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9239, 'photography', 190, 8, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4623, 'photography', 192, 11, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7860, 'karate', 170, 12, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7336, 'yoga', 176, 12, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9892, 'pottery', 197, 12, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5856, 'fencing', 186, 7, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9212, 'fencing', 180, 12, 18);
commit;
prompt 300 records committed...
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9240, 'yoga', 165, 13, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3450, 'pottery', 165, 8, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6239, 'yoga', 173, 7, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7174, 'origami', 180, 7, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9291, 'origami', 172, 8, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8155, 'salsa dancing', 153, 6, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3844, 'gardening', 177, 11, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5440, 'salsa dancing', 190, 13, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6064, 'karate', 179, 8, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4922, 'calligraphy', 166, 13, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1041, 'karate', 165, 11, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9805, 'origami', 189, 6, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2123, 'pottery', 153, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1737, 'karate', 181, 9, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7475, 'pottery', 182, 12, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8563, 'photography', 173, 11, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1112, 'gardening', 150, 6, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1209, 'yoga', 188, 13, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9309, 'yoga', 167, 11, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4664, 'salsa dancing', 159, 12, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8346, 'salsa dancing', 171, 9, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5857, 'fencing', 151, 12, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3634, 'origami', 156, 9, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5160, 'karate', 166, 9, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3928, 'yoga', 184, 13, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2606, 'origami', 157, 11, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5995, 'fencing', 200, 12, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4328, 'origami', 192, 11, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5862, 'calligraphy', 163, 7, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8849, 'origami', 155, 11, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4934, 'photography', 188, 9, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3718, 'pottery', 152, 7, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5433, 'karate', 164, 11, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9869, 'gardening', 191, 7, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6658, 'photography', 173, 6, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5151, 'gardening', 172, 8, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4416, 'salsa dancing', 171, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4898, 'salsa dancing', 184, 13, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5575, 'origami', 175, 12, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7491, 'pottery', 184, 13, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9119, 'gardening', 172, 6, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8810, 'pottery', 185, 11, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3021, 'origami', 199, 13, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9640, 'fencing', 175, 12, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8958, 'fencing', 192, 6, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2824, 'origami', 162, 11, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7189, 'photography', 195, 6, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4158, 'salsa dancing', 152, 10, 17);
commit;
prompt 348 records loaded
prompt Loading COURSE_GROUP...
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
insert into COURSE_GROUP (id_group, id_course)
values (1015, 5842);
insert into COURSE_GROUP (id_group, id_course)
values (1016, 8137);
insert into COURSE_GROUP (id_group, id_course)
values (1017, 4521);
insert into COURSE_GROUP (id_group, id_course)
values (1018, 4934);
insert into COURSE_GROUP (id_group, id_course)
values (1019, 8572);
insert into COURSE_GROUP (id_group, id_course)
values (1020, 3999);
insert into COURSE_GROUP (id_group, id_course)
values (1021, 3569);
insert into COURSE_GROUP (id_group, id_course)
values (1022, 8829);
insert into COURSE_GROUP (id_group, id_course)
values (1023, 3824);
insert into COURSE_GROUP (id_group, id_course)
values (1024, 3876);
insert into COURSE_GROUP (id_group, id_course)
values (1025, 9757);
insert into COURSE_GROUP (id_group, id_course)
values (1026, 4837);
insert into COURSE_GROUP (id_group, id_course)
values (1027, 8536);
insert into COURSE_GROUP (id_group, id_course)
values (1028, 9493);
insert into COURSE_GROUP (id_group, id_course)
values (1029, 8362);
insert into COURSE_GROUP (id_group, id_course)
values (1030, 7302);
insert into COURSE_GROUP (id_group, id_course)
values (1031, 1974);
insert into COURSE_GROUP (id_group, id_course)
values (1032, 1825);
insert into COURSE_GROUP (id_group, id_course)
values (1033, 1469);
insert into COURSE_GROUP (id_group, id_course)
values (1034, 8646);
insert into COURSE_GROUP (id_group, id_course)
values (1035, 8172);
insert into COURSE_GROUP (id_group, id_course)
values (1036, 8870);
insert into COURSE_GROUP (id_group, id_course)
values (1037, 1422);
insert into COURSE_GROUP (id_group, id_course)
values (1038, 9642);
insert into COURSE_GROUP (id_group, id_course)
values (1039, 2257);
insert into COURSE_GROUP (id_group, id_course)
values (1040, 3867);
insert into COURSE_GROUP (id_group, id_course)
values (1041, 4975);
insert into COURSE_GROUP (id_group, id_course)
values (1042, 1090);
insert into COURSE_GROUP (id_group, id_course)
values (1043, 2257);
insert into COURSE_GROUP (id_group, id_course)
values (1044, 4158);
insert into COURSE_GROUP (id_group, id_course)
values (1045, 7865);
insert into COURSE_GROUP (id_group, id_course)
values (1046, 2374);
insert into COURSE_GROUP (id_group, id_course)
values (1047, 7611);
insert into COURSE_GROUP (id_group, id_course)
values (1048, 4336);
insert into COURSE_GROUP (id_group, id_course)
values (1049, 5538);
insert into COURSE_GROUP (id_group, id_course)
values (1050, 6986);
insert into COURSE_GROUP (id_group, id_course)
values (1051, 9642);
insert into COURSE_GROUP (id_group, id_course)
values (1052, 4993);
insert into COURSE_GROUP (id_group, id_course)
values (1053, 1914);
insert into COURSE_GROUP (id_group, id_course)
values (1054, 8870);
insert into COURSE_GROUP (id_group, id_course)
values (1055, 9868);
insert into COURSE_GROUP (id_group, id_course)
values (1056, 9239);
insert into COURSE_GROUP (id_group, id_course)
values (1057, 5365);
insert into COURSE_GROUP (id_group, id_course)
values (1058, 6746);
insert into COURSE_GROUP (id_group, id_course)
values (1059, 5981);
insert into COURSE_GROUP (id_group, id_course)
values (1060, 6732);
insert into COURSE_GROUP (id_group, id_course)
values (1061, 8572);
insert into COURSE_GROUP (id_group, id_course)
values (1062, 1737);
insert into COURSE_GROUP (id_group, id_course)
values (1063, 8362);
insert into COURSE_GROUP (id_group, id_course)
values (1064, 5440);
insert into COURSE_GROUP (id_group, id_course)
values (1065, 7197);
insert into COURSE_GROUP (id_group, id_course)
values (1066, 1630);
insert into COURSE_GROUP (id_group, id_course)
values (1067, 3999);
insert into COURSE_GROUP (id_group, id_course)
values (1068, 9076);
insert into COURSE_GROUP (id_group, id_course)
values (1069, 9850);
insert into COURSE_GROUP (id_group, id_course)
values (1070, 4153);
insert into COURSE_GROUP (id_group, id_course)
values (1071, 9748);
insert into COURSE_GROUP (id_group, id_course)
values (1072, 8362);
insert into COURSE_GROUP (id_group, id_course)
values (1073, 5097);
insert into COURSE_GROUP (id_group, id_course)
values (1074, 3705);
insert into COURSE_GROUP (id_group, id_course)
values (1075, 8209);
insert into COURSE_GROUP (id_group, id_course)
values (1076, 5365);
insert into COURSE_GROUP (id_group, id_course)
values (1077, 7049);
insert into COURSE_GROUP (id_group, id_course)
values (1078, 1495);
insert into COURSE_GROUP (id_group, id_course)
values (1079, 8536);
insert into COURSE_GROUP (id_group, id_course)
values (1080, 4227);
insert into COURSE_GROUP (id_group, id_course)
values (1081, 2257);
insert into COURSE_GROUP (id_group, id_course)
values (1082, 9655);
insert into COURSE_GROUP (id_group, id_course)
values (1083, 2559);
insert into COURSE_GROUP (id_group, id_course)
values (1084, 4328);
insert into COURSE_GROUP (id_group, id_course)
values (1085, 4673);
insert into COURSE_GROUP (id_group, id_course)
values (1086, 9306);
insert into COURSE_GROUP (id_group, id_course)
values (1087, 1153);
insert into COURSE_GROUP (id_group, id_course)
values (1088, 8849);
insert into COURSE_GROUP (id_group, id_course)
values (1089, 5575);
insert into COURSE_GROUP (id_group, id_course)
values (1090, 2744);
insert into COURSE_GROUP (id_group, id_course)
values (1091, 1495);
insert into COURSE_GROUP (id_group, id_course)
values (1092, 8346);
insert into COURSE_GROUP (id_group, id_course)
values (1093, 5995);
insert into COURSE_GROUP (id_group, id_course)
values (1094, 4077);
insert into COURSE_GROUP (id_group, id_course)
values (1095, 8862);
insert into COURSE_GROUP (id_group, id_course)
values (1096, 2358);
insert into COURSE_GROUP (id_group, id_course)
values (1097, 4837);
insert into COURSE_GROUP (id_group, id_course)
values (1098, 8137);
insert into COURSE_GROUP (id_group, id_course)
values (1099, 7069);
commit;
prompt 100 records committed...
insert into COURSE_GROUP (id_group, id_course)
values (1100, 9869);
insert into COURSE_GROUP (id_group, id_course)
values (1101, 4555);
insert into COURSE_GROUP (id_group, id_course)
values (1102, 8995);
insert into COURSE_GROUP (id_group, id_course)
values (1103, 6632);
insert into COURSE_GROUP (id_group, id_course)
values (1104, 5679);
insert into COURSE_GROUP (id_group, id_course)
values (1105, 8870);
insert into COURSE_GROUP (id_group, id_course)
values (1106, 5497);
insert into COURSE_GROUP (id_group, id_course)
values (1107, 9906);
insert into COURSE_GROUP (id_group, id_course)
values (1108, 9691);
insert into COURSE_GROUP (id_group, id_course)
values (1109, 8892);
insert into COURSE_GROUP (id_group, id_course)
values (1110, 8995);
insert into COURSE_GROUP (id_group, id_course)
values (1111, 4837);
insert into COURSE_GROUP (id_group, id_course)
values (1112, 9309);
insert into COURSE_GROUP (id_group, id_course)
values (1113, 2725);
insert into COURSE_GROUP (id_group, id_course)
values (1114, 5328);
insert into COURSE_GROUP (id_group, id_course)
values (1115, 7865);
insert into COURSE_GROUP (id_group, id_course)
values (1116, 2593);
insert into COURSE_GROUP (id_group, id_course)
values (1117, 5575);
insert into COURSE_GROUP (id_group, id_course)
values (1118, 1495);
insert into COURSE_GROUP (id_group, id_course)
values (1119, 4555);
insert into COURSE_GROUP (id_group, id_course)
values (1120, 4153);
insert into COURSE_GROUP (id_group, id_course)
values (1121, 8958);
insert into COURSE_GROUP (id_group, id_course)
values (1122, 5467);
insert into COURSE_GROUP (id_group, id_course)
values (1123, 2961);
insert into COURSE_GROUP (id_group, id_course)
values (1124, 5146);
insert into COURSE_GROUP (id_group, id_course)
values (1125, 9359);
insert into COURSE_GROUP (id_group, id_course)
values (1126, 3074);
insert into COURSE_GROUP (id_group, id_course)
values (1127, 1118);
insert into COURSE_GROUP (id_group, id_course)
values (1128, 1261);
insert into COURSE_GROUP (id_group, id_course)
values (1129, 3999);
insert into COURSE_GROUP (id_group, id_course)
values (1130, 5856);
insert into COURSE_GROUP (id_group, id_course)
values (1131, 6989);
insert into COURSE_GROUP (id_group, id_course)
values (1132, 9869);
insert into COURSE_GROUP (id_group, id_course)
values (1133, 1667);
insert into COURSE_GROUP (id_group, id_course)
values (1134, 9495);
insert into COURSE_GROUP (id_group, id_course)
values (1135, 9306);
insert into COURSE_GROUP (id_group, id_course)
values (1136, 3488);
insert into COURSE_GROUP (id_group, id_course)
values (1137, 3876);
insert into COURSE_GROUP (id_group, id_course)
values (1138, 3984);
insert into COURSE_GROUP (id_group, id_course)
values (1139, 9757);
insert into COURSE_GROUP (id_group, id_course)
values (1140, 3054);
insert into COURSE_GROUP (id_group, id_course)
values (1141, 5297);
insert into COURSE_GROUP (id_group, id_course)
values (1142, 5328);
insert into COURSE_GROUP (id_group, id_course)
values (1143, 9301);
insert into COURSE_GROUP (id_group, id_course)
values (1144, 5151);
insert into COURSE_GROUP (id_group, id_course)
values (1145, 3698);
insert into COURSE_GROUP (id_group, id_course)
values (1146, 8572);
insert into COURSE_GROUP (id_group, id_course)
values (1147, 7069);
insert into COURSE_GROUP (id_group, id_course)
values (1148, 8536);
insert into COURSE_GROUP (id_group, id_course)
values (1149, 3216);
insert into COURSE_GROUP (id_group, id_course)
values (1150, 5726);
insert into COURSE_GROUP (id_group, id_course)
values (1151, 4336);
insert into COURSE_GROUP (id_group, id_course)
values (1152, 2824);
insert into COURSE_GROUP (id_group, id_course)
values (1153, 5775);
insert into COURSE_GROUP (id_group, id_course)
values (1154, 1090);
insert into COURSE_GROUP (id_group, id_course)
values (1155, 9938);
insert into COURSE_GROUP (id_group, id_course)
values (1156, 1153);
insert into COURSE_GROUP (id_group, id_course)
values (1157, 7739);
insert into COURSE_GROUP (id_group, id_course)
values (1158, 3511);
insert into COURSE_GROUP (id_group, id_course)
values (1159, 8648);
insert into COURSE_GROUP (id_group, id_course)
values (1160, 4407);
insert into COURSE_GROUP (id_group, id_course)
values (1161, 2388);
insert into COURSE_GROUP (id_group, id_course)
values (1162, 5531);
insert into COURSE_GROUP (id_group, id_course)
values (1163, 8040);
insert into COURSE_GROUP (id_group, id_course)
values (1164, 5857);
insert into COURSE_GROUP (id_group, id_course)
values (1165, 3596);
insert into COURSE_GROUP (id_group, id_course)
values (1166, 3442);
insert into COURSE_GROUP (id_group, id_course)
values (1167, 2181);
insert into COURSE_GROUP (id_group, id_course)
values (1168, 4447);
insert into COURSE_GROUP (id_group, id_course)
values (1169, 7197);
insert into COURSE_GROUP (id_group, id_course)
values (1170, 4837);
insert into COURSE_GROUP (id_group, id_course)
values (1171, 1127);
insert into COURSE_GROUP (id_group, id_course)
values (1172, 1523);
insert into COURSE_GROUP (id_group, id_course)
values (1173, 5932);
insert into COURSE_GROUP (id_group, id_course)
values (1174, 5981);
insert into COURSE_GROUP (id_group, id_course)
values (1175, 5856);
insert into COURSE_GROUP (id_group, id_course)
values (1176, 5097);
insert into COURSE_GROUP (id_group, id_course)
values (1177, 8627);
insert into COURSE_GROUP (id_group, id_course)
values (1178, 1926);
insert into COURSE_GROUP (id_group, id_course)
values (1179, 4552);
insert into COURSE_GROUP (id_group, id_course)
values (1180, 3026);
insert into COURSE_GROUP (id_group, id_course)
values (1181, 8167);
insert into COURSE_GROUP (id_group, id_course)
values (1182, 9291);
insert into COURSE_GROUP (id_group, id_course)
values (1183, 5981);
insert into COURSE_GROUP (id_group, id_course)
values (1184, 8892);
insert into COURSE_GROUP (id_group, id_course)
values (1185, 8040);
insert into COURSE_GROUP (id_group, id_course)
values (1186, 2541);
insert into COURSE_GROUP (id_group, id_course)
values (1187, 5755);
insert into COURSE_GROUP (id_group, id_course)
values (1188, 3464);
insert into COURSE_GROUP (id_group, id_course)
values (1189, 7936);
insert into COURSE_GROUP (id_group, id_course)
values (1190, 8167);
insert into COURSE_GROUP (id_group, id_course)
values (1191, 7333);
insert into COURSE_GROUP (id_group, id_course)
values (1192, 5097);
insert into COURSE_GROUP (id_group, id_course)
values (1193, 3973);
insert into COURSE_GROUP (id_group, id_course)
values (1194, 3718);
insert into COURSE_GROUP (id_group, id_course)
values (1195, 1422);
insert into COURSE_GROUP (id_group, id_course)
values (1196, 3442);
insert into COURSE_GROUP (id_group, id_course)
values (1197, 7865);
insert into COURSE_GROUP (id_group, id_course)
values (1198, 7336);
insert into COURSE_GROUP (id_group, id_course)
values (1199, 7760);
commit;
prompt 200 records committed...
insert into COURSE_GROUP (id_group, id_course)
values (1200, 9306);
insert into COURSE_GROUP (id_group, id_course)
values (1201, 1090);
insert into COURSE_GROUP (id_group, id_course)
values (1202, 5365);
insert into COURSE_GROUP (id_group, id_course)
values (1203, 5440);
insert into COURSE_GROUP (id_group, id_course)
values (1204, 7931);
insert into COURSE_GROUP (id_group, id_course)
values (1205, 2156);
insert into COURSE_GROUP (id_group, id_course)
values (1206, 5932);
insert into COURSE_GROUP (id_group, id_course)
values (1207, 4305);
insert into COURSE_GROUP (id_group, id_course)
values (1208, 5726);
insert into COURSE_GROUP (id_group, id_course)
values (1209, 8810);
insert into COURSE_GROUP (id_group, id_course)
values (1210, 9650);
insert into COURSE_GROUP (id_group, id_course)
values (1211, 1149);
insert into COURSE_GROUP (id_group, id_course)
values (1212, 1922);
insert into COURSE_GROUP (id_group, id_course)
values (1213, 8810);
insert into COURSE_GROUP (id_group, id_course)
values (1214, 1090);
insert into COURSE_GROUP (id_group, id_course)
values (1215, 9642);
insert into COURSE_GROUP (id_group, id_course)
values (1216, 5328);
insert into COURSE_GROUP (id_group, id_course)
values (1217, 9472);
insert into COURSE_GROUP (id_group, id_course)
values (1218, 4407);
insert into COURSE_GROUP (id_group, id_course)
values (1219, 9805);
insert into COURSE_GROUP (id_group, id_course)
values (1220, 4004);
insert into COURSE_GROUP (id_group, id_course)
values (1221, 7860);
insert into COURSE_GROUP (id_group, id_course)
values (1222, 8648);
insert into COURSE_GROUP (id_group, id_course)
values (1223, 8542);
insert into COURSE_GROUP (id_group, id_course)
values (1224, 8009);
insert into COURSE_GROUP (id_group, id_course)
values (1225, 1118);
insert into COURSE_GROUP (id_group, id_course)
values (1226, 1473);
insert into COURSE_GROUP (id_group, id_course)
values (1227, 1922);
insert into COURSE_GROUP (id_group, id_course)
values (1228, 5726);
insert into COURSE_GROUP (id_group, id_course)
values (1229, 6516);
insert into COURSE_GROUP (id_group, id_course)
values (1230, 5342);
insert into COURSE_GROUP (id_group, id_course)
values (1231, 6658);
insert into COURSE_GROUP (id_group, id_course)
values (1232, 6176);
insert into COURSE_GROUP (id_group, id_course)
values (1233, 6337);
insert into COURSE_GROUP (id_group, id_course)
values (1234, 3496);
insert into COURSE_GROUP (id_group, id_course)
values (1235, 8892);
insert into COURSE_GROUP (id_group, id_course)
values (1236, 9119);
insert into COURSE_GROUP (id_group, id_course)
values (1237, 2123);
insert into COURSE_GROUP (id_group, id_course)
values (1238, 7174);
insert into COURSE_GROUP (id_group, id_course)
values (1239, 3064);
insert into COURSE_GROUP (id_group, id_course)
values (1240, 5283);
insert into COURSE_GROUP (id_group, id_course)
values (1241, 1749);
insert into COURSE_GROUP (id_group, id_course)
values (1242, 5857);
insert into COURSE_GROUP (id_group, id_course)
values (1243, 3054);
insert into COURSE_GROUP (id_group, id_course)
values (1244, 2541);
insert into COURSE_GROUP (id_group, id_course)
values (1245, 5947);
insert into COURSE_GROUP (id_group, id_course)
values (1246, 9212);
insert into COURSE_GROUP (id_group, id_course)
values (1247, 8332);
insert into COURSE_GROUP (id_group, id_course)
values (1248, 8332);
insert into COURSE_GROUP (id_group, id_course)
values (1249, 7358);
insert into COURSE_GROUP (id_group, id_course)
values (1250, 2559);
insert into COURSE_GROUP (id_group, id_course)
values (1251, 5857);
insert into COURSE_GROUP (id_group, id_course)
values (1252, 8536);
insert into COURSE_GROUP (id_group, id_course)
values (1253, 4521);
insert into COURSE_GROUP (id_group, id_course)
values (1254, 3464);
insert into COURSE_GROUP (id_group, id_course)
values (1255, 3411);
insert into COURSE_GROUP (id_group, id_course)
values (1256, 8846);
insert into COURSE_GROUP (id_group, id_course)
values (1257, 1737);
insert into COURSE_GROUP (id_group, id_course)
values (1258, 4934);
insert into COURSE_GROUP (id_group, id_course)
values (1259, 2257);
insert into COURSE_GROUP (id_group, id_course)
values (1260, 8032);
insert into COURSE_GROUP (id_group, id_course)
values (1261, 5342);
insert into COURSE_GROUP (id_group, id_course)
values (1262, 1816);
insert into COURSE_GROUP (id_group, id_course)
values (1263, 9655);
insert into COURSE_GROUP (id_group, id_course)
values (1264, 7184);
insert into COURSE_GROUP (id_group, id_course)
values (1265, 9119);
insert into COURSE_GROUP (id_group, id_course)
values (1266, 5064);
insert into COURSE_GROUP (id_group, id_course)
values (1267, 6950);
insert into COURSE_GROUP (id_group, id_course)
values (1268, 5297);
insert into COURSE_GROUP (id_group, id_course)
values (1269, 5160);
insert into COURSE_GROUP (id_group, id_course)
values (1270, 8810);
insert into COURSE_GROUP (id_group, id_course)
values (1271, 8810);
insert into COURSE_GROUP (id_group, id_course)
values (1272, 2961);
insert into COURSE_GROUP (id_group, id_course)
values (1273, 1149);
insert into COURSE_GROUP (id_group, id_course)
values (1274, 5857);
insert into COURSE_GROUP (id_group, id_course)
values (1275, 2824);
insert into COURSE_GROUP (id_group, id_course)
values (1276, 9134);
insert into COURSE_GROUP (id_group, id_course)
values (1277, 5755);
insert into COURSE_GROUP (id_group, id_course)
values (1278, 9306);
insert into COURSE_GROUP (id_group, id_course)
values (1279, 7298);
insert into COURSE_GROUP (id_group, id_course)
values (1280, 2730);
insert into COURSE_GROUP (id_group, id_course)
values (1281, 8846);
insert into COURSE_GROUP (id_group, id_course)
values (1282, 9760);
insert into COURSE_GROUP (id_group, id_course)
values (1283, 6176);
insert into COURSE_GROUP (id_group, id_course)
values (1284, 7069);
insert into COURSE_GROUP (id_group, id_course)
values (1285, 3984);
insert into COURSE_GROUP (id_group, id_course)
values (1286, 6997);
insert into COURSE_GROUP (id_group, id_course)
values (1287, 8849);
insert into COURSE_GROUP (id_group, id_course)
values (1288, 5377);
insert into COURSE_GROUP (id_group, id_course)
values (1289, 1749);
insert into COURSE_GROUP (id_group, id_course)
values (1290, 6816);
insert into COURSE_GROUP (id_group, id_course)
values (1291, 9240);
insert into COURSE_GROUP (id_group, id_course)
values (1292, 2636);
insert into COURSE_GROUP (id_group, id_course)
values (1293, 5160);
insert into COURSE_GROUP (id_group, id_course)
values (1294, 3192);
insert into COURSE_GROUP (id_group, id_course)
values (1295, 3634);
insert into COURSE_GROUP (id_group, id_course)
values (1296, 2388);
insert into COURSE_GROUP (id_group, id_course)
values (1297, 5947);
insert into COURSE_GROUP (id_group, id_course)
values (1298, 8572);
insert into COURSE_GROUP (id_group, id_course)
values (1299, 4898);
commit;
prompt 300 records committed...
insert into COURSE_GROUP (id_group, id_course)
values (1300, 9442);
insert into COURSE_GROUP (id_group, id_course)
values (1301, 1516);
insert into COURSE_GROUP (id_group, id_course)
values (1302, 8572);
insert into COURSE_GROUP (id_group, id_course)
values (1303, 8104);
insert into COURSE_GROUP (id_group, id_course)
values (1304, 8037);
insert into COURSE_GROUP (id_group, id_course)
values (1305, 8536);
insert into COURSE_GROUP (id_group, id_course)
values (1306, 2559);
insert into COURSE_GROUP (id_group, id_course)
values (1307, 8037);
insert into COURSE_GROUP (id_group, id_course)
values (1308, 8032);
insert into COURSE_GROUP (id_group, id_course)
values (1309, 8542);
insert into COURSE_GROUP (id_group, id_course)
values (1310, 7475);
insert into COURSE_GROUP (id_group, id_course)
values (1311, 5932);
insert into COURSE_GROUP (id_group, id_course)
values (1312, 7197);
insert into COURSE_GROUP (id_group, id_course)
values (1313, 4934);
insert into COURSE_GROUP (id_group, id_course)
values (1314, 4305);
insert into COURSE_GROUP (id_group, id_course)
values (1315, 5064);
insert into COURSE_GROUP (id_group, id_course)
values (1316, 3026);
insert into COURSE_GROUP (id_group, id_course)
values (1317, 2664);
insert into COURSE_GROUP (id_group, id_course)
values (1318, 4447);
insert into COURSE_GROUP (id_group, id_course)
values (1319, 4227);
insert into COURSE_GROUP (id_group, id_course)
values (1320, 5856);
insert into COURSE_GROUP (id_group, id_course)
values (1321, 3698);
insert into COURSE_GROUP (id_group, id_course)
values (1322, 4004);
insert into COURSE_GROUP (id_group, id_course)
values (1323, 8274);
insert into COURSE_GROUP (id_group, id_course)
values (1324, 8892);
insert into COURSE_GROUP (id_group, id_course)
values (1325, 1689);
insert into COURSE_GROUP (id_group, id_course)
values (1326, 9143);
insert into COURSE_GROUP (id_group, id_course)
values (1327, 4966);
insert into COURSE_GROUP (id_group, id_course)
values (1328, 6632);
insert into COURSE_GROUP (id_group, id_course)
values (1329, 5497);
insert into COURSE_GROUP (id_group, id_course)
values (1330, 2181);
insert into COURSE_GROUP (id_group, id_course)
values (1331, 9240);
insert into COURSE_GROUP (id_group, id_course)
values (1332, 1469);
insert into COURSE_GROUP (id_group, id_course)
values (1333, 7475);
insert into COURSE_GROUP (id_group, id_course)
values (1334, 1976);
insert into COURSE_GROUP (id_group, id_course)
values (1335, 4328);
insert into COURSE_GROUP (id_group, id_course)
values (1336, 4305);
insert into COURSE_GROUP (id_group, id_course)
values (1337, 3984);
insert into COURSE_GROUP (id_group, id_course)
values (1338, 1422);
insert into COURSE_GROUP (id_group, id_course)
values (1339, 3999);
insert into COURSE_GROUP (id_group, id_course)
values (1340, 1749);
insert into COURSE_GROUP (id_group, id_course)
values (1341, 9182);
insert into COURSE_GROUP (id_group, id_course)
values (1342, 1926);
insert into COURSE_GROUP (id_group, id_course)
values (1343, 7302);
insert into COURSE_GROUP (id_group, id_course)
values (1344, 9493);
insert into COURSE_GROUP (id_group, id_course)
values (1345, 7189);
insert into COURSE_GROUP (id_group, id_course)
values (1346, 8362);
insert into COURSE_GROUP (id_group, id_course)
values (1347, 6997);
insert into COURSE_GROUP (id_group, id_course)
values (1348, 2955);
insert into COURSE_GROUP (id_group, id_course)
values (1349, 5097);
insert into COURSE_GROUP (id_group, id_course)
values (1350, 5960);
insert into COURSE_GROUP (id_group, id_course)
values (1351, 3323);
insert into COURSE_GROUP (id_group, id_course)
values (1352, 1473);
insert into COURSE_GROUP (id_group, id_course)
values (1353, 7073);
insert into COURSE_GROUP (id_group, id_course)
values (1354, 7936);
insert into COURSE_GROUP (id_group, id_course)
values (1355, 7333);
insert into COURSE_GROUP (id_group, id_course)
values (1356, 9212);
insert into COURSE_GROUP (id_group, id_course)
values (1357, 3527);
insert into COURSE_GROUP (id_group, id_course)
values (1358, 4259);
insert into COURSE_GROUP (id_group, id_course)
values (1359, 6239);
insert into COURSE_GROUP (id_group, id_course)
values (1360, 3796);
insert into COURSE_GROUP (id_group, id_course)
values (1361, 8421);
insert into COURSE_GROUP (id_group, id_course)
values (1362, 2257);
insert into COURSE_GROUP (id_group, id_course)
values (1363, 8849);
insert into COURSE_GROUP (id_group, id_course)
values (1364, 9868);
insert into COURSE_GROUP (id_group, id_course)
values (1365, 2725);
insert into COURSE_GROUP (id_group, id_course)
values (1366, 9691);
insert into COURSE_GROUP (id_group, id_course)
values (1367, 8452);
insert into COURSE_GROUP (id_group, id_course)
values (1368, 3999);
insert into COURSE_GROUP (id_group, id_course)
values (1369, 2181);
insert into COURSE_GROUP (id_group, id_course)
values (1370, 4996);
insert into COURSE_GROUP (id_group, id_course)
values (1371, 8846);
insert into COURSE_GROUP (id_group, id_course)
values (1372, 1737);
insert into COURSE_GROUP (id_group, id_course)
values (1373, 7739);
insert into COURSE_GROUP (id_group, id_course)
values (1374, 3567);
insert into COURSE_GROUP (id_group, id_course)
values (1375, 6977);
insert into COURSE_GROUP (id_group, id_course)
values (1376, 3876);
insert into COURSE_GROUP (id_group, id_course)
values (1377, 9915);
insert into COURSE_GROUP (id_group, id_course)
values (1378, 8849);
insert into COURSE_GROUP (id_group, id_course)
values (1379, 7611);
insert into COURSE_GROUP (id_group, id_course)
values (1380, 8027);
insert into COURSE_GROUP (id_group, id_course)
values (1381, 7498);
insert into COURSE_GROUP (id_group, id_course)
values (1382, 2202);
insert into COURSE_GROUP (id_group, id_course)
values (1383, 9239);
insert into COURSE_GROUP (id_group, id_course)
values (1384, 2388);
insert into COURSE_GROUP (id_group, id_course)
values (1385, 8870);
insert into COURSE_GROUP (id_group, id_course)
values (1386, 6658);
insert into COURSE_GROUP (id_group, id_course)
values (1387, 2235);
insert into COURSE_GROUP (id_group, id_course)
values (1388, 2696);
insert into COURSE_GROUP (id_group, id_course)
values (1389, 5377);
insert into COURSE_GROUP (id_group, id_course)
values (1390, 2180);
insert into COURSE_GROUP (id_group, id_course)
values (1391, 3216);
insert into COURSE_GROUP (id_group, id_course)
values (1392, 1940);
insert into COURSE_GROUP (id_group, id_course)
values (1393, 7734);
insert into COURSE_GROUP (id_group, id_course)
values (1394, 6989);
insert into COURSE_GROUP (id_group, id_course)
values (1395, 1914);
insert into COURSE_GROUP (id_group, id_course)
values (1396, 3984);
insert into COURSE_GROUP (id_group, id_course)
values (1397, 3064);
insert into COURSE_GROUP (id_group, id_course)
values (1398, 4837);
insert into COURSE_GROUP (id_group, id_course)
values (1399, 2358);
commit;
prompt 400 records loaded
prompt Loading TEACHERS...
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
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (75182, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (75168, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (17340, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (76492, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (36290, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (96389, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (81746, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (79500, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (7780, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (78626, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (18571, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (34398, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (24366, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (94682, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (20427, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (95960, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (42866, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (70432, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (75655, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (33884, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (88664, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (72904, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (39809, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (2192, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (97147, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (74054, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (35569, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (3924, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (5454, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (11649, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (65775, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (23421, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (80593, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (3379, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (26034, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (51190, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (9783, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (1103, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (41112, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (43117, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (55571, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (84062, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (78563, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (79076, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (90031, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (39781, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (16585, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (80418, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (55831, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (13460, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (53317, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (89178, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (41950, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (16131, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (44256, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (34451, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (58052, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (65253, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (33998, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (50832, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (87492, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (80053, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (5653, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (18412, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (11388, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (65061, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (54989, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (30597, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (98952, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (11064, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
commit;
prompt 100 records committed...
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (41048, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (43356, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (88712, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (56400, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (66760, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (53197, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (58022, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (90334, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (98813, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (96971, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (65988, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (83928, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (30809, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (84317, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (34719, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (82648, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (33449, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (92339, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (71531, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (7627, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (70288, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (93830, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (73493, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (31309, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (56306, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (95133, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (54469, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (40921, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (82318, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (1460, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (85529, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (93972, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (53995, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (37250, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (51383, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (32736, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (98993, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (98891, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (44229, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (13422, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (51481, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (5887, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (63136, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (67488, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (11063, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (67302, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (87889, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (5287, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (37867, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (19047, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (36891, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (7021, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (40320, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (55351, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (34560, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (92686, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (45865, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (79487, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (52318, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (53472, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (79654, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (55586, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (91097, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (65819, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (88953, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (12107, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (18984, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (56079, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (78811, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (54304, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (83394, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (66493, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (55222, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (74764, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (72933, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (36927, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (89829, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (63837, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (78809, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (15583, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (52908, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (65542, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (88459, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (54625, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (71167, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (37282, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (24773, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (61433, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (19614, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (94439, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (87052, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (98930, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (44518, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (61671, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (86593, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (69194, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (80218, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (49510, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (58548, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (16300, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
commit;
prompt 200 records committed...
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (10311, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (37566, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (1436, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (32101, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (69467, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (34434, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (85457, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (60392, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (17902, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (33110, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (22501, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (18681, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (1263, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (94527, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (77479, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (87489, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (93450, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (25498, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (87384, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (51911, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (98632, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (23186, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (7210, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (69873, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (25480, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (19896, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (81624, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (19298, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (87380, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (40780, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (53035, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (46128, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (97137, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (50793, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (9441, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (9910, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (30445, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (68962, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (55208, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (3390, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (92126, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (65797, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (71659, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (88336, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (29923, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (75439, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (67120, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (87522, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (39336, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (87855, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (56817, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (99589, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (83793, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (4164, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (21753, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (52236, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (23156, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (61926, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (25469, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (98939, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (97327, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (82971, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (97322, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (26152, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (49480, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (79084, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (10670, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (20695, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (49178, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (23649, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (99108, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (23787, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (66390, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (87053, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (21648, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (70912, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (15172, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (84450, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (35472, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (81491, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (40538, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (77194, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (53668, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (62046, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (49773, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (35038, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (7064, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (28316, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (89210, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (54913, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (5080, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (65537, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (24243, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (82872, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (3211, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (79818, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (74076, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (90521, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (95553, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (6339, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
commit;
prompt 300 records committed...
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (15489, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (98029, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (1500, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (76807, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (42630, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (54522, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (3505, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (80382, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (57594, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (7465, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (73547, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (42025, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (32318, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (27341, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (88704, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (14970, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (48039, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (71711, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (1948, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (74767, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (29352, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (96490, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (47079, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (43119, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (6611, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (54006, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (91424, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (78435, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (82210, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (36174, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (46696, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (27836, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (92997, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (53873, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (6151, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (14036, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (74831, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (57331, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (87939, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (3329, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (86070, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (35126, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (88279, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (85611, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (50483, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (54106, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (62866, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (54158, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (7860, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (28319, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (9632, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (65604, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (96338, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (19776, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (18762, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (27322, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (11208, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (17630, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (3606, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (37169, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (85714, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (48095, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (31873, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (67286, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (26115, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (7183, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (24248, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (78418, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (70022, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (19089, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (87331, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (92944, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (55776, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (68806, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (99522, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (76594, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (33389, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (58285, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (64264, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (97517, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (33298, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (74234, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (96763, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (68199, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (98973, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (86375, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (24095, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (31110, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (2737, 'Dvora', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (88324, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (16046, 'Bracha', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (97965, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (43320, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (10032, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (27903, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (31057, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (32197, 'Ayelet', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (30401, 'Elisheva', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (13255, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (85281, 'Tamar', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
commit;
prompt 400 records committed...
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (93893, 'Yafit', to_date('01-01-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
commit;
prompt 401 records loaded
prompt Loading COURSE_HAS_TEACHER...
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (1041, 16046);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (1118, 65797);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (1118, 89444);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (1333, 93972);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (1495, 87380);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (2882, 93830);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (2899, 17630);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (3216, 14036);
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
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (8542, 85281);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (8555, 33389);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (8829, 95133);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (8849, 97965);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (8958, 54625);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (9086, 75182);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (9193, 65537);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (9240, 24366);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (9692, 87053);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (9757, 7860);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (9868, 34451);
insert into COURSE_HAS_TEACHER (id_course, id_teacher)
values (9869, 39781);
commit;
prompt 50 records loaded
prompt Loading SCHEDULE...
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Tuesday', 49375);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Monday', 77482);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Monday', 20328);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Tuesday', 29651);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Thursday', 80678);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Monday', 55420);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Sunday', 95682);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Sunday', 70967);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Monday', 97909);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Tuesday', 87566);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Thursday', 69794);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Tuesday', 45814);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Sunday', 60785);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Monday', 25440);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Wednesday', 86928);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Monday', 49826);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Wednesday', 71903);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Tuesday', 43232);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Sunday', 62484);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Monday', 43008);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Wednesday', 68804);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Thursday', 57776);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Sunday', 87464);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Wednesday', 43003);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Thursday', 79769);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Wednesday', 72253);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Tuesday', 83980);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Thursday', 71313);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Wednesday', 14586);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Wednesday', 81673);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Tuesday', 62071);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Wednesday', 69329);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Sunday', 67121);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Thursday', 25929);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Thursday', 80358);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Thursday', 96466);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Sunday', 84433);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Tuesday', 36310);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Sunday', 73567);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Thursday', 68679);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Thursday', 62637);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Thursday', 63670);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Thursday', 97799);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Sunday', 25728);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Monday', 67851);
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
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Wednesday', 70164);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Monday', 61628);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Wednesday', 45728);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Monday', 59481);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Tuesday', 56601);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Thursday', 13617);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Tuesday', 82489);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Thursday', 30879);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Thursday', 96576);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Sunday', 15343);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Thursday', 76298);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Sunday', 94728);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Sunday', 64784);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Thursday', 59987);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Wednesday', 85923);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Tuesday', 10655);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Wednesday', 33140);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Thursday', 57683);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Sunday', 59991);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Thursday', 42873);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Thursday', 77339);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Tuesday', 12267);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Tuesday', 68561);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Wednesday', 48199);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Sunday', 38846);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Thursday', 95867);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Tuesday', 11387);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Sunday', 58954);
commit;
prompt 100 records committed...
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Thursday', 38524);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Tuesday', 14280);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Wednesday', 38172);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Thursday', 64416);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Tuesday', 59659);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Wednesday', 27271);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Tuesday', 49538);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Tuesday', 62640);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Thursday', 75652);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Wednesday', 27532);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Tuesday', 86683);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Sunday', 18485);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Monday', 13099);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Monday', 87794);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Thursday', 67222);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Tuesday', 41227);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Wednesday', 10923);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Wednesday', 16419);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Wednesday', 53101);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Thursday', 59766);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Sunday', 20065);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Wednesday', 91201);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Wednesday', 42994);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Tuesday', 34388);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Wednesday', 38037);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Monday', 15944);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Wednesday', 32886);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Tuesday', 77792);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Tuesday', 48430);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Sunday', 78673);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Tuesday', 59545);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Monday', 55432);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Tuesday', 32487);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Tuesday', 38162);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Tuesday', 42354);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Tuesday', 87450);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Tuesday', 18921);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Sunday', 78480);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Tuesday', 57257);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Thursday', 11159);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Wednesday', 11588);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Monday', 51025);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Monday', 11441);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Tuesday', 67137);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Tuesday', 47044);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Tuesday', 21407);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Thursday', 69986);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Thursday', 54990);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Monday', 86767);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Thursday', 79351);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Sunday', 48818);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Thursday', 72791);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Thursday', 78787);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Thursday', 27604);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Thursday', 47960);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Wednesday', 36387);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Thursday', 85054);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Wednesday', 92095);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Monday', 80161);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Tuesday', 16638);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Sunday', 58610);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Thursday', 12224);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Thursday', 52573);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Wednesday', 20252);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Sunday', 14218);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Tuesday', 56815);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Monday', 62701);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Thursday', 53492);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Thursday', 70664);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Thursday', 31214);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Sunday', 87734);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Monday', 34290);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Monday', 35409);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Monday', 20680);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Wednesday', 46373);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Tuesday', 87113);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Monday', 73001);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Sunday', 84889);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Wednesday', 13044);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Monday', 95226);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Thursday', 28166);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Monday', 88172);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Thursday', 22640);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Wednesday', 61370);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Wednesday', 56896);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Thursday', 53345);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Sunday', 32338);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Tuesday', 68668);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Tuesday', 15581);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Thursday', 86692);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Sunday', 10909);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Thursday', 28977);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Monday', 77136);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Tuesday', 74276);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Monday', 79234);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Wednesday', 53063);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Sunday', 19674);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Tuesday', 63903);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Sunday', 41532);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Thursday', 15722);
commit;
prompt 200 records committed...
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Thursday', 50965);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Monday', 47350);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Thursday', 88049);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Tuesday', 24435);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Wednesday', 14770);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Monday', 89912);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Tuesday', 20699);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Monday', 60758);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Tuesday', 36254);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Thursday', 97095);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Monday', 80249);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Thursday', 94923);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Monday', 27000);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Wednesday', 42262);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Wednesday', 42387);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Sunday', 16863);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Thursday', 79687);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Monday', 22637);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Tuesday', 17873);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Thursday', 76594);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Thursday', 22558);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Sunday', 93746);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Tuesday', 75241);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Tuesday', 55083);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Sunday', 85391);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Thursday', 43965);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Sunday', 35232);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Sunday', 17500);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Thursday', 23636);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Tuesday', 49662);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Monday', 63563);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Wednesday', 14270);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Tuesday', 28090);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Sunday', 36681);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Wednesday', 31566);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Monday', 35073);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Sunday', 56416);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Sunday', 84685);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Thursday', 61779);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Tuesday', 71353);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Monday', 30978);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Sunday', 12171);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Sunday', 86399);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Tuesday', 38891);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Tuesday', 89124);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Sunday', 35714);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Wednesday', 29142);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Wednesday', 62070);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Wednesday', 57558);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Wednesday', 24123);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Tuesday', 35795);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Sunday', 55725);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Thursday', 16258);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Wednesday', 46772);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Monday', 63039);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Sunday', 93399);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Wednesday', 28079);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Thursday', 68536);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Sunday', 60741);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Thursday', 93794);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Wednesday', 16311);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Sunday', 56055);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Monday', 60343);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Thursday', 86232);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Tuesday', 75338);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Wednesday', 79724);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Tuesday', 64300);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Sunday', 17145);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Thursday', 48116);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Thursday', 96354);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Sunday', 24521);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Wednesday', 33630);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Monday', 29018);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Sunday', 30314);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Tuesday', 43293);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Monday', 50431);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Monday', 98404);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Monday', 25852);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Tuesday', 68327);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Wednesday', 76933);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Thursday', 62145);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Wednesday', 92201);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Thursday', 22681);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Tuesday', 79335);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Tuesday', 75383);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Sunday', 52330);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Sunday', 85292);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Thursday', 16206);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Sunday', 36830);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Tuesday', 80455);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Monday', 26826);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Thursday', 28406);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Sunday', 92577);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Sunday', 91139);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Wednesday', 62670);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Sunday', 57134);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Tuesday', 12693);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Tuesday', 76683);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Thursday', 20198);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Tuesday', 66946);
commit;
prompt 300 records committed...
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Thursday', 49454);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Monday', 76706);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Monday', 97314);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Sunday', 99757);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Wednesday', 61318);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Wednesday', 51567);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Sunday', 42462);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Tuesday', 46326);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Monday', 99541);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Thursday', 95158);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Thursday', 70754);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Thursday', 32179);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Thursday', 38111);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Monday', 76010);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Sunday', 37395);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Tuesday', 38950);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Wednesday', 48100);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Thursday', 92223);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Monday', 59992);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Thursday', 95686);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Sunday', 16860);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Sunday', 47885);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Sunday', 79545);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Monday', 10674);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Thursday', 66760);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Monday', 52553);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Wednesday', 58928);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Thursday', 42019);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Tuesday', 38796);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Wednesday', 40149);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Monday', 18593);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Monday', 44879);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Tuesday', 80314);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Sunday', 79367);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Monday', 23763);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Sunday', 89151);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Wednesday', 21083);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Sunday', 74215);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Tuesday', 20305);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Sunday', 73344);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Thursday', 16846);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Tuesday', 99620);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Wednesday', 24060);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Sunday', 55100);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Monday', 19192);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Monday', 59364);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Tuesday', 84488);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Thursday', 14260);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Thursday', 93421);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Wednesday', 66463);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Tuesday', 17055);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Monday', 40563);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Thursday', 40206);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Thursday', 53288);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Thursday', 30940);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Wednesday', 90210);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Monday', 38428);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Wednesday', 29701);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Sunday', 47532);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Sunday', 68570);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Tuesday', 95956);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Tuesday', 34316);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Tuesday', 99442);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Tuesday', 77814);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Sunday', 48310);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Sunday', 47986);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Thursday', 76545);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Thursday', 15019);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Thursday', 78103);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Thursday', 47471);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Thursday', 57897);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Sunday', 50753);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Tuesday', 51483);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Sunday', 47306);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Sunday', 79495);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Tuesday', 92051);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Thursday', 73027);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Sunday', 81162);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Tuesday', 80149);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Wednesday', 25735);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Tuesday', 62436);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Sunday', 69116);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Monday', 50810);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Monday', 82047);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Tuesday', 49719);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Sunday', 60022);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Thursday', 70941);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Wednesday', 14706);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Sunday', 53222);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Wednesday', 35372);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Monday', 43640);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Monday', 95568);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (14, 'Monday', 26765);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Sunday', 13306);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Thursday', 15459);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Wednesday', 51666);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Monday', 36686);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Wednesday', 62797);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (15, 'Wednesday', 68944);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Wednesday', 26080);
commit;
prompt 400 records committed...
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Monday', 0);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Monday', 1);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Sunday', 2);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Tusday', 3);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Thersday', 4);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (11, 'Frayday', 5);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Wedensday', 6);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Wedensday', 7);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (11, 'Tusday', 8);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Tusday', 9);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Wedensday', 10);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (18, 'Monday', 11);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (17, 'Wedensday', 12);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (9, 'Tusday', 13);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (16, 'Sunday', 14);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (20, 'Frayday', 15);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (13, 'Monday', 16);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (19, 'Wedensday', 17);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (9, 'Frayday', 18);
insert into SCHEDULE (s_hour, s_day, id_schedule)
values (13, 'Monday', 19);
commit;
prompt 420 records loaded
prompt Loading GROUP_IN_SCHEDULLE...
insert into GROUP_IN_SCHEDULLE (id_group, id_schedule)
values (1105, 95158);
insert into GROUP_IN_SCHEDULLE (id_group, id_schedule)
values (1389, 34990);
insert into GROUP_IN_SCHEDULLE (id_group, id_schedule)
values (1257, 66523);
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
commit;
prompt 19 records loaded
prompt Loading KIDS...
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1000, 'Daniel', null, 527345656, 'Israel');
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
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1035, 'Avery', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1036, 'Matthew', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1037, 'Sophia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1038, 'Olivia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1039, 'Emily', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1040, 'Harper', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1041, 'Matthew', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1042, 'Ava', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1043, 'James', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1044, 'Noah', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1045, 'Victoria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1046, 'Ryan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1047, 'John', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1048, 'William', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1049, 'Aria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1050, 'Liam', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1051, 'Isabella', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1052, 'Alexander', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1053, 'Avery', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1054, 'Alexander', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1055, 'Liam', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1056, 'Joseph', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1057, 'Anthony', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1058, 'James', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1059, 'Charlotte', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1060, 'Matthew', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1061, 'Elizabeth', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1062, 'Abigail', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1063, 'Sophia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1064, 'Anthony', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1065, 'Benjamin', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1066, 'Aria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1067, 'Harper', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1068, 'Grace', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1069, 'Evelyn', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1070, 'Andrew', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1071, 'Anthony', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1072, 'Aria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1073, 'Emma', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1074, 'Anthony', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1075, 'Emma', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1076, 'Madison', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1077, 'Nicholas', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1078, 'Scarlett', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1079, 'Ryan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1080, 'Sofia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1081, 'Aria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1082, 'Matthew', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1083, 'Aria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1084, 'Michael', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1085, 'Evelyn', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1086, 'James', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1087, 'Benjamin', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1088, 'Mia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1089, 'Evelyn', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1090, 'Scarlett', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1091, 'Aria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1092, 'Samuel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1093, 'Christopher', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1094, 'Luke', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1095, 'Aria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1096, 'Ethan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1097, 'Dylan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1098, 'Noah', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1099, 'Lily', null, 527345656, 'Israel');
commit;
prompt 100 records committed...
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1100, 'Olivia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1101, 'Sofia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1102, 'Aubrey', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1103, 'Elizabeth', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1104, 'Mia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1105, 'Samuel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1106, 'Charlotte', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1107, 'Joshua', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1108, 'Evelyn', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1109, 'Evelyn', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1110, 'Dylan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1111, 'Henry', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1112, 'Olivia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1113, 'Evelyn', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1114, 'Evelyn', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1115, 'Ryan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1116, 'Joseph', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1117, 'Mia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1118, 'Matthew', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1119, 'Ella', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1120, 'Mia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1121, 'Emma', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1122, 'Lily', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1123, 'Lily', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1124, 'Charlotte', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1125, 'Emily', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1126, 'Isabella', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1127, 'Christopher', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1128, 'Ava', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1129, 'Aria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1130, 'Andrew', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1131, 'Sophia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1132, 'Ethan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1133, 'Sophia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1134, 'Sofia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1135, 'Madison', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1136, 'Madison', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1137, 'Harper', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1138, 'Mia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1139, 'Avery', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1140, 'Layla', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1141, 'Aria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1142, 'Nicholas', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1143, 'Ella', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1144, 'Samuel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1145, 'Henry', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1146, 'Joshua', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1147, 'Henry', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1148, 'Anthony', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1149, 'Grace', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1150, 'Alexander', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1151, 'Michael', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1152, 'Alexander', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1153, 'Mia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1154, 'Noah', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1155, 'Mia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1156, 'Dylan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1157, 'James', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1158, 'James', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1159, 'Elizabeth', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1160, 'Christopher', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1161, 'Olivia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1162, 'Dylan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1163, 'William', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1164, 'Elizabeth', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1165, 'Daniel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1166, 'Henry', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1167, 'Nicholas', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1168, 'Mia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1169, 'Luke', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1170, 'Isabella', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1171, 'William', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1172, 'John', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1173, 'Emma', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1174, 'Harper', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1175, 'Harper', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1176, 'Scarlett', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1177, 'Elizabeth', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1178, 'William', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1179, 'Ethan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1180, 'Amelia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1181, 'Nicholas', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1182, 'Abigail', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1183, 'Amelia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1184, 'Aubrey', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1185, 'Elizabeth', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1186, 'Joseph', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1187, 'Ella', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1188, 'William', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1189, 'Abigail', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1190, 'Emma', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1191, 'William', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1192, 'Aubrey', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1193, 'Lily', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1194, 'Benjamin', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1195, 'Lily', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1196, 'Emily', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1197, 'Dylan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1198, 'Isabella', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1199, 'Emily', null, 527345656, 'Israel');
commit;
prompt 200 records committed...
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1200, 'Ethan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1201, 'Ella', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1202, 'Andrew', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1203, 'Elizabeth', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1204, 'Amelia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1205, 'Harper', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1206, 'Henry', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1207, 'Victoria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1208, 'Christopher', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1209, 'Matthew', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1210, 'Liam', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1211, 'Alexander', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1212, 'Daniel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1213, 'Ethan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1214, 'David', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1215, 'Ava', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1216, 'Ella', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1217, 'Aubrey', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1218, 'Victoria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1219, 'Liam', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1220, 'Alexander', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1221, 'David', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1222, 'Grace', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1223, 'Samuel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1224, 'Liam', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1225, 'Madison', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1226, 'Luke', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1227, 'Emma', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1228, 'Henry', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1229, 'Mia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1230, 'John', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1231, 'Emily', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1232, 'Grace', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1233, 'Samuel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1234, 'Abigail', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1235, 'Aria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1236, 'Benjamin', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1237, 'Avery', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1238, 'Isabella', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1239, 'Ethan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1240, 'Lily', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1241, 'Aubrey', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1242, 'Jackson', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1243, 'Luke', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1244, 'Ava', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1245, 'Andrew', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1246, 'Victoria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1247, 'William', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1248, 'Harper', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1249, 'Ethan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1250, 'Sophia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1251, 'Ella', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1252, 'Abigail', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1253, 'Benjamin', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1254, 'Daniel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1255, 'William', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1256, 'Elizabeth', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1257, 'Charlotte', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1258, 'Ella', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1259, 'Elizabeth', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1260, 'William', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1261, 'Anthony', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1262, 'Abigail', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1263, 'Anthony', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1264, 'Dylan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1265, 'William', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1266, 'Chloe', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1267, 'Nicholas', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1268, 'Nicholas', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1269, 'Gabriel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1270, 'Anthony', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1271, 'Gabriel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1272, 'Matthew', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1273, 'Benjamin', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1274, 'Sophia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1275, 'Abigail', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1276, 'Samuel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1277, 'Andrew', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1278, 'Andrew', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1279, 'Michael', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1280, 'Emma', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1281, 'John', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1282, 'Ethan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1283, 'Evelyn', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1284, 'Noah', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1285, 'Madison', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1286, 'Amelia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1287, 'Gabriel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1288, 'Ryan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1289, 'Elizabeth', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1290, 'Amelia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1291, 'Aria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1292, 'Amelia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1293, 'Benjamin', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1294, 'Joshua', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1295, 'Avery', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1296, 'Ava', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1297, 'Henry', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1298, 'Charlotte', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1299, 'Abigail', null, 527345656, 'Israel');
commit;
prompt 300 records committed...
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1300, 'Nicholas', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1301, 'Nicholas', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1302, 'Chloe', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1303, 'Aria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1304, 'Daniel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1305, 'Grace', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1306, 'Nicholas', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1307, 'Victoria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1308, 'Alexander', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1309, 'Andrew', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1310, 'James', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1311, 'Scarlett', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1312, 'Avery', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1313, 'Dylan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1314, 'Noah', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1315, 'Scarlett', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1316, 'Madison', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1317, 'Ava', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1318, 'Aria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1319, 'Samuel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1320, 'Jackson', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1321, 'Chloe', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1322, 'Joseph', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1323, 'Nicholas', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1324, 'Ella', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1325, 'Isabella', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1326, 'Emily', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1327, 'Aubrey', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1328, 'Sofia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1329, 'Liam', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1330, 'Mia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1331, 'Ryan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1332, 'Amelia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1333, 'Benjamin', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1334, 'Harper', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1335, 'Liam', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1336, 'Mia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1337, 'Elizabeth', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1338, 'Aria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1339, 'Matthew', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1340, 'Charlotte', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1341, 'Noah', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1342, 'Chloe', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1343, 'Alexander', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1344, 'Emily', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1345, 'Chloe', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1346, 'Liam', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1347, 'Gabriel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1348, 'Grace', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1349, 'Joseph', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1350, 'Isabella', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1351, 'Benjamin', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1352, 'John', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1353, 'Evelyn', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1354, 'Abigail', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1355, 'Ryan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1356, 'Nicholas', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1357, 'Avery', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1358, 'Luke', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1359, 'Ethan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1360, 'William', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1361, 'Lily', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1362, 'Evelyn', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1363, 'William', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1364, 'Alexander', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1365, 'Andrew', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1366, 'Ella', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1367, 'Lily', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1368, 'Ethan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1369, 'Emily', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1370, 'Jackson', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1371, 'Matthew', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1372, 'Gabriel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1373, 'Liam', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1374, 'Sofia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1375, 'Aubrey', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1376, 'Aria', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1377, 'Aubrey', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1378, 'Madison', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1379, 'Dylan', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1380, 'Alexander', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1381, 'Ava', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1382, 'Gabriel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1383, 'Sofia', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1384, 'Jackson', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1385, 'Liam', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1386, 'Michael', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1387, 'Jackson', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1388, 'Emma', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1389, 'Grace', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1390, 'David', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1391, 'Elizabeth', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1392, 'Daniel', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1393, 'Joseph', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1394, 'Emma', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1395, 'Andrew', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1396, 'Aubrey', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1397, 'Noah', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1398, 'Benjamin', null, 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1399, 'Daniel', null, 527345656, 'Israel');
commit;
prompt 400 records loaded
prompt Loading KID_IN_GROUP...
insert into KID_IN_GROUP (id_kid, id_group)
values (1009, 1109);
insert into KID_IN_GROUP (id_kid, id_group)
values (1018, 1037);
insert into KID_IN_GROUP (id_kid, id_group)
values (1025, 1190);
insert into KID_IN_GROUP (id_kid, id_group)
values (1037, 1228);
insert into KID_IN_GROUP (id_kid, id_group)
values (1039, 1390);
insert into KID_IN_GROUP (id_kid, id_group)
values (1047, 1063);
insert into KID_IN_GROUP (id_kid, id_group)
values (1099, 1237);
insert into KID_IN_GROUP (id_kid, id_group)
values (1105, 1131);
insert into KID_IN_GROUP (id_kid, id_group)
values (1109, 1304);
insert into KID_IN_GROUP (id_kid, id_group)
values (1120, 1159);
insert into KID_IN_GROUP (id_kid, id_group)
values (1131, 1055);
insert into KID_IN_GROUP (id_kid, id_group)
values (1134, 1039);
insert into KID_IN_GROUP (id_kid, id_group)
values (1136, 1302);
insert into KID_IN_GROUP (id_kid, id_group)
values (1143, 1226);
insert into KID_IN_GROUP (id_kid, id_group)
values (1177, 1167);
insert into KID_IN_GROUP (id_kid, id_group)
values (1182, 1293);
insert into KID_IN_GROUP (id_kid, id_group)
values (1208, 1394);
insert into KID_IN_GROUP (id_kid, id_group)
values (1246, 1202);
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
commit;
prompt 30 records loaded
prompt Loading PAYMENT...
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
commit;
prompt 25 records loaded
prompt Loading ROOMS...
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
commit;
prompt 30 records loaded
set feedback on
set define on
prompt Done.
