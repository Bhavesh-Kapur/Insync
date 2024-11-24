package in.upes.projectmanagement.Faculty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// Servlet annotation for URL mapping
@WebServlet("/fetchPanelInvite")
public class fetchPanelInvite extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<PanelRequest> panelRequests = new ArrayList<>();

        try {
            // Initialize database connection
            Connection conn = databaseConnection.initializeDatabase();

            // Get profId from session
            HttpSession session = request.getSession();
            int profId = (int) session.getAttribute("profid");

            System.out.println(profId);

            // SQL query to fetch invites
            String sql = "SELECT pi.invite_id, f.name AS sender_name " +
                         "FROM panel_invites pi " +
                         "JOIN faculty f ON pi.sent_by = f.profid " +
                         "WHERE pi.profid = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, profId);
            ResultSet rs = ps.executeQuery();

            // Populate panelRequests list
            while (rs.next()) {
                int inviteId = rs.getInt("invite_id");
                String senderName = rs.getString("sender_name");
                panelRequests.add(new PanelRequest(inviteId, senderName));
                System.out.println(panelRequests);
                System.out.println(senderName);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set the invites in the request scope
        request.setAttribute("panelInvites", panelRequests);

        // Forward back to the JSP page
        request.getRequestDispatcher("facDashboard.jsp").forward(request, response);
    }
}