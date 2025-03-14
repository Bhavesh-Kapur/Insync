package in.upes.projectmanagement.Faculty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class HandleMentorInvite extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement psUpdateFaculty = null;
        PreparedStatement psUpdateInvite = null;
        PreparedStatement psInsertMentorProj = null;
        PreparedStatement psCountProjects = null;
        PreparedStatement psFetchProjectId = null;
        ResultSet rs = null;

        try {
            HttpSession session = request.getSession();
            int profid = (int) session.getAttribute("profid");
            conn = databaseConnection.initializeDatabase();

            // Retrieve inviteId, action, and teamId from the request
            int inviteId = Integer.parseInt(request.getParameter("inviteId"));
            String action = request.getParameter("action");
            // int teamid = Integer.parseInt(request.getParameter("teamId")); 

            System.out.println("Invite ID: " + inviteId);
            System.out.println("Action: " + action);
            // System.out.println("Team ID: " + teamid);
            String fetchTeamId = "SELECT team_id from mentor_invite where inviteid =?";
            psFetchProjectId = conn.prepareStatement(fetchTeamId);
            psFetchProjectId.setInt(1, inviteId);
            rs = psFetchProjectId.executeQuery();
            int team_id = 0;
            if(rs.next()){
                team_id = rs.getInt("team_id");
            }
            System.out.println(team_id);
            // Fetch the projectId from the project table using teamId
            String fetchProjectIdQuery = "SELECT project_id FROM project WHERE team_id = ?";
            psFetchProjectId = conn.prepareStatement(fetchProjectIdQuery);
            psFetchProjectId.setInt(1, team_id);
            rs = psFetchProjectId.executeQuery();

            int projectid = 0;
            if (rs.next()) {
                projectid = rs.getInt("project_id");
            }

            // Check how many projects this professor is currently mentoring in mentor_proj table
            String countProjectsQuery = "SELECT COUNT(*) FROM mentor_proj WHERE profid = ?";
            psCountProjects = conn.prepareStatement(countProjectsQuery);
            psCountProjects.setInt(1, profid);
            rs = psCountProjects.executeQuery();

            int projectCount = 0;   
            if (rs.next()) {
                projectCount = rs.getInt(1);
            }

            // If the professor is already mentoring 4 projects, don't allow more
            if (projectCount >= 4) {
                response.sendRedirect("facDashboard.jsp?error=You cannot mentor more than 4 projects.");
                return;
            }

            if ("accept".equalsIgnoreCase(action)) {
                // Update faculty table to set mentor = 1 (accepted mentor invite)
                String updateFacultyQuery = "UPDATE faculty SET mentor = 1 WHERE profid = ?";
                psUpdateFaculty = conn.prepareStatement(updateFacultyQuery);
                psUpdateFaculty.setInt(1, profid);
                psUpdateFaculty.executeUpdate();
            }

            // Update mentor_invite table to set the status of the invite (accepted or rejected)
            String updateInviteQuery = "UPDATE mentor_invite SET status = ? WHERE profid = ? AND status = 'pending' AND inviteid = ?";
            psUpdateInvite = conn.prepareStatement(updateInviteQuery);
            psUpdateInvite.setString(1, action); // 'accepted' or 'rejected'
            psUpdateInvite.setInt(2, profid);
            psUpdateInvite.setInt(3, inviteId);
            psUpdateInvite.executeUpdate();

            // Insert the mentor-proj relation into the mentor_proj table if the count is less than 4
           // Insert the mentor-proj relation into the mentor_proj table if the count is less than 4

           String fetchExistingProjectsQuery = "SELECT projectid1, projectid2, projectid3, projectid4 FROM mentor_proj WHERE profid = ?";
            PreparedStatement psFetchExistingProjects = conn.prepareStatement(fetchExistingProjectsQuery);
            psFetchExistingProjects.setInt(1, profid);
            rs = psFetchExistingProjects.executeQuery();

            if (rs.next()) {
                // Check for the first empty project ID column and update it
                for (int i = 1; i <= 4; i++) {
                    if (rs.getObject("projectid" + i) == null) {
                        // Construct the query dynamically to update the first NULL project column
                        String updateQuery = "UPDATE mentor_proj SET projectid" + i + " = ? WHERE profid = ?";
                        psInsertMentorProj = conn.prepareStatement(updateQuery);
                        psInsertMentorProj.setInt(1, projectid);  // Set project id
                        psInsertMentorProj.setInt(2, profid);  // Set professor id
                        psInsertMentorProj.executeUpdate();

                        System.out.println("Project added to mentor_proj at projectid" + i);
                        return; // Exit after adding the project
                    }
                }
                // If no empty slot is found (i.e., all projectid1-4 are filled), inform the user
                System.out.println("Professor is already mentoring 4 projects.");
            } else {
                // If no entry exists for this professor, create a new row
                String insertNewMentorQuery = "INSERT INTO mentor_proj (profid, projectid1) VALUES (?, ?)";
                PreparedStatement psInsertNewMentor = conn.prepareStatement(insertNewMentorQuery);
                psInsertNewMentor.setInt(1, profid);  // Set professor id
                psInsertNewMentor.setInt(2, projectid);  // Set project id
                psInsertNewMentor.executeUpdate();

                System.out.println("New mentor entry created with projectid1.");
            }
            
            // Redirect with success message
            response.sendRedirect("facDashboard.jsp?message=Invite " + action + "ed successfully");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("facDashboard.jsp?error=Error handling invite");
        } finally {
            try {
                if (psUpdateFaculty != null) psUpdateFaculty.close();
                if (psUpdateInvite != null) psUpdateInvite.close();
                if (psInsertMentorProj != null) psInsertMentorProj.close();
                if (psCountProjects != null) psCountProjects.close();
                if (psFetchProjectId != null) psFetchProjectId.close();
                if (rs != null) rs.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}