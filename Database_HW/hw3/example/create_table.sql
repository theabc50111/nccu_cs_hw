CREATE TABLE student(
	student_id character varying PRIMARY KEY,
	student_name character varying NOT NULL,
	gender character varying NOT NULL,
	birthday date NOT NULL,
	fruit character varying NOT NULL
);

CREATE TABLE course(
	course_id character varying PRIMARY KEY,
	course_name character varying NOT NULL,
	credit INT NOT NULL
);

CREATE TABLE grade(
	student_id character varying REFERENCES student(student_id),
	course_id character varying REFERENCES course(course_id),
	score INT NOT NULL
);