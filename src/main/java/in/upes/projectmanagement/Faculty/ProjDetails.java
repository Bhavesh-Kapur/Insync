package in.upes.projectmanagement.Faculty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProjDetails extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Get project ID from request
            int projectId = Integer.parseInt(request.getParameter("projectId"));

            // Get database connection
            conn = databaseConnection.initializeDatabase();

            // Query to fetch project details
            String projectDetailsQuery = "SELECT p.project_name, p.srs, t.team_name " +
                                         "FROM project p " +
                                         "JOIN team t ON p.team_id = t.team_id " +
                                         "WHERE p.project_id = ?";
            ps = conn.prepareStatement(projectDetailsQuery);
            ps.setInt(1, projectId);
            rs = ps.executeQuery();

            if (rs.next()) {
                String projectName = rs.getString("project_name");
                String srs = rs.getString("srs"); // Assuming 'srs' is a file path or text
                String teamName = rs.getString("team_name");

                // Add details to request attributes
                request.setAttribute("projectName", projectName);
                request.setAttribute("srs", srs);
                request.setAttribute("teamName", teamName);

                // Forward to the JSP page for rendering project details
                RequestDispatcher dispatcher = request.getRequestDispatcher("project_details.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("project_list.jsp?error=Project not found");
            }

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
