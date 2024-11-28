package in.upes.projectmanagement.Faculty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class FetchMentorProjects extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement psFetchProjects = null;
        ResultSet rs = null;

        try {
            // Get professor id from the session
            HttpSession session = request.getSession();
            Integer profid = (Integer) session.getAttribute("profid");

            // Initialize the database connection
            conn = databaseConnection.initializeDatabase();

            // SQL query to fetch all projects assigned to the professor
            String fetchProjectsQuery = "SELECT projectid1, projectid2, projectid3, projectid4 " +
                                        "FROM mentor_proj WHERE profid = ?";
            psFetchProjects = conn.prepareStatement(fetchProjectsQuery);
            psFetchProjects.setInt(1, profid);
            rs = psFetchProjects.executeQuery();

            // List to store the project IDs
            List<Integer> projectIds = new ArrayList<>();
            while (rs.next()) {
                // Check each project ID column and add it to the list if not NULL
                for (int i = 1; i <= 4; i++) {
                    Integer projectid = rs.getObject("projectid" + i, Integer.class);
                    if (projectid != null) {
                        projectIds.add(projectid);
                    }
                }
            }

            // Set the list of project IDs as an attribute to the request
            request.setAttribute("projectIds", projectIds);

            // Forward the request to a JSP page to display the projects
            request.getRequestDispatcher("displayProjects.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("facDashboard.jsp?error=Error fetching projects");
        } catch (ClassNotFoundException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } finally {
            try {
                if (psFetchProjects != null) psFetchProjects.close();
                if (rs != null) rs.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}