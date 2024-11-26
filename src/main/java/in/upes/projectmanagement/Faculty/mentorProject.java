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

public class mentorProject extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Get database connection
            conn = databaseConnection.initializeDatabase();
            HttpSession session = request.getSession();
            int currentProfId = (int) session.getAttribute("profid");

            // Query to fetch all projects where the current professor is the mentor
            String fetchProjectsQuery = "SELECT project_id, project_details, semester FROM project WHERE profid = ?";
            ps = conn.prepareStatement(fetchProjectsQuery);
            ps.setInt(1, currentProfId);
            rs = ps.executeQuery();

            // List to store project details
            ArrayList<mProject> mprojectList = new ArrayList<>();
            while (rs.next()) {
                int projectId = rs.getInt("project_id");
                String projectName = rs.getString("project_details");
                String semester = rs.getString("semester");

                // Create an mProject object
                mProject mproject = new mProject(projectId, projectName, semester);
                mprojectList.add(mproject);
            }

            // Add the project list to the request attributes
            request.setAttribute("mprojectList", mprojectList);

            // Forward the request to a JSP page for rendering
            RequestDispatcher dispatcher = request.getRequestDispatcher("mentor.jsp");
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