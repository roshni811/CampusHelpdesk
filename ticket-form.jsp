<%@ page contentType="text/html;charset=UTF-8" %>
<%
if (session.getAttribute("user") == null) { response.sendRedirect("login.jsp"); return; }
%>
<!DOCTYPE html>
<html><head><title>New Ticket</title><link rel="stylesheet" href="style.css"></head>
<body>
<nav><b>Campus Helpdesk</b><a href="dashboard">Dashboard</a><a href="logout">Logout</a></nav>
<div class="container"><div class="card">
<h2>Create Support Ticket</h2>
<% if (request.getAttribute("error") != null) { %><div class="error"><%=request.getAttribute("error")%></div><% } %>
<form action="tickets" method="post">
<input type="hidden" name="action" value="create">
<label>Student Name</label><input name="studentName" required>
<label>Email</label><input name="email" type="email" required>
<label>Subject</label><input name="subject" required>
<label>Category</label>
<select name="category"><option>NETWORK</option><option>SOFTWARE</option><option>ACCOUNT</option><option>OTHER</option></select>
<label>Description</label><textarea name="description" rows="5" required></textarea>
<button class="btn" type="submit">Submit Ticket</button>
</form>
</div></div>
</body></html>
