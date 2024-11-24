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

@WebServlet("/fetchPanelInvite")
public class fetchPanelInvite extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<PanelRequest> panelRequests = new ArrayList<>();
        List<PanelRequest> mentorRequests = new ArrayList<>();

        try {
            // Initialize database connection
            Connection conn = databaseConnection.initializeDatabase();

            // Get profId from session
            HttpSession session = request.getSession();
            int profId = (int) session.getAttribute("profid");

            System.out.println(profId);

            // Fetch pending panel invites
            String sqlPanelInvites = "SELECT pi.invite_id, f.name AS sender_name " +
                                     "FROM panel_invites pi " +
                                     "JOIN faculty f ON pi.sent_by = f.profid " +
                                     "WHERE pi.profid = ? AND pi.status = 'pending'";
            PreparedStatement psPanel = conn.prepareStatement(sqlPanelInvites);
            psPanel.setInt(1, profId);
            ResultSet rsPanel = psPanel.executeQuery();

            while (rsPanel.next()) {
                int inviteId = rsPanel.getInt("invite_id");
                String senderName = rsPanel.getString("sender_name");
                panelRequests.add(new PanelRequest(inviteId, 0, senderName, "Panel"));
            }

            // Fetch pending mentor invites
            String sqlMentorInvites = "SELECT mi.inviteid, t.team_id, t.team_name " +
                                      "FROM mentor_invite mi " +
                                      "JOIN team t ON mi.team_id = t.team_id " +
                                      "WHERE mi.profid = ? AND mi.status = 'pending'";
            PreparedStatement psMentor = conn.prepareStatement(sqlMentorInvites);
            psMentor.setInt(1, profId);
            ResultSet rsMentor = psMentor.executeQuery();

            while (rsMentor.next()) {
                int inviteId = rsMentor.getInt("inviteid");
                int teamId = rsMentor.getInt("team_id");
                String teamName = rsMentor.getString("team_name");
                mentorRequests.add(new PanelRequest(inviteId, teamId, teamName, "Mentor"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set the invites in the request scope
        request.setAttribute("panelInvites", panelRequests);
        request.setAttribute("mentorInvites", mentorRequests);

        // Forward back to the JSP page
        request.getRequestDispatcher("facDashboard.jsp").forward(request, response);
    }
}