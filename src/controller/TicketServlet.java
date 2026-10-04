package controller;

import dao.TicketDAO;
import model.Ticket;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class TicketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = session == null ? null : (User) session.getAttribute("user");
        if (user == null) { response.sendRedirect("login.jsp"); return; }

        String action = request.getParameter("action");
        try {
            TicketDAO dao = new TicketDAO();

            if ("create".equals(action)) {
                String name = request.getParameter("studentName");
                String email = request.getParameter("email");
                String subject = request.getParameter("subject");
                String description = request.getParameter("description");
                String category = request.getParameter("category");

                if (name == null || name.isBlank() || email == null || !email.contains("@")
                        || subject == null || subject.isBlank() || description == null || description.isBlank()) {
                    request.setAttribute("error", "Please complete all fields correctly.");
                    request.getRequestDispatcher("ticket-form.jsp").forward(request, response);
                    return;
                }

                Ticket t = new Ticket();
                t.setStudentName(name); t.setEmail(email); t.setSubject(subject);
                t.setDescription(description); t.setCategory(category);
                dao.addTicket(t);
                response.sendRedirect("dashboard");
            } else if ("status".equals(action) && "ADMIN".equals(user.getRole())) {
                dao.updateStatus(Integer.parseInt(request.getParameter("id")),
                        request.getParameter("status"));
                response.sendRedirect("dashboard");
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
