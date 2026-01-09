CREATE Database studyspace_db;

-- admins table

CREATE TABLE admins (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- students table

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- resources table (Admin only)

CREATE TABLE resources (
    resource_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    uploaded_by_admin INT,
    FOREIGN KEY (uploaded_by_admin) REFERENCES admins(admin_id)
        ON DELETE SET NULL
);

-- student_uploads table

CREATE TABLE student_uploads (
    upload_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
        ON DELETE CASCADE
);

-- Insert Admin (Developer) Account

INSERT INTO admins (name, email, password)
VALUES ('Admin', 'admin@studyspace.com', 'admin123');


-- Test Student Registration (Sample Data)

INSERT INTO students (name, email, password)
VALUES ('Test Student', 'student1@test.com', 'student123');

-- Admin Resource Upload (Public)

INSERT INTO resources (title, subject, file_path, uploaded_by_admin)
VALUES (
  'Pandas Library Notes',
  'Data Visualization',
  'uploads/unit_1_pandas_lib.docx',
  1
),
(
  'Introduction to Machine Learning',
  'Software Project Management',
  'uploads/an-introduction-to-machine-learning.pdf',
  1
),
(
  'Unit 1 Data Science',
  'Software Project Management',
  'uploads/Unit_1_Data_Science.pptx',
  1
);


-- Student Private Upload

INSERT INTO student_uploads (student_id, title, subject, file_path)
VALUES (
  1,
  'My Pandas Notes',
  'Data Visualization',
  'uploads/unit_1_pandas_lib.docx'
);
