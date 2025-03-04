<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý Nghỉ Phép</title>
       <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            a {
                margin: 5px;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.userId == null}">
            <c:redirect url="../auth/Login.jsp"/>
        </c:if>
        <h1>Quản lý Nghỉ Phép</h1>
        <h2>Mục 1: Tạo và gửi đơn</h2>
<a href="${pageContext.request.contextPath}/views/leave/createLeave.jsp">Tạo Đơn Nghỉ Phép</a>
        <h2>Mục 2: Xem trạng thái đơn</h2>
<a href="${pageContext.request.contextPath}/views/leave/viewStatus.jsp">Xem Trạng Thái Đơn</a>

        <br><br>
<a href="${pageContext.request.contextPath}/views/auth/Login.jsp">Đăng xuất</a>
    </body>
</html>
