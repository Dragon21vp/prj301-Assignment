import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.sql.DataSource;
import javax.naming.InitialContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CreateLeaveServlet")
public class CreateLeaveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            String startDate = request.getParameter("start_date");
            String endDate = request.getParameter("end_date");
            String reason = request.getParameter("reason");

            InitialContext ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/LeaveManagementDB");
            Connection conn = ds.getConnection();

            String sql = "INSERT INTO leave_requests (user_id, start_date, end_date, reason, status) VALUES (?, ?, ?, ?, 'Pending')";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setDate(2, java.sql.Date.valueOf(startDate));
            stmt.setDate(3, java.sql.Date.valueOf(endDate));
            stmt.setString(4, reason != null && !reason.trim().isEmpty() ? reason : null);

            stmt.executeUpdate();
            conn.close();

            response.sendRedirect("leaveManagement.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("createLeave.jsp?error=1");
        }
    }
}