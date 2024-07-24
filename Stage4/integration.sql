-- Update existing tables
ALTER TABLE Teachers RENAME COLUMN id_Teacher TO idTeacher;
ALTER TABLE Teachers RENAME COLUMN t_name TO name;
ALTER TABLE Teachers RENAME COLUMN date_Of_Birth TO dateOfBirth;

ALTER TABLE Kids RENAME COLUMN id_Kid TO idKid;
ALTER TABLE Kids RENAME COLUMN k_name TO name;
ALTER TABLE Kids RENAME COLUMN date_of_birth TO dateOfBirth;
ALTER TABLE Kids RENAME COLUMN adress TO address;

ALTER TABLE Courses RENAME COLUMN id_Course TO idCourse;
ALTER TABLE Courses RENAME COLUMN Course_Name TO courseName;
ALTER TABLE Courses RENAME COLUMN age_Min TO ageMin;
ALTER TABLE Courses RENAME COLUMN age_Max TO ageMax;

ALTER TABLE Schedule RENAME COLUMN s_hour TO sHour;
ALTER TABLE Schedule RENAME COLUMN s_day TO sDay;
ALTER TABLE Schedule RENAME COLUMN id_Schedule TO idSchedule;

ALTER TABLE payment RENAME COLUMN id_Payment TO idPayment;
ALTER TABLE payment RENAME COLUMN payment_Method TO paymentMethod;
ALTER TABLE payment RENAME COLUMN id_Kid TO idKid;
ALTER TABLE payment RENAME COLUMN payment_sum TO paymentSum;
ALTER TABLE payment RENAME COLUMN payment_date TO paymentDate;

ALTER TABLE Course_Group RENAME COLUMN Id_Group TO idGroup;
ALTER TABLE Course_Group RENAME COLUMN id_Course TO idCourse;

ALTER TABLE Course_Has_Teacher RENAME COLUMN id_Course TO idCourse;
ALTER TABLE Course_Has_Teacher RENAME COLUMN id_Teacher TO idTeacher;

ALTER TABLE Kid_In_Group RENAME COLUMN id_Kid TO idKid;
ALTER TABLE Kid_In_Group RENAME COLUMN Id_Group TO idGroup;

ALTER TABLE group_In_Schedulle RENAME COLUMN Id_Group TO idGroup;
ALTER TABLE group_In_Schedulle RENAME COLUMN id_Schedule TO idSchedule;

ALTER TABLE Rooms RENAME COLUMN id_room TO idRoom;
ALTER TABLE Rooms RENAME COLUMN r_type TO rType;
ALTER TABLE Rooms RENAME COLUMN r_location TO location;
ALTER TABLE Rooms RENAME COLUMN Id_Group TO idGroup;

-- Create new tables
CREATE TABLE Subject
(
  idSubject NUMERIC(5) NOT NULL,
  subject_name VARCHAR(15) NOT NULL,
  PRIMARY KEY (idSubject)
);

CREATE TABLE circle
(
  circle_id NUMERIC(5) NOT NULL,
  student_num INT NOT NULL,
  PRIMARY KEY (circle_id)
);

CREATE TABLE Grade
(
  grade_id NUMERIC(5) NOT NULL,
  grade_name VARCHAR(15) NOT NULL,
  PRIMARY KEY (grade_id)
);

CREATE TABLE classes
(
  id_class NUMERIC(5) NOT NULL,
  NewAttribute VARCHAR(15),
  PRIMARY KEY (id_class)
);

-- Update relations
ALTER TABLE Courses ADD idSubject NUMERIC(5);
ALTER TABLE Courses ADD FOREIGN KEY (idSubject) REFERENCES Subject(idSubject);

ALTER TABLE Rooms ADD capacity INT NOT NULL;

-- Create new relationships
ALTER TABLE classes ADD grade_id NUMERIC(5);
ALTER TABLE classes ADD FOREIGN KEY (grade_id) REFERENCES Grade(grade_id);

ALTER TABLE circle ADD idKid NUMERIC(5);
ALTER TABLE circle ADD FOREIGN KEY (idKid) REFERENCES Kids(idKid);

-- Create linking tables
CREATE TABLE kid_in_circle
(
  idKid NUMERIC(5) NOT NULL,
  circle_id NUMERIC(5) NOT NULL,
  PRIMARY KEY (idKid, circle_id),
  FOREIGN KEY (idKid) REFERENCES Kids(idKid),
  FOREIGN KEY (circle_id) REFERENCES circle(circle_id)
);

CREATE TABLE group_in_class
(
  idGroup NUMERIC(5) NOT NULL,
  id_class NUMERIC(5) NOT NULL,
  PRIMARY KEY (idGroup, id_class),
  FOREIGN KEY (idGroup) REFERENCES Course_Group(idGroup),
  FOREIGN KEY (id_class) REFERENCES classes(id_class)
);

CREATE TABLE class_has_subject
(
  id_class NUMERIC(5) NOT NULL,
  idSubject NUMERIC(5) NOT NULL,
  PRIMARY KEY (id_class, idSubject),
  FOREIGN KEY (id_class) REFERENCES classes(id_class),
  FOREIGN KEY (idSubject) REFERENCES Subject(idSubject)
);

CREATE TABLE class_has_schedule
(
  id_class NUMERIC(5) NOT NULL,
  idSchedule NUMERIC(5) NOT NULL,
  PRIMARY KEY (id_class, idSchedule),
  FOREIGN KEY (id_class) REFERENCES classes(id_class),
  FOREIGN KEY (idSchedule) REFERENCES Schedule(idSchedule)
);

CREATE TABLE teacher_in_schedule
(
  idTeacher NUMERIC(5) NOT NULL,
  idSchedule NUMERIC(5) NOT NULL,
  PRIMARY KEY (idTeacher, idSchedule),
  FOREIGN KEY (idTeacher) REFERENCES Teachers(idTeacher),
  FOREIGN KEY (idSchedule) REFERENCES Schedule(idSchedule)
);

CREATE TABLE kid_in_grade
(
  idKid NUMERIC(5) NOT NULL,
  grade_id NUMERIC(5) NOT NULL,
  PRIMARY KEY (idKid, grade_id),
  FOREIGN KEY (idKid) REFERENCES Kids(idKid),
  FOREIGN KEY (grade_id) REFERENCES Grade(grade_id)
);

CREATE TABLE kid_payment
(
  idKid NUMERIC(5) NOT NULL,
  idPayment NUMERIC(5) NOT NULL,
  PRIMARY KEY (idKid, idPayment),
  FOREIGN KEY (idKid) REFERENCES Kids(idKid),
  FOREIGN KEY (idPayment) REFERENCES payment(idPayment)
);
