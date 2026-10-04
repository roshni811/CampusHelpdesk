package dao;

import model.Ticket;
import util.DBConnection;
import java.sql.*;
import java.util.*;

public class TicketDAO {

    public void addTicket(Ticket t) throws Exception {
        String sql = "INSERT INTO tickets(student_name,email,subject,description,category) VALUES(?,?,?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, t.getStudentName());
            ps.setString(2, t.getEmail());
            ps.setString(3, t.getSubject());
            ps.setString(4, t.getDescription());
            ps.setString(5, t.getCategory());
            ps.executeUpdate();
        }
    }

    public List<Ticket> getAllTickets() throws Exception {
        List<Ticket> list = new ArrayList<>();
        String sql = "SELECT * FROM tickets ORDER BY created_at DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) list.add(map(rs));
        }
        return list;
    }

    public List<Ticket> getTicketsByEmail(String email) throws Exception {
        List<Ticket> list = new ArrayList<>();
        String sql = "SELECT * FROM tickets WHERE email=? ORDER BY created_at DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(map(rs));
        }
        return list;
    }

    public void updateStatus(int id, String status) throws Exception {
        String sql = "UPDATE tickets SET status=? WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        }
    }

    public int countByStatus(String status) throws Exception {
        String sql = "SELECT COUNT(*) FROM tickets WHERE status=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        }
    }

    private Ticket map(ResultSet rs) throws Exception {
        Ticket t = new Ticket();
        t.setId(rs.getInt("id"));
        t.setStudentName(rs.getString("student_name"));
        t.setEmail(rs.getString("email"));
        t.setSubject(rs.getString("subject"));
        t.setDescription(rs.getString("description"));
        t.setCategory(rs.getString("category"));
        t.setStatus(rs.getString("status"));
        t.setCreatedAt(rs.getTimestamp("created_at"));
        return t;
    }
}
