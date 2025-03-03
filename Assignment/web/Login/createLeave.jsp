<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tạo Đơn Nghỉ Phép</title>
    </head>
    <body>
        <c:if test="${sessionScope.userId == null}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <h1>Tạo Đơn Nghỉ Phép</h1>
        <form method="POST" action="${pageContext.request.contextPath}/CreateLeaveServlet">
            <label>Ngày bắt đầu:</label><br>
            <input type="date" name="start_date" required/><br>
            <label>Ngày kết thúc:</label><br>
            <input type="date" name="end_date" required/><br>
            <label>Lý do:</label><br>
            <textarea name="reason"></textarea><br>
            <input type="submit" value="Gửi đơn"/>
        </form>
        <br>
        <a href="${pageContext.request.contextPath}/leaveManagement.jsp">Quay lại</a>
    </body>
</html>