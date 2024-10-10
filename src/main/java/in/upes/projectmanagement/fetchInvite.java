package in.upes.projectmanagement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class fetchInvite extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer inviteeSapid = (Integer) session.getAttribute("sapid");

        if (inviteeSapid != null) {
            int sapid = inviteeSapid; // No need to parse, sapid is already an int
    
            Connection connection = null;
            try {
                Connection con = databaseConnection.initializeDatabase();
    
                String query = "SELECT invitedBy FROM invites WHERE sapid = ? AND inviteStatus = 'Pending'";
                PreparedStatement stmt = con.prepareStatement(query);
                stmt.setInt(1, sapid); // Use the integer value directly
                ResultSet rs = stmt.executeQuery();
    
                List<String> pendingInvitations = new ArrayList<>();
                while (rs.next()) {
                    pendingInvitations.add(rs.getString("invitedBy"));
                }
    
                request.setAttribute("pendingInvitations", pendingInvitations);
                request.getRequestDispatcher("received.jsp").forward(request, response);
    
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
        } else {
            // Handle case where sapid is not in session
            response.sendRedirect("index.jsp"); // Redirect to login if sapid is not available
        }
    }
}