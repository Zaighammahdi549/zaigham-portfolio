-- Create Student Database Schema
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    EnrollmentDate DATE,
    Email VARCHAR(100) UNIQUE
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade CHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Sample Data Insertion for Demonstration
INSERT INTO Students VALUES (1, 'Zaigham', 'Mehdi', '2026-09-01', 'zaigham@example.com');
INSERT INTO Courses VALUES (101, 'Data Structures & Algorithms', 4);
INSERT INTO Enrollments VALUES (1, 1, 101, 'A');

-- Analytical Queries for Interviews
-- 1. Fetch all student enrollment details
SELECT s.FirstName, s.LastName, c.CourseName, e.Grade
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;
