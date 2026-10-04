<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.User,model.Ticket,java.util.List" %>
<%
User u=(User)session.getAttribute("user");
if(u==null){response.sendRedirect("login.jsp");return;}
List<Ticket> tickets=(List<Ticket>)request.getAttribute("tickets");
%>
<!DOCTYPE html>
<html><head><title>Dashboard</title><link rel="stylesheet" href="style.css"></head>
<body>
<nav><b>Campus Helpdesk</b><span>Welcome, <%=u.getUsername()%> (<%=u.getRole()%>)</span><a href="logout">Logout</a></nav>
<div class="container">
<h1>Dashboard</h1>
<div class="stats">
<div class="stat"><b><%=request.getAttribute("openCount")%></b><span>Open</span></div>
<div class="stat"><b><%=request.getAttribute("progressCount")%></b><span>In Progress</span></div>
<div class="stat"><b><%=request.getAttribute("closedCount")%></b><span>Closed</span></div>
</div>
<% if("STUDENT".equals(u.getRole())) { %>
<a class="btn" href="ticket-form.jsp">+ Create Ticket</a>
<% } %>
<div class="card table-card">
<h2><%= "ADMIN".equals(u.getRole()) ? "All Support Tickets" : "My Tickets" %></h2>
<table>
<tr><th>ID</th><th>Subject</th><th>Category</th><th>Student</th><th>Status</th><th>Created</th><% if("ADMIN".equals(u.getRole())){%><th>Action</th><%}%></tr>
<% if(tickets != null) for(Ticket t:tickets){ %>
<tr>
<td><%=t.getId()%></td><td><%=t.getSubject()%></td><td><%=t.getCategory()%></td>
<td><%=t.getStudentName()%></td><td><span class="badge"><%=t.getStatus()%></span></td><td><%=t.getCreatedAt()%></td>
<% if("ADMIN".equals(u.getRole())){%>
<td>
<form action="tickets" method="post" class="inline">
<input type="hidden" name="action" value="status"><input type="hidden" name="id" value="<%=t.getId()%>">
<select name="status"><option>OPEN</option><option>IN PROGRESS</option><option>CLOSED</option></select>
<button type="submit">Update</button>
</form>
</td>
<%}%>
</tr>
<% } %>
</table>
</div>
</div>
</body></html>
