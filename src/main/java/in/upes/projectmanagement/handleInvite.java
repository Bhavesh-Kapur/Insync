// this file will hold the code for accepting the invite as well as decling the invite 

package in.upes.projectmanagement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class handleInvite extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String invitedBy = request.getParameter("invitedBy");
        String action = request.getParameter("action"); 

        Connection connection = null;
        try {

            Connection con = databaseConnection.initializeDatabase();
            String query;
            if ("Accept".equals(action)) {
                query = "UPDATE invites SET inviteStatus = 'Accepted' WHERE invitedBy = ? AND inviteStatus = 'Pending'";
            } else {
                query = "UPDATE invites SET inviteStatus = 'Rejected' WHERE invitedBy = ? AND inviteStatus = 'Pending'";
            }

            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, invitedBy);
            stmt.executeUpdate();

            response.sendRedirect("fetchInvite");

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