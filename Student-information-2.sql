-- create tables

create table users (
    id               number default on null to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') 
                     constraint users_id_pk primary key,
    user_id          number,
    username         varchar2(4000 char) not null,
    password_hash    varchar2(4000 char) not null,
    role             varchar2(4000 char) not null
);



create table advisors (
    id              number default on null to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') 
                    constraint advisors_id_pk primary key,
    advisor_id      number,
    advisor_name    varchar2(255 char) not null,
    email           varchar2(255 char)
);



create table students (
    id              number default on null to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') 
                    constraint students_id_pk primary key,
    student_id      number,
    user_id         number not null,
    student_name    varchar2(255 char) not null,
    email           varchar2(255 char) not null,
    phone           varchar2(4000 char),
    gender          varchar2(4000 char),
    dob             date,
    department      varchar2(4000 char),
    advisor_id      number,
    created_at      date
);



create table courses (
    id              number default on null to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') 
                    constraint courses_id_pk primary key,
    course_id       number,
    course_code     varchar2(4000 char) not null,
    course_name     varchar2(255 char) not null,
    credit_hours    number(2)
);



create table enrollments (
    id                                            number default on null to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') 
                                                  constraint enrollments_id_pk primary key,
    enrollment_id                                 number,
    student_id                                    number not null,
    course_id                                     number not null,
    semester                                      varchar2(4000 char) not null,
    status                                        varchar2(4000 char),
    enrolled_at                                   date,
    "unique (student_id, course_id, semester)"    varchar2(4000 char)
);



create table "insert into users (username, password_hash, role) values ('admin1', 'admin123', 'ADMIN')" (
    id    number default on null to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') 
          constraint "insert into users (username, password_hash, role) values ('admin1', 'admin123', 'ADMIN')_id_pk" primary key
);



create table "insert into users (username, password_hash, role) values ('student1', 'stud123', 'STUDENT')" (
    id    number default on null to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') 
          constraint "insert into users (username, password_hash, role) values ('student1', 'stud123', 'STUDENT')_id_pk" primary key
);



create table "insert into advisors (advisor_name, email) values ('Dr. Rahman', 'rahman@univ.edu')" (
    id    number default on null to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') 
          constraint "insert into advisors (advisor_name, email) values ('Dr. Rahman', 'rahman@univ.edu')_id_pk" primary key
);



create table "insert into students (user_id, student_name, email, phone, gender, dob, department, advisor_id)" (
    id    number default on null to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') 
          constraint "insert into students (user_id, student_name, email, phone, gender, dob, department, advisor_id)_id_pk" primary key
);



create table "values (2, 'John Doe', 'john.doe@univ.edu', '01700000001', 'Male'," (
    id    number default on null to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') 
          constraint "values (2, 'John Doe', 'john.doe@univ.edu', '01700000001', 'Male',_id_pk" primary key
);



create table "insert into courses (course_code, course_name, credit_hours) values ('CSE101', 'Introduction to Programming', 3)" (
    id    number default on null to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') 
          constraint "insert into courses (course_code, course_name, credit_hours) values ('CSE101', 'Introduction to Programming', 3)_id_pk" primary key
);



create table "insert into courses (course_code, course_name, credit_hours) values ('CSE201', 'Database Systems', 3)" (
    id    number default on null to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') 
          constraint "insert into courses (course_code, course_name, credit_hours) values ('CSE201', 'Database Systems', 3)_id_pk" primary key
);



create table "insert into enrollments (student_id, course_id, semester, status) values (1, 1, 'Fall-2025', 'ENROLLED')" (
    id    number default on null to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') 
          constraint "insert into enrollments (student_id, course_id, semester, status) values (1, 1, 'Fall-2025', 'ENROLLED')_id_pk" primary key
);



create table "insert into enrollments (student_id, course_id, semester, status) values (1, 2, 'Fall-2025', 'ENROLLED')" (
    id    number default on null to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') 
          constraint "insert into enrollments (student_id, course_id, semester, status) values (1, 2, 'Fall-2025', 'ENROLLED')_id_pk" primary key
);



-- Generated by Quick SQL 1.2.9 8/23/2025, 11:28:02 AM

/*
-- USERS table for both Admin and Student login
users
  user_id number generated primary key
  username varchar2(50) unique not null
  password_hash varchar2(200) not null
  role varchar2(20) not null check ('ADMIN','STUDENT')

-- ADVISORS
advisors
  advisor_id number generated primary key
  advisor_name varchar2(100) not null
  email varchar2(150) unique

-- STUDENTS
students
  student_id number generated primary key
  user_id number not null fk users.user_id on delete cascade
  student_name varchar2(100) not null
  email varchar2(150) unique not null
  phone varchar2(20)
  gender varchar2(10) check ('Male','Female','Other')
  dob date
  department varchar2(100)
  advisor_id number fk advisors.advisor_id
  created_at date default sysdate

-- COURSES
courses
  course_id number generated primary key
  course_code varchar2(20) unique not null
  course_name varchar2(150) not null
  credit_hours number(2) default 3

-- ENROLLMENTS
enrollments
  enrollment_id number generated primary key
  student_id number not null fk students.student_id on delete cascade
  course_id number not null fk courses.course_id on delete cascade
  semester varchar2(20) not null
  status varchar2(20) default 'ENROLLED' check ('ENROLLED','DROPPED')
  enrolled_at date default sysdate
  unique (student_id, course_id, semester)

-- SAMPLE DATA
insert into users (username, password_hash, role) values ('admin1', 'admin123', 'ADMIN')
insert into users (username, password_hash, role) values ('student1', 'stud123', 'STUDENT')
insert into advisors (advisor_name, email) values ('Dr. Rahman', 'rahman@univ.edu')
insert into students (user_id, student_name, email, phone, gender, dob, department, advisor_id) 
values (2, 'John Doe', 'john.doe@univ.edu', '01700000001', 'Male', date '2000-05-10', 'CSE', 1)
insert into courses (course_code, course_name, credit_hours) values ('CSE101', 'Introduction to Programming', 3)
insert into courses (course_code, course_name, credit_hours) values ('CSE201', 'Database Systems', 3)
insert into enrollments (student_id, course_id, semester, status) values (1, 1, 'Fall-2025', 'ENROLLED')
insert into enrollments (student_id, course_id, semester, status) values (1, 2, 'Fall-2025', 'ENROLLED')

 Non-default options:
# settings = {}

*/