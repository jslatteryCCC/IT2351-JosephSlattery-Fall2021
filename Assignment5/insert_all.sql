INSERT INTO course_list VALUES
(1, "IT1025-Intro to Computing"),
(2, "IT1050-Intro to Programming"),
(3, "IT2351-Enterprise Database Management"),
(4, "MATH1200-Contemporary Mathematics"),
(5, "ENG101H-Honors English Composition"),
(6, "KAR3660-Practical Karate"),
(7, "CUL1010-Intro to Culinary Arts");

INSERT INTO majors (major_name)
VALUES 
("IT Programming"),
("IT Networking"),
("English"),
("Applied Karate"),
("Culinary Arts");

INSERT INTO student_info (student_first_name, student_last_name, student_address, student_email, major_id)
VALUES 
("Joe", "Smith", "124 Main St.", "joe@school.edu", 1),
("Sue", "Brown", "345 2nd St.", "sue@school.edu", 1),
("Nick", "Green", "45 York Rd.", "nick@school.edu", 2),
("Andy", "Andrews", "600 5th Ave.", "andy@school.edu", 2),
("Rocco", "Sangiacomo", "99 Problems Rd.", "rocco@school.edu", 3),
("Ralph", "Macchio", "123 Reseda St.", "ralph@school.edu", 4),
("Esmerelda", "Gutierrez", "419 57th St.", "esmerelda@school.edu", 5);

INSERT INTO enrollment VALUES
(1, 1, 1),
(1, 2, 1),
(1, 4, 2),
(2, 1, 1),
(2, 2, 1),
(2, 3, 2),
(3, 1, 1),
(4, 1, 1),
(4, 2, 1),
(5, 5, 1),
(6, 6, 2),
(7, 7, 1);
