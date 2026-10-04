package controller;

import dao.TicketDAO;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class DashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        try {
            TicketDAO dao = new TicketDAO();
            request.setAttribute("openCount", dao.countByStatus("OPEN"));
            request.setAttribute("progressCount", dao.countByStatus("IN PROGRESS"));
            request.setAttribute("closedCount", dao.countByStatus("CLOSED"));

            User user = (User) session.getAttribute("user");
            if ("ADMIN".equals(user.getRole()))
                request.setAttribute("tickets", dao.getAllTickets());
            else
                request.setAttribute("tickets", dao.getTicketsByEmail(user.getUsername().equals("student") ? "student@example.com" : ""));

            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
