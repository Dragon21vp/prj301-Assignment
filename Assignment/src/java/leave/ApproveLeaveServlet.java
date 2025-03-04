/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package leave;
import db.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author asus
 */
public class ApproveLeaveServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"Manager".equals(session.getAttribute("role"))) {
            
            response.sendRedirect(request.getContextPath() + "/views/auth/Login.jsp");
            return;
        }

        String requestId = request.getParameter("requestId");
        String action = request.getParameter("action"); 
        String managerUsername = (String) session.getAttribute("username");

        String sql = "UPDATE LeaveRequests "
                   + "SET status = ?, processedBy = ?, processedDate = GETDATE() "
                   + "WHERE requestId = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if ("approve".equalsIgnoreCase(action)) {
                ps.setString(1, "Approved");
            } else {
                ps.setString(1, "Rejected");
            }
            ps.setString(2, managerUsername);
            ps.setInt(3, Integer.parseInt(requestId));

            ps.executeUpdate();
            response.sendRedirect(request.getContextPath() + "/view-leave");

        } catch (SQLException e) {
            e.printStackTrace();
           
            response.sendRedirect(request.getContextPath() + "/view-leave");
        }
    }
}
