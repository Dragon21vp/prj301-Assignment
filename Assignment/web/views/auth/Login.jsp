<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Đăng nhập</h2>
    <form action="<%= request.getContextPath() %>/login" method="post">
        <label>Username:</label>
        <input type="text" name="username" required><br>
        <label>Password:</label>
        <input type="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>

    <p style="color:red;">
        <%= request.getAttribute("errorMessage") != null 
                ? request.getAttribute("errorMessage") 
        : "" %>
    </p>
</body>
</html>
