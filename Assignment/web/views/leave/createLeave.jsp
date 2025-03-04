<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tạo Đơn Nghỉ Phép</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            .error {
                color: red;
            }
            form {
                max-width: 400px;
                margin: 20px 0;
            }
            label, input, textarea {
                display: block;
                margin: 5px 0;
            }
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.userId == null}">
            <c:redirect url="../auth/Login.jsp"/>
        </c:if>
        <h1>Tạo Đơn Nghỉ Phép</h1>
        <c:if test="${param.error != null}">
            <p class="error">Đã xảy ra lỗi khi gửi đơn, vui lòng kiểm tra lại!</p>
        </c:if>
        <form method="POST" action="${pageContext.request.contextPath}/CreateLeaveServlet">
            <label for="start_date">Ngày bắt đầu:</label>
            <input type="date" id="start_date" name="start_date" required/><br>
            <label for="end_date">Ngày kết thúc:</label>
            <input type="date" id="end_date" name="end_date" required/><br>
            <label for="reason">Lý do:</label>
            <textarea id="reason" name="reason" rows="4" cols="50"></textarea><br>
            <input type="submit" value="Gửi đơn"/>
        </form>
        <br>
<a href="${pageContext.request.contextPath}/views/leave/leaveManagement.jsp">Quay lại</a>    </body>
</html>
