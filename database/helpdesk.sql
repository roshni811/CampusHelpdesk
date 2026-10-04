CREATE DATABASE IF NOT EXISTS helpdesk;
USE helpdesk;

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'STUDENT'
);

CREATE TABLE IF NOT EXISTS tickets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    subject VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(50) NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'OPEN',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT IGNORE INTO users (username, password, role)
VALUES ('admin', 'admin123', 'ADMIN');

INSERT IGNORE INTO users (username, password, role)
VALUES ('student', 'student123', 'STUDENT');

INSERT INTO tickets (student_name, email, subject, description, category, status)
SELECT 'Demo Student', 'student@example.com', 'Cannot access Wi-Fi',
       'Campus Wi-Fi is not connecting on my laptop.', 'NETWORK', 'OPEN'
WHERE NOT EXISTS (
    SELECT 1 FROM tickets WHERE subject = 'Cannot access Wi-Fi'
);
