package in.upes.projectmanagement.Faculty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class mentorProject extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement psFetchMentorProjects = null;
        ResultSet rs = null;
        
        try {
            // Get professor id from the session
            HttpSession session = request.getSession();
            Integer profid = (Integer) session.getAttribute("profid");

            // Initialize the database connection
            conn = databaseConnection.initializeDatabase();

            // SQL query to fetch all project IDs assigned to the professor
            String fetchMentorProjectsQuery = "SELECT projectid1, projectid2, projectid3, projectid4 FROM mentor_proj WHERE profid = ?";
            psFetchMentorProjects = conn.prepareStatement(fetchMentorProjectsQuery);
            psFetchMentorProjects.setInt(1, profid);
            rs = psFetchMentorProjects.executeQuery();

            // List to store project details
            ArrayList<mProject> mProjectList = new ArrayList<>();
            
            while (rs.next()) {
                // Loop through the four project id columns
                for (int i = 1; i <= 4; i++) {
                    Integer projectId = rs.getObject("projectid" + i, Integer.class);
                    if (projectId != null) {
                        System.out.println(projectId);
                        // Fetch the project details from the project table
                        String fetchProjectDetailsQuery = "SELECT project_details, semester FROM project WHERE project_id = ?";
                        PreparedStatement psFetchProjectDetails = conn.prepareStatement(fetchProjectDetailsQuery);
                        psFetchProjectDetails.setInt(1, projectId);
                        ResultSet rsProject = psFetchProjectDetails.executeQuery();

                        if (rsProject.next()) {
                            String projectName = rsProject.getString("project_details");
                            String semester = rsProject.getString("semester");
                            System.out.println(projectName);
                            // Create a new mProject object and add it to the list
                            mProject mproject = new mProject(projectId, projectName, semester);
                            mProjectList.add(mproject);
                        }
                        rsProject.close(); // Close the ResultSet for the project details query
                    }
                }
            }

            // Set the list of mentor projects as an attribute in the request
            request.setAttribute("mProjectList", mProjectList);
            System.out.println(mProjectList);
            // Forward the request to a JSP page to display the projects
            request.getRequestDispatcher("mentor.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("facDashboard.jsp?error=Error fetching projects");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (psFetchMentorProjects != null) psFetchMentorProjects.close();
                if (rs != null) rs.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}