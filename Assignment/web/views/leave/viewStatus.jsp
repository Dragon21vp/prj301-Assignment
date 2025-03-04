<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.*, jakarta.servlet.*, jakarta.servlet.http.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xem Trạng Thái Đơn</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            table {
                border-collapse: collapse;
                width: 100%;
            }
            th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: left;
            }
            .error {
                color: red;
            }
            a, button {
                text-decoration: none;
                margin: 5px;
            }
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.userId == null}">
            <c:redirect url="../auth/Login.jsp"/>
        </c:if>
        <h1>Xem Trạng Thái Đơn</h1>
        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>
        <table>
            <tr>
                <th>ID</th>
                <th>Ngày bắt đầu</th>
                <th>Ngày kết thúc</th>
                <th>Lý do</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
            </tr>
            <%
                Integer userId = (Integer) session.getAttribute("userId");
                String role = (String) session.getAttribute("role");
                if (userId == null) {
                    response.sendRedirect("../auth/Login.jsp");
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
                        out.println("<tr>");
                        out.println("<td>" + rs.getInt("request_id") + "</td>");
                        out.println("<td>" + rs.getDate("start_date") + "</td>");
                        out.println("<td>" + rs.getDate("end_date") + "</td>");
                        out.println("<td>" + (rs.getString("reason") != null ? rs.getString("reason") : "") + "</td>");
                        out.println("<td>" + rs.getString("status") + "</td>");
                        out.println("<td>");
                        if ("Manager".equals(role) || "Administrator".equals(role)) {
                            out.println("<form method='POST' action='${pageContext.request.contextPath}/ApproveLeaveServlet'>");
                            out.println("<input type='hidden' name='request_id' value='" + rs.getInt("request_id") + "'/>");
                            out.println("<input type='submit' name='action' value='Approve' style='margin-right: 5px;'/>");
                            out.println("<input type='submit' name='action' value='Reject'/>");
                            out.println("</form>");
                        }
                        out.println("</td>");
                        out.println("</tr>");
                    }
                    conn.close();
                } catch (Exception e) {
                    request.setAttribute("error", "Đã xảy ra lỗi khi xem trạng thái: " + e.getMessage());
                }
            %>
        </table>
        <br>
        <a href="${pageContext.request.contextPath}/views/leave/leaveManagement.jsp">Quay lại</a>    </body>
</html>
