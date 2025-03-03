<%-- 
    Document   : viewStatus
    Created on : Mar 3, 2025, 3:19:09 PM
    Author     : asus
--%>

<%@page import="java.sql.*, jakarta.servlet.*, jakarta.servlet.http.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Xem Trạng Thái Đơn</title>
    </head>
    <body>
      <h1>Xem Trạng Thái Đơn</h1>
    <table border="1">
        <tr><th>ID</th><th>Ngày bắt đầu</th><th>Ngày kết thúc</th><th>Lý do</th><th>Trạng thái</th></tr>
        <%
            Integer userId = (Integer) session.getAttribute("userId");
            if (userId == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            try {
                InitialContext ctx = new InitialContext();
                DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/LeaveManagementDB");
                Connection conn = ds.getConnection();
                String sql = "SELECT * FROM leave_requests WHERE user_id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    out.println("<tr><td>" + rs.getInt("request_id") + "</td>" +
                                "<td>" + rs.getDate("start_date") + "</td>" +
                                "<td>" + rs.getDate("end_date") + "</td>" +
                                "<td>" + rs.getString("reason") + "</td>" +
                                "<td>" + rs.getString("status") + "</td></tr>");
                }
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
    <br>
    <a href="leaveManagement.jsp">Quay lại</a>
    </body>
</html>
