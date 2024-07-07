prompt PL/SQL Developer import file
prompt Created on יום ראשון 07 יולי 2024 by shani
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
alter table COURSES
  add constraint CHECK_COURSE_PRICE
  check (price >= 0);
alter table COURSES
  add constraint CHK_COURSE_PRICE
  check (price >= 0);

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
alter table KIDS
  add constraint CHECK_KID_PHONE
  check (LENGTH(phone) = 9);
alter table KIDS
  add constraint CHK_KID_PHONE
  check (LENGTH(phone) = 9);

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
  r_location VARCHAR2(15) default 'Unknown' not null,
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
values (8027, 'swimming', 110.5425, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1523, 'yoga', 104.40125, 11, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9642, 'photography', 108.700125, 13, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3216, 'pottery', 118.526125, 6, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2744, 'photography', 99.48825, 8, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7333, 'fencing', 116.069625, 9, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3064, 'yoga', 106.85775, 10, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4336, 'photography', 122.210875, 6, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5531, 'origami', 111.77075, 10, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2593, 'yoga', 100.7165, 8, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9655, 'gardening', 106.85775, 10, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5642, 'salsa dancing', 95.189375, 12, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8661, 'salsa dancing', 114.841375, 13, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1974, 'photography', 103.787125, 7, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9757, 'karate', 104.40125, 10, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7543, 'photography', 121.59675, 12, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3867, 'pottery', 112.999, 9, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7498, 'pottery', 111.156625, 9, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7852, 'pottery', 112.384875, 6, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3705, 'karate', 106.85775, 10, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4004, 'pottery', 93.961125, 12, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4259, 'origami', 95.8035, 8, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2541, 'photography', 110.5425, 9, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2660, 'photography', 92.11875, 12, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4837, 'gardening', 102.558875, 8, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3442, 'photography', 105.6295, 10, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6449, 'gardening', 93.347, 7, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7069, 'origami', 114.841375, 13, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3984, 'fencing', 110.5425, 12, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1495, 'origami', 120.3685, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7253, 'karate', 122.210875, 13, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9748, 'salsa dancing', 108.700125, 13, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7073, 'pottery', 114.841375, 6, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4884, 'pottery', 121.59675, 6, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3464, 'karate', 119.754375, 7, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3596, 'salsa dancing', 98.874125, 9, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8117, 'origami', 106.243625, 11, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4920, 'karate', 107.471875, 9, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9078, 'pottery', 116.069625, 6, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2840, 'yoga', 108.086, 11, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5775, 'pottery', 108.086, 13, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8104, 'photography', 106.85775, 6, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2181, 'salsa dancing', 100.7165, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8648, 'gardening', 111.156625, 9, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9850, 'karate', 116.68375, 9, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6746, 'origami', 93.961125, 8, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7726, 'origami', 122.825, 8, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7911, 'photography', 92.732875, 7, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5726, 'calligraphy', 110.5425, 12, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3701, 'gardening', 119.14025, 6, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5770, 'calligraphy', 119.14025, 6, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1726, 'fencing', 100.7165, 12, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1221, 'karate', 103.173, 13, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5038, 'yoga', 117.297875, 12, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2696, 'photography', 96.417625, 6, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8286, 'salsa dancing', 114.841375, 7, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9076, 'yoga', 112.384875, 12, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5125, 'photography', 92.732875, 12, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5377, 'gardening', 99.48825, 7, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8421, 'karate', 106.243625, 9, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4725, 'gardening', 115.4555, 9, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5224, 'calligraphy', 109.31425, 7, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5146, 'pottery', 111.77075, 8, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6654, 'pottery', 111.156625, 9, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4305, 'gardening', 92.732875, 9, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3063, 'photography', 98.26, 8, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3824, 'yoga', 93.347, 8, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4077, 'pottery', 93.961125, 10, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5064, 'karate', 111.156625, 8, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5981, 'fencing', 104.40125, 10, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3553, 'salsa dancing', 108.086, 7, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7287, 'origami', 121.59675, 7, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8995, 'calligraphy', 96.417625, 10, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9143, 'karate', 170, 12, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6705, 'yoga', 116.069625, 11, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8555, 'pottery', 109.928375, 13, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2725, 'yoga', 116.68375, 10, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4283, 'fencing', 99.48825, 10, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3567, 'calligraphy', 111.77075, 6, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9134, 'fencing', 103.173, 8, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8542, 'salsa dancing', 104.40125, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5365, 'fencing', 119.14025, 9, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9691, 'origami', 111.156625, 6, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9493, 'fencing', 114.841375, 10, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6977, 'pottery', 99.48825, 12, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6816, 'yoga', 107.471875, 13, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7611, 'photography', 105.6295, 12, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1516, 'salsa dancing', 97.03175, 8, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3192, 'origami', 108.086, 6, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2257, 'karate', 114.841375, 11, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4965, 'yoga', 101.94475, 10, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5842, 'gardening', 100.102375, 6, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9221, 'calligraphy', 98.26, 10, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2955, 'origami', 115.4555, 10, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8452, 'karate', 121.59675, 8, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9938, 'photography', 96.417625, 10, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1149, 'fencing', 116.68375, 11, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9650, 'calligraphy', 108.086, 11, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9991, 'fencing', 116.68375, 8, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1153, 'yoga', 102.558875, 7, 16);
commit;
prompt 100 records committed...
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8572, 'origami', 97.645875, 10, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6620, 'pottery', 93.961125, 13, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7302, 'calligraphy', 116.069625, 13, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2730, 'gardening', 94.57525, 8, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5716, 'photography', 120.3685, 11, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3527, 'gardening', 102.558875, 11, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7298, 'karate', 159, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7197, 'karate', 116.68375, 9, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4966, 'salsa dancing', 111.77075, 10, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2961, 'calligraphy', 100.102375, 10, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1922, 'salsa dancing', 106.85775, 9, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6940, 'pottery', 97.645875, 9, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5342, 'photography', 106.243625, 11, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1749, 'origami', 107.471875, 7, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2559, 'salsa dancing', 119.754375, 8, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5470, 'pottery', 108.086, 13, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5960, 'yoga', 92.11875, 10, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6337, 'calligraphy', 106.85775, 11, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9692, 'yoga', 92.732875, 7, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9086, 'gardening', 97.03175, 10, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3198, 'salsa dancing', 103.787125, 10, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7760, 'calligraphy', 94.57525, 13, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3496, 'photography', 122.825, 12, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4353, 'yoga', 109.31425, 7, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1878, 'salsa dancing', 102.558875, 9, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4673, 'karate', 107.471875, 12, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8362, 'origami', 96.417625, 6, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1261, 'photography', 194, 11, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3209, 'salsa dancing', 109.31425, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6632, 'fencing', 98.874125, 8, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5297, 'fencing', 98.26, 6, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9906, 'origami', 92.732875, 7, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6199, 'salsa dancing', 98.26, 12, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4678, 'origami', 105.015375, 6, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3569, 'photography', 179, 9, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9105, 'gardening', 117.912, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9472, 'fencing', 98.26, 7, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8209, 'origami', 108.700125, 10, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3074, 'salsa dancing', 100.7165, 13, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9387, 'calligraphy', 105.015375, 10, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8040, 'yoga', 118.526125, 6, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2664, 'gardening', 107.471875, 8, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3323, 'salsa dancing', 106.243625, 7, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1473, 'calligraphy', 93.961125, 11, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4555, 'pottery', 109.928375, 7, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8172, 'salsa dancing', 112.384875, 12, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6732, 'gardening', 117.912, 6, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5497, 'pottery', 98.874125, 8, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9442, 'photography', 112.999, 13, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9359, 'salsa dancing', 97.645875, 7, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9193, 'yoga', 100.102375, 12, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8829, 'fencing', 92.11875, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4447, 'salsa dancing', 122.825, 9, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9306, 'calligraphy', 109.31425, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7715, 'photography', 103.173, 13, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5755, 'fencing', 96.417625, 6, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6950, 'salsa dancing', 105.015375, 10, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1914, 'yoga', 110.5425, 13, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4481, 'salsa dancing', 108.700125, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4029, 'photography', 118.526125, 13, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2156, 'salsa dancing', 116.68375, 6, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4153, 'pottery', 95.189375, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4816, 'karate', 119.14025, 6, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2654, 'gardening', 112.999, 11, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2235, 'gardening', 92.732875, 9, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4335, 'photography', 95.189375, 13, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7936, 'gardening', 106.243625, 6, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9247, 'salsa dancing', 111.77075, 13, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8274, 'calligraphy', 111.156625, 8, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8536, 'salsa dancing', 96.417625, 6, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2716, 'photography', 93.961125, 9, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2202, 'origami', 190, 10, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6665, 'karate', 92.732875, 11, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2739, 'yoga', 97.645875, 11, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8627, 'origami', 93.347, 6, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3026, 'gardening', 102.558875, 12, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8870, 'fencing', 112.384875, 8, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8332, 'pottery', 116.069625, 7, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1926, 'calligraphy', 114.841375, 7, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7112, 'salsa dancing', 115.4555, 7, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1976, 'photography', 112.999, 6, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2899, 'karate', 113.613125, 7, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7931, 'gardening', 103.787125, 8, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6075, 'pottery', 114.841375, 6, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4783, 'fencing', 97.645875, 11, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5097, 'fencing', 111.156625, 9, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1689, 'gardening', 122.210875, 10, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4521, 'karate', 94.57525, 6, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6497, 'fencing', 122.210875, 9, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3141, 'origami', 119.14025, 11, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6353, 'karate', 93.347, 11, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9868, 'gardening', 112.384875, 7, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7163, 'pottery', 109.31425, 12, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5947, 'photography', 115.4555, 9, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1586, 'fencing', 97.03175, 13, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2180, 'fencing', 167, 10, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9382, 'pottery', 93.961125, 6, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1667, 'photography', 114.22725, 8, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4266, 'origami', 122.825, 10, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3488, 'pottery', 108.700125, 13, 13);
commit;
prompt 200 records committed...
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2882, 'salsa dancing', 107.471875, 6, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4630, 'karate', 119.754375, 12, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1702, 'karate', 120.982625, 6, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1816, 'origami', 94.57525, 8, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2358, 'yoga', 96.417625, 8, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8032, 'salsa dancing', 96.417625, 6, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4993, 'gardening', 102.558875, 7, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8827, 'photography', 116.68375, 9, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3796, 'gardening', 116.68375, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9495, 'origami', 109.31425, 13, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5538, 'fencing', 119.754375, 13, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7358, 'fencing', 117.912, 6, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4996, 'yoga', 98.874125, 7, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8009, 'pottery', 111.77075, 9, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9182, 'yoga', 93.347, 9, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8167, 'gardening', 116.68375, 8, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7739, 'calligraphy', 115.4555, 9, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6516, 'fencing', 112.999, 13, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1485, 'gardening', 118.526125, 10, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3511, 'yoga', 93.347, 8, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4970, 'yoga', 102.558875, 7, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5624, 'origami', 104.40125, 6, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5888, 'gardening', 117.297875, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8646, 'yoga', 93.347, 9, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9217, 'karate', 112.384875, 10, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8037, 'origami', 95.189375, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2374, 'origami', 100.102375, 13, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7184, 'karate', 105.015375, 11, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8356, 'fencing', 106.85775, 8, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9293, 'photography', 99.48825, 6, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1333, 'karate', 97.03175, 12, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7650, 'karate', 102.558875, 10, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3302, 'gardening', 95.8035, 11, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1940, 'fencing', 122.825, 13, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5487, 'gardening', 117.912, 10, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4975, 'photography', 120.3685, 10, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9301, 'fencing', 106.85775, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3973, 'photography', 112.999, 12, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3411, 'fencing', 119.754375, 9, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8483, 'photography', 93.347, 8, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5679, 'karate', 95.8035, 9, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4525, 'yoga', 109.928375, 10, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3895, 'karate', 93.347, 13, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7865, 'yoga', 111.77075, 8, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4552, 'calligraphy', 108.086, 6, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6997, 'photography', 107.471875, 7, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8892, 'yoga', 118.526125, 9, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8862, 'fencing', 105.015375, 9, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4717, 'gardening', 92.11875, 11, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5228, 'pottery', 107.471875, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1479, 'origami', 101.330625, 6, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2388, 'origami', 120.982625, 8, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1630, 'origami', 93.347, 11, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5601, 'fencing', 122.825, 6, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5283, 'pottery', 112.999, 10, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6868, 'pottery', 107.471875, 9, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7734, 'fencing', 97.645875, 13, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9487, 'photography', 98.874125, 11, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4407, 'photography', 105.6295, 11, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9760, 'fencing', 93.347, 10, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9915, 'fencing', 104.40125, 9, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3054, 'salsa dancing', 117.297875, 13, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8846, 'gardening', 112.999, 10, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8823, 'calligraphy', 112.384875, 6, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7755, 'photography', 112.384875, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7049, 'origami', 102.558875, 11, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1825, 'photography', 111.77075, 6, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2335, 'origami', 111.156625, 11, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9994, 'photography', 112.384875, 11, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4227, 'karate', 113.613125, 9, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1469, 'pottery', 116.069625, 12, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7316, 'fencing', 105.015375, 13, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3194, 'pottery', 117.297875, 11, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3876, 'fencing', 92.732875, 9, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6176, 'yoga', 109.31425, 10, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3298, 'fencing', 107.471875, 10, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3999, 'karate', 110.5425, 9, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8137, 'pottery', 100.102375, 11, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1127, 'karate', 100.7165, 9, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5467, 'salsa dancing', 108.086, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6989, 'fencing', 191, 7, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1157, 'gardening', 113.613125, 13, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5932, 'origami', 116.069625, 10, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8650, 'karate', 93.961125, 7, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2636, 'yoga', 99.48825, 10, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6986, 'origami', 115.4555, 11, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1090, 'photography', 97.645875, 10, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3570, 'gardening', 122.210875, 10, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5328, 'pottery', 122.210875, 6, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1422, 'yoga', 111.77075, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1118, 'photography', 111.156625, 6, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3698, 'yoga', 105.015375, 8, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3517, 'origami', 103.787125, 8, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9239, 'photography', 116.68375, 8, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4623, 'photography', 117.912, 11, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7860, 'karate', 104.40125, 12, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7336, 'yoga', 108.086, 12, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9892, 'pottery', 120.982625, 12, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5856, 'fencing', 114.22725, 7, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9212, 'fencing', 110.5425, 12, 18);
commit;
prompt 300 records committed...
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9240, 'yoga', 101.330625, 13, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3450, 'pottery', 101.330625, 8, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6239, 'yoga', 106.243625, 7, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7174, 'origami', 110.5425, 7, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9291, 'origami', 105.6295, 8, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8155, 'salsa dancing', 93.961125, 6, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3844, 'gardening', 108.700125, 11, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5440, 'salsa dancing', 116.68375, 13, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6064, 'karate', 109.928375, 8, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4922, 'calligraphy', 101.94475, 13, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1041, 'karate', 101.330625, 11, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9805, 'origami', 116.069625, 6, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2123, 'pottery', 153, 12, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1737, 'karate', 111.156625, 9, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7475, 'pottery', 111.77075, 12, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8563, 'photography', 106.243625, 11, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1112, 'gardening', 92.11875, 6, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (1209, 'yoga', 115.4555, 13, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9309, 'yoga', 167, 11, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4664, 'salsa dancing', 97.645875, 12, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8346, 'salsa dancing', 105.015375, 9, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5857, 'fencing', 92.732875, 12, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3634, 'origami', 95.8035, 9, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5160, 'karate', 101.94475, 9, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3928, 'yoga', 112.999, 13, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2606, 'origami', 96.417625, 11, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5995, 'fencing', 122.825, 12, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4328, 'origami', 117.912, 11, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5862, 'calligraphy', 100.102375, 7, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8849, 'origami', 95.189375, 11, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4934, 'photography', 115.4555, 9, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3718, 'pottery', 93.347, 7, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5433, 'karate', 100.7165, 11, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9869, 'gardening', 117.297875, 7, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (6658, 'photography', 106.243625, 6, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5151, 'gardening', 105.6295, 8, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4416, 'salsa dancing', 105.015375, 9, 14);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4898, 'salsa dancing', 112.999, 13, 16);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (5575, 'origami', 107.471875, 12, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7491, 'pottery', 112.999, 13, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9119, 'gardening', 105.6295, 6, 13);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8810, 'pottery', 113.613125, 11, 15);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (3021, 'origami', 122.210875, 13, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (9640, 'fencing', 107.471875, 12, 18);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (8958, 'fencing', 117.912, 6, 17);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (2824, 'origami', 99.48825, 11, 19);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (7189, 'photography', 119.754375, 6, 20);
insert into COURSES (id_course, course_name, price, age_min, age_max)
values (4158, 'salsa dancing', 93.347, 10, 17);
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
values (9157, 'Ayelet', to_date('08-05-1990', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (5634, 'Dvora', to_date('21-12-1985', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (89444, 'Elisheva', to_date('25-11-1978', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (44929, 'Yafit', to_date('05-10-1984', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (75182, 'Elisheva', to_date('16-11-1976', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (36290, 'Elisheva', to_date('03-11-1977', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (18571, 'Tamar', to_date('22-12-1988', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (24366, 'Bracha', to_date('02-09-1993', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (95960, 'Ayelet', to_date('10-07-1993', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (42866, 'Dvora', to_date('19-11-1975', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (43117, 'Dvora', to_date('03-06-1980', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (39781, 'Bracha', to_date('16-01-1978', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (34451, 'Tamar', to_date('26-06-1983', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (96971, 'Ayelet', to_date('27-03-1994', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (93830, 'Elisheva', to_date('10-07-1977', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (95133, 'Dvora', to_date('15-12-1991', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (93972, 'Ayelet', to_date('01-02-1990', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (51383, 'Elisheva', to_date('09-12-1991', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (18984, 'Ayelet', to_date('10-01-1985', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (78811, 'Dvora', to_date('21-02-1980', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (83394, 'Yafit', to_date('16-08-1987', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (88459, 'Yafit', to_date('06-08-1984', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (54625, 'Elisheva', to_date('05-11-1985', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (16300, 'Ayelet', to_date('19-06-1992', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (37566, 'Tamar', to_date('16-03-1979', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (32101, 'Elisheva', to_date('08-02-1977', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (87380, 'Yafit', to_date('08-03-1993', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (65797, 'Dvora', to_date('14-01-1990', 'dd-mm-yyyy'), 50673892, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (71659, 'Tamar', to_date('23-02-1980', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (4164, 'Elisheva', to_date('03-10-1976', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (87053, 'Dvora', to_date('27-06-1975', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (35472, 'Dvora', to_date('08-03-1976', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (65537, 'Dvora', to_date('02-12-1985', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (74076, 'Yafit', to_date('24-06-1983', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (7465, 'Ayelet', to_date('19-01-1991', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (14970, 'Ayelet', to_date('08-11-1989', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (96490, 'Tamar', to_date('11-05-1983', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (14036, 'Bracha', to_date('06-02-1993', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (62866, 'Elisheva', to_date('01-11-1975', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (7860, 'Bracha', to_date('18-04-1992', 'dd-mm-yyyy'), 521234567, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (17630, 'Elisheva', to_date('25-12-1975', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (33389, 'Dvora', to_date('24-03-1994', 'dd-mm-yyyy'), 50673892, 'TLV');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (86375, 'Dvora', to_date('15-11-1984', 'dd-mm-yyyy'), 521234567, 'Jerusalem');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (16046, 'Bracha', to_date('25-11-1984', 'dd-mm-yyyy'), 521234567, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (97965, 'Ayelet', to_date('14-02-1977', 'dd-mm-yyyy'), 50673892, 'Nahariya');
insert into TEACHERS (id_teacher, t_name, date_of_birth, phone, address)
values (85281, 'Tamar', to_date('05-03-1979', 'dd-mm-yyyy'), 50673892, 'TLV');
commit;
prompt 46 records loaded
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
values (1000, 'Daniel', to_date('11-04-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1001, 'Sophia', to_date('11-07-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1002, 'Benjamin', to_date('16-05-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1003, 'Ryan', to_date('26-10-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1004, 'Grace', to_date('11-03-2013', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1005, 'Joshua', to_date('29-03-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1006, 'Isabella', to_date('05-04-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1007, 'Isabella', to_date('03-01-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1008, 'Elizabeth', to_date('16-10-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1009, 'Emma', to_date('23-08-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1010, 'Andrew', to_date('16-10-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1011, 'David', to_date('11-06-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1012, 'Gabriel', to_date('20-07-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1013, 'Luke', to_date('25-11-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1014, 'Chloe', to_date('25-10-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1015, 'Noah', to_date('29-03-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1016, 'Ryan', to_date('03-03-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1017, 'Amelia', to_date('23-10-2013', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1018, 'Samuel', to_date('23-07-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1019, 'Scarlett', to_date('22-06-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1020, 'Evelyn', to_date('28-12-2002', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1021, 'Harper', to_date('07-04-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1022, 'Ella', to_date('11-01-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1023, 'Nicholas', to_date('27-03-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1024, 'Ava', to_date('29-04-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1025, 'Alexander', to_date('05-01-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1026, 'Madison', to_date('09-02-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1027, 'James', to_date('11-05-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1028, 'Layla', to_date('18-07-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1029, 'Joseph', to_date('20-02-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1030, 'Olivia', to_date('12-06-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1031, 'Samuel', to_date('13-05-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1032, 'Christopher', to_date('13-12-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1033, 'Noah', to_date('25-10-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1034, 'Joseph', to_date('20-06-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1035, 'Avery', to_date('13-10-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1036, 'Matthew', to_date('09-01-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1037, 'Sophia', to_date('08-11-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1038, 'Olivia', to_date('07-03-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1039, 'Emily', to_date('14-11-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1040, 'Harper', to_date('18-12-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1041, 'Matthew', to_date('02-12-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1042, 'Ava', to_date('21-03-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1043, 'James', to_date('04-01-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1044, 'Noah', to_date('13-10-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1045, 'Victoria', to_date('17-06-2002', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1046, 'Ryan', to_date('26-09-2002', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1047, 'John', to_date('11-01-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1048, 'William', to_date('03-01-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1049, 'Aria', to_date('21-01-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1050, 'Liam', to_date('16-01-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1051, 'Isabella', to_date('12-08-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1052, 'Alexander', to_date('29-09-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1053, 'Avery', to_date('10-03-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1054, 'Alexander', to_date('19-12-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1055, 'Liam', to_date('07-08-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1056, 'Joseph', to_date('16-07-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1057, 'Anthony', to_date('25-06-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1058, 'James', to_date('04-03-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1059, 'Charlotte', to_date('26-09-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1060, 'Matthew', to_date('18-05-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1061, 'Elizabeth', to_date('16-09-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1062, 'Abigail', to_date('16-05-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1063, 'Sophia', to_date('28-09-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1064, 'Anthony', to_date('17-06-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1065, 'Benjamin', to_date('05-04-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1066, 'Aria', to_date('23-03-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1067, 'Harper', to_date('28-07-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1068, 'Grace', to_date('02-10-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1069, 'Evelyn', to_date('31-12-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1070, 'Andrew', to_date('09-02-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1071, 'Anthony', to_date('17-02-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1072, 'Aria', to_date('24-09-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1073, 'Emma', to_date('11-10-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1074, 'Anthony', to_date('24-06-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1075, 'Emma', to_date('10-10-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1076, 'Madison', to_date('22-09-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1077, 'Nicholas', to_date('05-10-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1078, 'Scarlett', to_date('06-04-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1079, 'Ryan', to_date('02-05-2002', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1080, 'Sofia', to_date('25-01-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1081, 'Aria', to_date('25-02-2002', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1082, 'Matthew', to_date('19-12-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1083, 'Aria', to_date('16-04-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1084, 'Michael', to_date('29-04-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1085, 'Evelyn', to_date('30-05-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1086, 'James', to_date('19-12-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1087, 'Benjamin', to_date('27-06-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1088, 'Mia', to_date('19-04-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1089, 'Evelyn', to_date('22-08-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1090, 'Scarlett', to_date('10-07-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1091, 'Aria', to_date('26-05-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1092, 'Samuel', to_date('24-07-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1093, 'Christopher', to_date('21-07-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1094, 'Luke', to_date('11-08-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1095, 'Aria', to_date('03-06-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1096, 'Ethan', to_date('08-03-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1097, 'Dylan', to_date('12-06-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1098, 'Noah', to_date('31-07-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1099, 'Lily', to_date('15-07-2013', 'dd-mm-yyyy'), 527345656, 'Israel');
commit;
prompt 100 records committed...
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1100, 'Olivia', to_date('16-06-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1101, 'Sofia', to_date('04-11-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1102, 'Aubrey', to_date('28-02-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1103, 'Elizabeth', to_date('27-09-2002', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1104, 'Mia', to_date('31-10-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1105, 'Samuel', to_date('09-07-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1106, 'Charlotte', to_date('21-05-2013', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1107, 'Joshua', to_date('22-06-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1108, 'Evelyn', to_date('13-12-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1109, 'Evelyn', to_date('24-03-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1110, 'Dylan', to_date('07-12-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1111, 'Henry', to_date('09-08-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1112, 'Olivia', to_date('19-08-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1113, 'Evelyn', to_date('21-02-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1114, 'Evelyn', to_date('11-01-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1115, 'Ryan', to_date('14-09-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1116, 'Joseph', to_date('13-02-2002', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1118, 'Matthew', to_date('26-03-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1119, 'Ella', to_date('04-10-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1120, 'Mia', to_date('26-11-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1122, 'Lily', to_date('22-12-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1123, 'Lily', to_date('26-04-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1125, 'Emily', to_date('20-09-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1126, 'Isabella', to_date('20-07-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1127, 'Christopher', to_date('29-11-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1128, 'Ava', to_date('22-03-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1130, 'Andrew', to_date('24-04-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1131, 'Sophia', to_date('07-03-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1133, 'Sophia', to_date('03-06-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1134, 'Sofia', to_date('26-01-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1135, 'Madison', to_date('24-11-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1137, 'Harper', to_date('09-05-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1138, 'Mia', to_date('06-10-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1139, 'Avery', to_date('12-04-2002', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1141, 'Aria', to_date('24-11-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1142, 'Nicholas', to_date('03-02-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1143, 'Ella', to_date('06-12-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1145, 'Henry', to_date('20-07-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1146, 'Joshua', to_date('07-02-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1147, 'Henry', to_date('07-09-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1149, 'Grace', to_date('04-11-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1150, 'Alexander', to_date('06-03-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1151, 'Michael', to_date('30-01-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1153, 'Mia', to_date('21-07-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1154, 'Noah', to_date('06-11-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1155, 'Mia', to_date('04-01-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1157, 'James', to_date('16-09-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1158, 'James', to_date('26-08-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1159, 'Elizabeth', to_date('20-01-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1161, 'Olivia', to_date('11-09-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1162, 'Dylan', to_date('27-08-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1163, 'William', to_date('22-07-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1165, 'Daniel', to_date('02-01-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1166, 'Henry', to_date('03-07-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1167, 'Nicholas', to_date('22-04-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1169, 'Luke', to_date('17-10-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1170, 'Isabella', to_date('23-12-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1171, 'William', to_date('04-10-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1173, 'Emma', to_date('29-04-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1174, 'Harper', to_date('09-09-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1176, 'Scarlett', to_date('18-04-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1177, 'Elizabeth', to_date('29-01-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1178, 'William', to_date('30-12-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1180, 'Amelia', to_date('24-07-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1181, 'Nicholas', to_date('23-09-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1182, 'Abigail', to_date('29-12-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1184, 'Aubrey', to_date('12-08-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1185, 'Elizabeth', to_date('28-02-2002', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1186, 'Joseph', to_date('10-03-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1188, 'William', to_date('16-02-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1189, 'Abigail', to_date('19-09-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1191, 'William', to_date('03-04-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1192, 'Aubrey', to_date('19-01-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1193, 'Lily', to_date('02-06-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1195, 'Lily', to_date('14-04-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1196, 'Emily', to_date('26-11-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1197, 'Dylan', to_date('07-08-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1199, 'Emily', to_date('12-04-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1200, 'Ethan', to_date('05-05-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1201, 'Ella', to_date('30-01-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1203, 'Elizabeth', to_date('15-02-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1204, 'Amelia', to_date('02-03-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1205, 'Harper', to_date('13-11-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1207, 'Victoria', to_date('26-06-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1208, 'Christopher', to_date('17-08-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1209, 'Matthew', to_date('06-11-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1211, 'Alexander', to_date('15-02-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1212, 'Daniel', to_date('09-06-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1214, 'David', to_date('20-06-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1215, 'Ava', to_date('12-03-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1216, 'Ella', to_date('09-11-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1218, 'Victoria', to_date('21-09-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1219, 'Liam', to_date('10-10-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1220, 'Alexander', to_date('21-09-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1222, 'Grace', to_date('25-07-2002', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1223, 'Samuel', to_date('18-07-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1224, 'Liam', to_date('19-03-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1226, 'Luke', to_date('17-01-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1227, 'Emma', to_date('19-02-2013', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1228, 'Henry', to_date('04-12-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
commit;
prompt 200 records committed...
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1230, 'John', to_date('18-12-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1231, 'Emily', to_date('22-08-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1233, 'Samuel', to_date('10-06-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1234, 'Abigail', to_date('25-07-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1235, 'Aria', to_date('23-09-2002', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1236, 'Benjamin', to_date('05-08-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1237, 'Avery', to_date('06-10-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1238, 'Isabella', to_date('23-11-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1239, 'Ethan', to_date('30-03-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1240, 'Lily', to_date('04-01-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1241, 'Aubrey', to_date('22-08-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1242, 'Jackson', to_date('16-04-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1243, 'Luke', to_date('25-07-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1244, 'Ava', to_date('12-05-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1245, 'Andrew', to_date('02-06-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1246, 'Victoria', to_date('13-06-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1247, 'William', to_date('27-11-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1248, 'Harper', to_date('06-04-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1249, 'Ethan', to_date('22-07-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1250, 'Sophia', to_date('23-01-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1251, 'Ella', to_date('17-08-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1252, 'Abigail', to_date('22-01-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1253, 'Benjamin', to_date('19-10-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1254, 'Daniel', to_date('27-10-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1255, 'William', to_date('23-07-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1256, 'Elizabeth', to_date('23-11-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1257, 'Charlotte', to_date('27-06-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1258, 'Ella', to_date('06-04-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1259, 'Elizabeth', to_date('03-02-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1260, 'William', to_date('17-10-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1261, 'Anthony', to_date('23-09-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1262, 'Abigail', to_date('14-02-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1263, 'Anthony', to_date('15-10-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1264, 'Dylan', to_date('16-04-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1265, 'William', to_date('05-01-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1266, 'Chloe', to_date('07-11-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1267, 'Nicholas', to_date('11-01-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1268, 'Nicholas', to_date('27-05-2013', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1269, 'Gabriel', to_date('11-05-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1270, 'Anthony', to_date('09-06-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1271, 'Gabriel', to_date('13-11-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1272, 'Matthew', to_date('26-06-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1273, 'Benjamin', to_date('06-01-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1274, 'Sophia', to_date('05-05-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1275, 'Abigail', to_date('31-01-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1276, 'Samuel', to_date('17-11-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1277, 'Andrew', to_date('04-01-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1278, 'Andrew', to_date('14-06-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1279, 'Michael', to_date('23-06-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1280, 'Emma', to_date('14-05-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1281, 'John', to_date('07-02-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1282, 'Ethan', to_date('06-10-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1283, 'Evelyn', to_date('25-12-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1284, 'Noah', to_date('24-09-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1285, 'Madison', to_date('13-10-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1286, 'Amelia', to_date('12-03-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1287, 'Gabriel', to_date('19-01-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1288, 'Ryan', to_date('04-12-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1289, 'Elizabeth', to_date('29-10-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1290, 'Amelia', to_date('26-10-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1291, 'Aria', to_date('21-05-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1292, 'Amelia', to_date('29-06-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1293, 'Benjamin', to_date('06-01-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1294, 'Joshua', to_date('11-01-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1295, 'Avery', to_date('20-04-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1296, 'Ava', to_date('26-08-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1297, 'Henry', to_date('21-02-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1298, 'Charlotte', to_date('06-08-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1299, 'Abigail', to_date('06-10-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1300, 'Nicholas', to_date('12-10-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1301, 'Nicholas', to_date('20-11-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1302, 'Chloe', to_date('09-10-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1303, 'Aria', to_date('30-09-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1304, 'Daniel', to_date('27-07-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1305, 'Grace', to_date('26-05-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1306, 'Nicholas', to_date('16-09-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1307, 'Victoria', to_date('09-12-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1308, 'Alexander', to_date('24-10-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1309, 'Andrew', to_date('09-04-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1310, 'James', to_date('12-01-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1311, 'Scarlett', to_date('06-04-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1312, 'Avery', to_date('03-08-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1313, 'Dylan', to_date('10-01-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1314, 'Noah', to_date('28-01-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1315, 'Scarlett', to_date('10-07-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1316, 'Madison', to_date('06-07-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1317, 'Ava', to_date('26-04-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1318, 'Aria', to_date('03-11-2002', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1319, 'Samuel', to_date('20-03-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1320, 'Jackson', to_date('02-11-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1321, 'Chloe', to_date('02-09-2002', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1322, 'Joseph', to_date('02-06-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1323, 'Nicholas', to_date('22-11-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1324, 'Ella', to_date('17-05-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1325, 'Isabella', to_date('19-06-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1326, 'Emily', to_date('02-03-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1327, 'Aubrey', to_date('19-02-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1328, 'Sofia', to_date('27-02-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1329, 'Liam', to_date('07-12-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1330, 'Mia', to_date('06-11-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
commit;
prompt 300 records committed...
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1331, 'Ryan', to_date('28-08-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1332, 'Amelia', to_date('24-11-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1333, 'Benjamin', to_date('22-03-2013', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1334, 'Harper', to_date('23-03-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1335, 'Liam', to_date('09-12-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1336, 'Mia', to_date('04-07-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1337, 'Elizabeth', to_date('22-06-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1338, 'Aria', to_date('03-12-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1339, 'Matthew', to_date('18-07-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1340, 'Charlotte', to_date('20-01-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1341, 'Noah', to_date('24-03-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1342, 'Chloe', to_date('26-04-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1343, 'Alexander', to_date('07-07-2013', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1344, 'Emily', to_date('07-11-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1345, 'Chloe', to_date('22-11-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1346, 'Liam', to_date('28-11-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1347, 'Gabriel', to_date('02-01-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1348, 'Grace', to_date('01-05-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1349, 'Joseph', to_date('13-11-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1350, 'Isabella', to_date('08-07-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1351, 'Benjamin', to_date('29-06-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1352, 'John', to_date('24-10-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1353, 'Evelyn', to_date('05-01-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1354, 'Abigail', to_date('28-08-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1355, 'Ryan', to_date('26-02-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1356, 'Nicholas', to_date('08-05-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1357, 'Avery', to_date('09-12-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1359, 'Ethan', to_date('22-09-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1360, 'William', to_date('03-05-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1361, 'Lily', to_date('23-07-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1363, 'William', to_date('17-09-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1364, 'Alexander', to_date('29-06-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1366, 'Ella', to_date('14-03-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1367, 'Lily', to_date('04-02-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1368, 'Ethan', to_date('01-07-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1370, 'Jackson', to_date('25-01-2002', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1371, 'Matthew', to_date('28-07-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1372, 'Gabriel', to_date('18-07-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1374, 'Sofia', to_date('24-09-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1375, 'Aubrey', to_date('09-09-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1376, 'Aria', to_date('24-07-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1378, 'Madison', to_date('24-11-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1379, 'Dylan', to_date('15-09-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1381, 'Ava', to_date('07-09-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1382, 'Gabriel', to_date('17-08-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1383, 'Sofia', to_date('20-12-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1384, 'Jackson', to_date('11-12-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1386, 'Michael', to_date('24-10-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1387, 'Jackson', to_date('01-04-2002', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1389, 'Grace', to_date('09-02-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1390, 'David', to_date('31-08-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1391, 'Elizabeth', to_date('02-11-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1393, 'Joseph', to_date('08-07-2017', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1394, 'Emma', to_date('03-04-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1395, 'Andrew', to_date('20-07-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1397, 'Noah', to_date('08-07-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1398, 'Benjamin', to_date('11-08-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1399, 'Daniel', to_date('08-05-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1117, 'Mia', to_date('03-05-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1121, 'Emma', to_date('29-09-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1124, 'Charlotte', to_date('20-07-2013', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1129, 'Aria', to_date('22-01-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1132, 'Ethan', to_date('09-08-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1136, 'Madison', to_date('03-09-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1140, 'Layla', to_date('21-08-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1144, 'Samuel', to_date('13-10-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1148, 'Anthony', to_date('21-11-2002', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1152, 'Alexander', to_date('10-03-2015', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1156, 'Dylan', to_date('25-07-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1160, 'Christopher', to_date('31-07-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1164, 'Elizabeth', to_date('25-08-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1168, 'Mia', to_date('30-06-2000', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1172, 'John', to_date('27-03-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1175, 'Harper', to_date('07-09-2004', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1179, 'Ethan', to_date('09-06-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1183, 'Amelia', to_date('30-05-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1187, 'Ella', to_date('02-03-2008', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1190, 'Emma', to_date('15-12-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1194, 'Benjamin', to_date('31-10-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1198, 'Isabella', to_date('29-03-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1202, 'Andrew', to_date('11-06-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1206, 'Henry', to_date('07-10-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1210, 'Liam', to_date('12-06-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1213, 'Ethan', to_date('23-08-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1217, 'Aubrey', to_date('04-11-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1221, 'David', to_date('17-06-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1225, 'Madison', to_date('24-10-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1229, 'Mia', to_date('05-12-2006', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1232, 'Grace', to_date('27-02-2005', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1358, 'Luke', to_date('19-11-2011', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1362, 'Evelyn', to_date('06-08-2012', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1365, 'Andrew', to_date('04-04-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1369, 'Emily', to_date('29-12-2016', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1373, 'Liam', to_date('26-02-2014', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1377, 'Aubrey', to_date('30-04-2001', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1380, 'Alexander', to_date('02-05-2007', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1385, 'Liam', to_date('05-07-2003', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1388, 'Emma', to_date('28-02-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1392, 'Daniel', to_date('12-01-2009', 'dd-mm-yyyy'), 527345656, 'Israel');
insert into KIDS (id_kid, k_name, date_of_birth, phone, adress)
values (1396, 'Aubrey', to_date('26-06-2010', 'dd-mm-yyyy'), 527345656, 'Israel');
commit;
prompt 400 records loaded
prompt Loading KID_IN_GROUP...
insert into KID_IN_GROUP (id_kid, id_group)
values (1000, 1000);
insert into KID_IN_GROUP (id_kid, id_group)
values (1001, 1000);
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
prompt 32 records loaded
prompt Loading PAYMENT...
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (1, 'Check', 1261, 109, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (2, 'Cash', 1240, 112, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (3, 'Bit', 1356, 181, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (4, 'Check', 1063, 157, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (5, 'PayBox', 1062, 129, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (6, 'Check', 1202, 194, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (7, 'Bit', 1148, 149, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (8, 'Cash', 1209, 112, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (9, 'Cash', 1103, 125, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (10, 'Bit', 1196, 111, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (11, 'Bit', 1065, 187, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (12, 'Cash', 1075, 167, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (13, 'Check', 1388, 135, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (14, 'Cash', 1004, 198, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (15, 'Check', 1132, 138, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (16, 'Credit', 1183, 181, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (17, 'Check', 1243, 150, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (18, 'PayBox', 1208, 181, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (19, 'Bit', 1082, 168, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (20, 'Cash', 1295, 180, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (21, 'Bit', 1077, 102, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (22, 'Cash', 1005, 196, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (23, 'Credit', 1176, 106, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (24, 'Credit', 1184, 134, null);
insert into PAYMENT (id_payment, payment_method, id_kid, payment_sum, payment_date)
values (25, 'Bit', 1252, 110, null);
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
