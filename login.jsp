<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html><head><title>Login</title><link rel="stylesheet" href="style.css"></head>
<body>
<div class="hero"><div class="card small">
<h2>Campus Helpdesk</h2>
<p class="muted">Sign in to continue</p>
<% if (request.getAttribute("error") != null) { %>
<div class="error"><%= request.getAttribute("error") %></div>
<% } %>
<form action="login" method="post">
<label>Username</label><input name="username" required>
<label>Password</label><input name="password" type="password" required>
<button class="btn" type="submit">Login</button>
</form>
<div class="hint">Admin: admin / admin123<br>Student: student / student123</div>
</div></div>
</body></html>
