<%-- 
    Document   : createLeave
    Created on : Mar 3, 2025, 3:18:32 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tạo Đơn Nghỉ Phép</title>
    </head>
    <body>
      <h1>Tạo Đơn Nghỉ Phép</h1>
    <form method="POST" action="CreateLeaveServlet">
        <label>Ngày bắt đầu:</label><br>
        <input type="date" name="start_date" required/><br>
        <label>Ngày kết thúc:</label><br>
        <input type="date" name="end_date" required/><br>
        <label>Lý do:</label><br>
        <textarea name="reason"></textarea><br>
        <input type="submit" value="Gửi đơn"/>
    </form>
    <br>
    <a href="leaveManagement.jsp">Quay lại</a>
    </body>
</html>
