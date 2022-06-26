use master
go

// Creating Database
CREATE DATABASE University_Management_System
GO
// Only have to give in SQL Server
USE University_Management_System
GO

// Creating Tables

CREATE TABLE DEPARTMENT
(
    department_id INT NOT NULL, CONSTRAINT pk_department_id PRIMARY KEY (department_id), // column Constraint (primary key)
    department_name NVARCHAR(50) NOT NULL,
);
GO

CREATE TABLE STUDENT
(
    student_id INT NOT NULL, CONSTRAINT pk_student_id PRIMARY KEY (student_id), 
    student_name NVARCHAR(50) NOT NULL,
    department_id INT NULL,
    age INT NOT NULL,
    gender NVARCHAR(10) NOT NULL,
    phone NVARCHAR(12) NULL,
    address NVARCHAR(50) NULL,
    CONSTRAINT fk_department_id FOREIGN KEY (department_id) REFERENCES DEPARTMENT(department_id) //Table Constraint (foreign key)
);
GO

CREATE TABLE COURSE 
(
    course_code INT NOT NULL, CONSTRAINT pk_course_id PRIMARY KEY (course_code),
    course_name NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE COURSE_DEPARTMENT
(
    course_code INT NULL, 
    department_id INT NULL,
    CONSTRAINT fk_course_code FOREIGN KEY (course_code) REFERENCES COURSE(course_code),
    CONSTRAINT fk_department_id1 FOREIGN KEY (department_id) REFERENCES DEPARTMENT(department_id)
);
GO

CREATE TABLE STUDENT_COURSE
(
    student_id INT NULL,
    course_code INT NULL,
    CONSTRAINT fk_course_code1 FOREIGN KEY (course_code) REFERENCES COURSE(course_code),
    CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES STUDENT(student_id),
);
GO

CREATE TABLE FACULTY
(
    faculty_id INT NOT NULL, CONSTRAINT pk_faculty_id PRIMARY KEY (faculty_id),
    name NVARCHAR(50) NOT NULL, 
    department_id INT NULL,
    age INT NOT NULL,
    gender NVARCHAR(10) NOT NULL,
    address NVARCHAR(50) NULL,
    phone NVARCHAR(12) NULL,
    salary float NOT NULL,
    designation NVARCHAR(50) NOT NULL,
    CONSTRAINT fk_department_id2 FOREIGN KEY (department_id) REFERENCES DEPARTMENT(department_id)
);
GO

CREATE TABLE FACULTY_COURSE
(
    course_code INT NULL,
    faculty_id INT NULL,
    CONSTRAINT fk_course_code2 FOREIGN KEY (course_code) REFERENCES COURSE(course_code),
    CONSTRAINT fk_faculty_id FOREIGN KEY (faculty_id) REFERENCES FACULTY(faculty_id)
);
GO

CREATE TABLE RESEARCH_PROJECT
(
    project_id INT NOT NULL, CONSTRAINT pk_project_id PRIMARY KEY (project_id),
    project_name NVARCHAR(50) NOT NULL,
    duration NVARCHAR(10) NULL,
);
GO

CREATE TABLE FACULTY_PROJECT
(
    faculty_id INT NULL,
    project_id INT NULL,
    CONSTRAINT fk_faculty_id1 FOREIGN KEY (faculty_id) REFERENCES FACULTY(faculty_id),
    CONSTRAINT fk_project_idd FOREIGN KEY (project_id) REFERENCES RESEARCH_PROJECT(project_id)

);
GO

--*************************************************************--
// populating tables with data 

INSERT INTO DEPARTMENT (department_id, department_name)
VALUES
(1, 'COMPUTER SCIENCE'),
(2, 'PHSYCOLOGY'),
(3, 'HISTORY'),
(4, 'POLITICAL SCIENCE'),
(5, 'ENGLISH'),
(6, 'PYHYSCIAL SCIENCE')
GO

INSERT INTO STUDENT (student_id,student_name,department_id,age ,gender,phone , address)
VALUES
(310,'Ameer Hamza',1,19,'Male','03207174918','Lahore'),
(328,'Safdar Ali',1,20,'Male','03287204918','Haveli Lakha'),
(326,'Qamar Munir',1,18,'Male','03338161674','Sialkot'),
(676,'Khansa',2,18,'Female','03444647859','Lahore'),
(678,'Mateen Ahmed',2,21,'Male','03321495546','Islamabad'),
(410,'Ali Raza',3,21,'Male','03113636489','Hafizabad'),
(414,'Afiafa',3,23,'Female','03487865120','Islamabad'),
(426,'Bilal Ahmed',3,24,'Male','03321491834','Karachi'),
(514,'Safdar Ijaz',4,19,'Male','031131827449','Lahore'),
(578,'Afiafa',4,23,'Female','03487865120','Islamabad'),
(596,'Bilal Ahmed',5,24,'Male','03321491834','Karachi'),
(777,'Noor',5,20,'Female','03115478457','Guujranwala'),
(776,'Munir Ahmed',5,25,'Male','03816475224','Rawalapindi'),
(769,'Abdul Ali',5,24,'Male','03321491834','Karachi'),
(810,'Ali Ashraf',5,22,'Male','03321491834','Islamabad'),
(888,'Asma Kanwal',6,24,'Female','03212121495','Nankana Sahab'),
(826,'Naveed Ahmed',6,19,'Male','03114934854','Okara');
GO

INSERT INTO COURSE (course_code,course_name)
VALUES
(111,'C++'),
(112,'OOP'),
(113,'Applied Physics'),
(114,'Maths'),
(115,'Database System'),
(116,'Data Structure'),
(117,'Communicaition Skills'),
(221,'English'),
(222,'Sexiology'),
(223,'Experimental Psychology'),
(224,'Statistics'),
(331,'Introduction to History'),
(332,'Computer Skills'),
(333,'Environment of Pakistan'),
(441,'Pakistan Studies'),
(442,'Understanding Political Theory'),
(443,'Comparative Politics'),
(444,'Political Theory'),
(511,'Creative Writing'),
(522,'Poetry'),
(533,'Jouranlism'),
(544,'Linguistics'),
(661,'Astronomy'),
(662,'Earth Sciences'),
(663,'Geology')
GO

INSERT INTO STUDENT_COURSE (course_code,student_id)
VALUES
(111,310),
(112,310),
(113,310),
(114,310),
(115,310),
(116,310),
(113,328),
(114,328),
(115,328),
(116,328),
(117,328),
(113,328),
(114,326),
(115,326),
(116,326),
(117,326),
(221,676),
(222,676),
(223,678),
(221,678),
(222,678),
(332,410),
(333,410),
(331,426),
(332,426),
(333,426),
(441,514),
(442,514),
(443,514),
(444,514),
(441,578),
(444,578),
(441,596),
(442,596),
(443,596),
(511,776),
(522,776),
(533,776),
(544,776),
(114,776),
(533,769),
(544,769),
(114,769),
(511,777),
(522,777),
(533,777),
(661,810),
(662,810),
(661,888),
(662,888),
(663,888),
(661,826),
(662,826),
(663,826)
GO

INSERT INTO FACULTY(faculty_id,name,department_id,age,gender,address,phone,salary,
designation)
VALUES
(1,'Asad Raza',1,50,'Male','Lahore','095115155511',150000,'Head of Department'),
(2,'Hafeez Ahmed',1,25,'Male','Ali Pur Chattha','03354565951',250000,'Chaiperson'),
(3,'Yahya Khuram',1,35,'Male','Sialkot','01535154851',25000,'Lecturer'),
(4,'Muhammad Sufyan',2,40,'Male','hafizabad','04681648521',50000,'Assitant Professor'),
(5,'Ashraf Nazir',2,26,'Male','Jhang','031515151515',15000,'Lecturer'),
(6,'Ali Raza Kazmi',3,29,'Male','Sarghoda','0331515151',60000,'Lecturer'),
(7,'Asad Ullah',3,31,'Male','Gujranwala','03818181212',152000,'Head of Department'),
(8,'Illyas Fakhir',3,32,'Male','Swat','0920136541',180000,'Assitant Professor'),
(9,'Amina Tahir',1,45,'female','Sibi','03354565951',157000,'Assitant Professor'),
(10,'Asma Kanwal',2,35,'female','Gujrat','032362518',122200,'Assitant Professor'),
(11,'Sehrish Iftikhar',3,35,'female','Multan','031919191919',25000,'Lecturer'),
(12,'Fariha Naqvi',4,34,'female','Gujranwala','0358142536',125000,'Head of Department'),
(13,'Saeed ur Rehman',4,25,'Male','Karachi','0348618521',195550,'Assistant Professor'),
(14,'Aleem Khan',4,26,'Male','Checha Watni','0315486294',17000,'Lecturer'),
(15,'Ijaz Bukhari',4,28,'Male','Havelian','03354565951',170000,'Lecturer'),
(16,'Imtiaz Yousaf',5,22,'Male','Islamabad','03358888951',19000,'Lecturer'),
(17,'Ameer Hamza',5,23,'Male','Multan','03565951333',15000,'Lecturer'),
(18,'Shahid Majeed',5,23,'Male','Hafizabad','03369695951',157700,'Head of Department'),
(19,'Aleem Dar',5,22,'Male','Jhang','03356484751',35000,'Assitant Professor'),
(20,'Muhammad Idress',5,40,'Rawalpindi','Lahore','03378963221',50000,'Assitant Professor'),
(21,'Umair Aslam',6,21,'Male','Sialkot','033511111111',70000,'Head of Department'),
(22,'Usman Hanif',6,23,'Male','Gujranwala','03020202020',800000,'Assistant Professor'),
(23,'Muhammad Ishtiyaq',6,29,'Male','Swat','0339147896',90000,'Assitant Professor')
GO

INSERT INTO FACULTY_COURSE(course_code,faculty_id)
VALUES
(111,2),
(112,2),
(113,1),
(114,3),
(115,2),
(116,3),
(117,1),
(221,4),
(222,4),
(223,5),
(224,10),
(331,6),
(332,7),
(333,8),
(441,12),
(442,13),
(443,14),
(444,15),
(511,16),
(522,17),
(533,18),
(544,19),
(661,21),
(662,22),
(663,23)
GO

INSERT INTO RESEARCH_PROJECT(project_id ,project_name ,duration )
VALUES
(1,'Artificial Intelligence', '2021-24'),
(2,'Cyber Security', '2020-22'),
(3,'Rural Banking', '2021-23'),
(4,'Social cognition', '2021-23'),
(5,'Person perception.', '2021-23'),
(6,'Attitudes', '2021-23'),
(7,'Cultures of Knowledge', '2021-23'),
(8,'Everyday Life and Fatal', '2021-23'),
(9,'Soviet Union Ideology', '2021-23'),
(10,'Climate Change', '2021-23'),
(11,'Global Warming', '2021-23'),
(12,'Hydro Power', '2021-23')
GO


INSERT INTO FACULTY_PROJECT(faculty_id,project_id)
VALUES
(1,1),
(2,1),
(3,2),
(4,4),
(5,5),
(6,7),
(7,7),
(8,8),
(9,3),
(10,6),
(11,8),
(12,9),
(13,9),
(15,9),
(16,10),
(17,11),
(18,10),
(19,11),
(21,12),
(23,12)
GO
