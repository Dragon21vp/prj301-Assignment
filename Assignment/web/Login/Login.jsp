<%-- 
    Document   : Login
    Created on : Mar 3, 2025, 3:12:38 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
        <title>Company X - Login</title>
    </head>
    <body>
       <h1>Company X</h1>
    <h2>Log in</h2>
    <% if (request.getParameter("error") != null) { %>
        <p style="color:red">Tên đăng nhập hoặc mật khẩu không đúng!</p>
    <% } %>
    <form method="POST" action="LoginServlet">
        <label>Username:</label><br>
        <input type="text" name="username" required/><br>
        <label>Password:</label><br>
        <input type="password" name="password" required/><br>
        <input type="submit" value="Log in"/>
    </form>
    </body>
</html>
