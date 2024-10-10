package in.upes.projectmanagement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class fetchInvite extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String inviteeSapid = (String) session.getAttribute("sapid"); 
        int sapid = Integer.parseInt(inviteeSapid);

        Connection connection = null;
        try {
            Connection con = databaseConnection.initializeDatabase();

            String query = "SELECT invitedBy FROM invites WHERE sapid = ? AND status = 'Pending'";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, sapid);
            ResultSet rs = stmt.executeQuery();

            List<String> pendingInvitations = new ArrayList<>();
            while (rs.next()) {
                pendingInvitations.add(rs.getString("inviter_name"));
            }

            // request.setAttribute("pendingInvitations", pendingInvitations);
            // request.getRequestDispatcher("invitePage.jsp").forward(request, response);

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