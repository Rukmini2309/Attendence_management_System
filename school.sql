-- Create the database
CREATE DATABASE school_db;
USE school_db;

-- Create Users Table (for login authentication)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role ENUM('teacher', 'student') NOT NULL
);

-- Insert Sample Users (Teacher and Student)
INSERT INTO users (username, password, role) VALUES 
('teacher1', 'pass123', 'teacher'),
('student1', 'pass123', 'student');

-- Create Students Table
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Insert Sample Students
INSERT INTO students (name) VALUES 
('Alice Johnson'),
('Bob Smith'),
('Charlie Brown');

-- Create Attendance Table
CREATE TABLE attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    date DATE NOT NULL,
    status ENUM('Present', 'Absent') NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(id)
);

-- Insert Sample Attendance Data
INSERT INTO attendance (student_id, date, status) VALUES 
(1, '2025-03-22', 'Present'),
(2, '2025-03-22', 'Absent'),
(3, '2025-03-22', 'Present');
