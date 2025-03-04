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
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author asus
 */
public class ViewLeaveServlet extends HttpServlet{ 
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect(request.getContextPath() + "/views/auth/Login.jsp");
            return;
        }
        String username = (String) session.getAttribute("username");
        String role = (String) session.getAttribute("role");

        String sql;
        if ("Manager".equalsIgnoreCase(role)) {
            
            sql = "SELECT * FROM LeaveRequests";
        } else {
           
            sql = "SELECT * FROM LeaveRequests WHERE username = ?";
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (!"Manager".equalsIgnoreCase(role)) {
                ps.setString(1, username);
            }

            ResultSet rs = ps.executeQuery();
            request.setAttribute("leaveList", rs); 
            
            request.getRequestDispatcher("/views/leave/viewStatus.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi: " + e.getMessage());
            request.getRequestDispatcher("/views/leave/viewStatus.jsp").forward(request, response);
        }
    }
    
}
