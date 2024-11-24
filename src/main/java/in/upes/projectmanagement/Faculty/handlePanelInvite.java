package in.upes.projectmanagement.Faculty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/HandleInviteServlet")
public class handlePanelInvite extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement psUpdateFaculty = null;
        PreparedStatement psUpdateInvite = null;

        try {
                HttpSession session = request.getSession();
            int profid = (int)session.getAttribute("profid");
            conn = databaseConnection.initializeDatabase();
            int inviteId = Integer.parseInt(request.getParameter("inviteId"));
            String action = request.getParameter("action");
            System.out.println(inviteId);

            if ("accept".equalsIgnoreCase(action)) {
                // Update faculty table to set panel_member = 1
                String updateFacultyQuery = "UPDATE faculty SET panel = 1 WHERE profid = ?";
                psUpdateFaculty = conn.prepareStatement(updateFacultyQuery);
                psUpdateFaculty.setInt(1, profid);
                psUpdateFaculty.executeUpdate();
            }

            // Update invite status
            String updateInviteQuery = "UPDATE panel_invites SET status = ? WHERE profid = ? AND status = 'pending' AND invite_id = ?";
            psUpdateInvite = conn.prepareStatement(updateInviteQuery);
            psUpdateInvite.setString(1, action); // 'accepted' or 'rejected'
            psUpdateInvite.setInt(2, profid);
            psUpdateInvite.setInt(3, inviteId);
            psUpdateInvite.executeUpdate();

            // Redirect with success message
            response.sendRedirect("facDashboard.jsp?message=Invite " + action + "ed successfully");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("facDashboard.jsp?error=Error handling invite");
        } finally {
            try {
                if (psUpdateFaculty != null) psUpdateFaculty.close();
                if (psUpdateInvite != null) psUpdateInvite.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}