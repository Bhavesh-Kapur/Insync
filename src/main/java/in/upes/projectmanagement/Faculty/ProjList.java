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
import jakarta.servlet.http.HttpSession;

public class projList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
         HttpSession session = request.getSession();
         int profid = (int) session.getAttribute("profid");
        System.out.println(profid);

        try {
            // Get database connection
            conn = databaseConnection.initializeDatabase();

            // Query to fetch all projects
            String fetchProjectsQuery = "SELECT project_id, project_details, semester  FROM project WHERE profid = ?";
            ps = conn.prepareStatement(fetchProjectsQuery);
            ps.setInt(1, profid);
            rs = ps.executeQuery();

            // Create a list to store project details
            ArrayList<Project> projectList = new ArrayList<>();
            while (rs.next()) {
                int projectId = rs.getInt("project_id");
                String projectName = rs.getString("project_details");
                int semester = rs.getInt("semester");
                System.out.println(projectId);
                // Create a Project object (custom POJO for holding project details)
                Project project = new Project(projectId, projectName, semester);
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




