package in.upes.projectmanagement.Student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import in.upes.projectmanagement.Student.TeamMember;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ProjDetails extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("sapid") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        int sapid = (int) session.getAttribute("sapid");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Get database connection
            conn = databaseConnection.initializeDatabase();

            // Step 1: Get team_id based on the sapid
            String getTeamIdQuery = "SELECT team_id FROM team WHERE sapid1 = ? OR sapid2 = ? OR sapid3 = ? OR sapid4 = ?";
            ps = conn.prepareStatement(getTeamIdQuery);
            ps.setInt(1, sapid);
            ps.setInt(2, sapid);
            ps.setInt(3, sapid);
            ps.setInt(4, sapid);
            rs = ps.executeQuery();

            int teamId = -1;
            if (rs.next()) {
                teamId = rs.getInt("team_id");
            }

            if (teamId == -1) {
                request.setAttribute("error", "No team found for the user.");
                // Error handling here, if needed
                return;
            }

            // Step 2: Get project ID using the team_id (Assuming `Pid` is the project identifier)
            String getProjectDetailsQuery = "SELECT project_id FROM project WHERE team_id = ?";
            ps = conn.prepareStatement(getProjectDetailsQuery);
            ps.setInt(1, teamId);
            rs = ps.executeQuery();

            int projectId = -1;
            if (rs.next()) {
                projectId = rs.getInt("project_id");
            }

            if (projectId == -1) {
                request.setAttribute("error", "No project found for the team.");
                // Error handling here, if needed
                return;
            }

            // Step 3: Get team members using the team_id
            String getTeamMembersQuery = "SELECT s.name, s.sapid, s.semester, s.program " +
                    "FROM student s JOIN team t ON (s.sapid = t.sapid1 OR s.sapid = t.sapid2 OR s.sapid = t.sapid3 OR s.sapid = t.sapid4) " +
                    "WHERE t.team_id = ?";
            ps = conn.prepareStatement(getTeamMembersQuery);
            ps.setInt(1, teamId);
            rs = ps.executeQuery();

            ArrayList<TeamMember> teamMembers = new ArrayList<>();
            while (rs.next()) {
                String name = rs.getString("name");
                int memberSapid = rs.getInt("sapid");
                int memberSemester = rs.getInt("semester");
                String program = rs.getString("program");

                TeamMember member = new TeamMember(name, memberSapid, memberSemester, program);
                teamMembers.add(member);
            }
            String tname = "Select team_name from team where team_id = ?";
            PreparedStatement pst = conn.prepareStatement(tname);
            pst.setInt(1, teamId);
            ResultSet rs1 = pst.executeQuery();
            if (rs1.next()) {
                String teamName = rs1.getString("team_name");
                request.setAttribute("teamName", teamName);
            }
            // Pass attributes to JSP or wherever required in your application
            request.setAttribute("projectId", projectId);
            request.setAttribute("teamId", teamId);
            System.out.println(teamId);
            request.setAttribute("teamMembers", teamMembers);

            // Forward to the appropriate handler (could be redirected to another servlet/page)
            //  response.sendRedirect("project_details.jsp");
            RequestDispatcher dispatcher = request.getRequestDispatcher("project_details.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}