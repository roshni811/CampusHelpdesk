package model;

import java.sql.Timestamp;

public class Ticket {
    private int id;
    private String studentName, email, subject, description, category, status;
    private Timestamp createdAt;

    public Ticket() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getStudentName() { return studentName; }
    public void setStudentName(String v) { studentName = v; }
    public String getEmail() { return email; }
    public void setEmail(String v) { email = v; }
    public String getSubject() { return subject; }
    public void setSubject(String v) { subject = v; }
    public String getDescription() { return description; }
    public void setDescription(String v) { description = v; }
    public String getCategory() { return category; }
    public void setCategory(String v) { category = v; }
    public String getStatus() { return status; }
    public void setStatus(String v) { status = v; }
    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp v) { createdAt = v; }
}
