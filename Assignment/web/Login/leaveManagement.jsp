<%-- 
    Document   : leaveManagement
    Created on : Mar 3, 2025, 3:17:32 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý Nghỉ Phép</title>
    </head>
    <body>
        <h1>Quản lý Nghỉ Phép</h1>
        <h2>Mục 1: Tạo và gửi đơn</h2>
        <a href="${pageContext.request.contextPath}/createLeave.jsp">Tạo Đơn Nghỉ Phép</a>
        <h2>Mục 2: Xem trạng thái đơn</h2>
        <a href="${pageContext.request.contextPath}/viewStatus.jsp">Xem Trạng Thái Đơn</a>
        <br><br>
        <a href="${pageContext.request.contextPath}/login.jsp">Đăng xuất</a>
    </body>
</html>