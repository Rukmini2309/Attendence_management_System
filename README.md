Attendance Management System
Overview
This is a Java-based Attendance Management System that allows teachers to mark and manage student attendance, and students to view their attendance records. The system consists of a server application and a client GUI application built with Swing.

Features
Teacher Portal:
View student list
Mark attendance (Present/Absent)
Update past attendance records
Add new students
View attendance summary by date

Student Portal:
View personal attendance records
Calculate attendance percentage

System Requirements
Java JDK 8 or later

MySQL Server
MySQL Connector/J (included in project dependencies)

Installation and Setup
1. Database Setup
Install MySQL Server if not already installed

Create a database named school_db,
Create the required tables using the following SQL:

sql

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
('Aalia singh'),
('Jack Sparrow'),
('Charlie Chaplin');

-- Create Attendance Table
CREATE TABLE attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
  
    date DATE NOT NULL,
    status ENUM('Present', 'Absent') NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(id)
   
);
SELECT student_id,name,date,status FROM attendance join students on attendance.student_id=students.id;

-- Insert Sample Attendance Data
INSERT INTO attendance (student_id, date, status) VALUES 
(1, '2025-03-22', 'Present'),
(2, '2025-03-22', 'Absent'),
(3, '2025-03-22', 'Present');

2. Server Setup
Update the database connection details in SServer.java:

java
Copy
connection = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/school_db", "root", "yourpassword");
Compile and run the server:

javac SServer.java
java SServer
3. Client Setup
Compile and run the client:

javac CClient.java
java CClient

Usage
Launch the client application
Select your role (Teacher or Student)
Login with credentials:
Teacher: username = "teacher1", password = "pass123"
Student: username = "student1", password = "pass123"
Use the respective portal features

GitHub Repository
Attendance-Management-System

Team Contributions
Team Member	Files/Components Worked On	Description
Rukmini	SServer.java	Server implementation with database connectivity
Ananya  	CClient.java	Client GUI implementation of login portal and teacher portal with Swing
Ayushi     CClient.java Client GUI implementation of role authentication and student portal with swing
Rukmini	Database Setup	MySQL database schema and sample data
	
Troubleshooting
If connection fails, ensure MySQL server is running
Verify database credentials in server code
Check that both server and client are using the same port (2400)
