CREATE TABLE Teachers
(
  id_Teacher NUMERIC(5) NOT NULL,
  t_name VARCHAR(15),
  date_Of_Birth DATE,
  phone NUMERIC(9) NOT NULL,
  address VARCHAR(15),
  PRIMARY KEY (id_Teacher)
);

CREATE TABLE Kids
(
  id_Kid NUMERIC(5) NOT NULL,
  k_name VARCHAR(15) NOT NULL,
  date_of_birth DATE,
  phone NUMERIC(9) NOT NULL,
  adress VARCHAR(15),
  PRIMARY KEY (id_Kid)
);

CREATE TABLE Courses
(
  id_Course NUMERIC(5) NOT NULL,
  Course_Name VARCHAR(15) NOT NULL,
  price FLOAT NOT NULL,
  age_Min INT NOT NULL,
  age_Max INT NOT NULL,
  PRIMARY KEY (id_Course)
);

CREATE TABLE Schedule
(
  s_hour NUMERIC(2) NOT NULL,
  s_day VARCHAR(15) NOT NULL,
  id_Schedule NUMERIC(5) NOT NULL,
  PRIMARY KEY (id_Schedule)
);

CREATE TABLE payment
(
  id_Payment NUMERIC(5) NOT NULL,
  payment_Method VARCHAR(15) NOT NULL,
  id_Kid NUMERIC(5) NOT NULL,
  PRIMARY KEY (id_Payment),
  FOREIGN KEY (id_Kid) REFERENCES Kids(id_Kid)
);

CREATE TABLE Course_Group
(
  Id_Group INT NOT NULL,
  id_Course NUMERIC(5) NOT NULL,
  PRIMARY KEY (Id_Group),
  FOREIGN KEY (id_Course) REFERENCES Courses(id_Course)
);

CREATE TABLE Course_Has_Teacher
(
  id_Course NUMERIC(5) NOT NULL,
  id_Teacher NUMERIC(5) NOT NULL,
  PRIMARY KEY (id_Course, id_Teacher),
  FOREIGN KEY (id_Course) REFERENCES Courses(id_Course),
  FOREIGN KEY (id_Teacher) REFERENCES Teachers(id_Teacher)
);

CREATE TABLE Kid_In_Group
(
  id_Kid NUMERIC(5) NOT NULL,
  Id_Group INT NOT NULL,
  PRIMARY KEY (id_Kid, Id_Group),
  FOREIGN KEY (id_Kid) REFERENCES Kids(id_Kid),
  FOREIGN KEY (Id_Group) REFERENCES Course_Group(Id_Group)
);

CREATE TABLE group_In_Schedulle
(
  Id_Group INT NOT NULL,
  id_Schedule INT NOT NULL,
  PRIMARY KEY (Id_Group),
  FOREIGN KEY (Id_Group) REFERENCES Course_Group(Id_Group),
  FOREIGN KEY (id_Schedule) REFERENCES Schedule(id_Schedule)
);

CREATE TABLE Rooms
(
  id_room NUMERIC(5) NOT NULL,
  r_type VARCHAR(15) NOT NULL,
  r_location VARCHAR(15) NOT NULL,
  Id_Group INT NOT NULL,
  PRIMARY KEY (id_room),
  FOREIGN KEY (Id_Group) REFERENCES Course_Group(Id_Group)
);
