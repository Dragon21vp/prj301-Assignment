package leave;

import db.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

public class CreateLeaveServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
           
            response.sendRedirect(request.getContextPath() + "/views/auth/Login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");
        String fromDate = request.getParameter("fromDate"); 
        String toDate = request.getParameter("toDate");
        String reason = request.getParameter("reason");

        String sql = "INSERT INTO LeaveRequests (username, fromDate, toDate, reason, status) "
                   + "VALUES (?, ?, ?, ?, 'Inprogress')";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setDate(2, Date.valueOf(fromDate));
            ps.setDate(3, Date.valueOf(toDate));
            ps.setString(4, reason);

            ps.executeUpdate();
            request.setAttribute("message", "Tạo đơn nghỉ phép thành công!");
            request.getRequestDispatcher("/views/leave/createLeave.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi khi tạo đơn: " + e.getMessage());
            request.getRequestDispatcher("/views/leave/createLeave.jsp").forward(request, response);
        }
    }
}
