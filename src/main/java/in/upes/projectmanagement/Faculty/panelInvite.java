package in.upes.projectmanagement.Faculty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class panelInvite extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // Get database connection
            conn = databaseConnection.initializeDatabase();
            HttpSession session = request.getSession();
            int currentId = (int) session.getAttribute("profid");
            int profId = Integer.parseInt(request.getParameter("profId"));

            // Insert invite record
            String insertInviteQuery = "INSERT INTO panel_invites (profid, sent_by) VALUES (?, ?)";
            ps = conn.prepareStatement(insertInviteQuery);
            ps.setInt(1, profId);
            ps.setInt(2, currentId);
            ps.executeUpdate();

            // Redirect back to professor list with success message
            response.sendRedirect("professorList.jsp?message=Invite sent successfully");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("professorList.jsp?error=Error sending invite");
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}