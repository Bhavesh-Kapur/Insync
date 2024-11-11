package in.upes.projectmanagement.Faculty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProjList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Get database connection
            conn = databaseConnection.initializeDatabase();

            // Query to fetch all projects
            String fetchProjectsQuery = "SELECT project_id, project_name FROM project";
            ps = conn.prepareStatement(fetchProjectsQuery);
            rs = ps.executeQuery();

            // Create a list to store project details
            ArrayList<Project> projectList = new ArrayList<>();
            while (rs.next()) {
                int projectId = rs.getInt("project_id");
                String projectName = rs.getString("project_name");

                // Create a Project object (custom POJO for holding project details)
                Project project = new Project(projectId, projectName);
                projectList.add(project);
            }

            // Add project list to request attributes
            request.setAttribute("projectList", projectList);

            // Forward to the JSP page for rendering project list
            RequestDispatcher dispatcher = request.getRequestDispatcher("project_list.jsp");
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
