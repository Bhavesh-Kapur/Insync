package in.upes.projectmanagement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AcceptInviteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String inviteeSapid = (String) session.getAttribute("sapid"); // logged in user 
        int sapid = Integer.parseInt(inviteeSapid);
        String inviterName = request.getParameter("inviter_name"); // Inviter

        Connection connection = null;
        try {
            Connection con = databaseConnection.initializeDatabase();

            String query = "UPDATE invites SET inviteStatus = 'Accepted' WHERE sapid = ? AND invitedBy = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, sapid);
            stmt.setString(2, inviterName);
            stmt.executeUpdate();
            response.sendRedirect("confirmation.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } finally {
            try {
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
