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


public class profList extends HttpServlet {
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


            // Query to fetch all professors except the current one
            String fetchProfessorsQuery = "SELECT profid, name, program FROM faculty WHERE profid != ?";
            ps = conn.prepareStatement(fetchProfessorsQuery);
            ps.setInt(1, currentProfId);
            rs = ps.executeQuery();

            // List to store professor details
            ArrayList<Professor> professorList = new ArrayList<>();
            while (rs.next()) {
                int profId = rs.getInt("profid");
                String profName = rs.getString("name");
                String program = rs.getString("program");

                // Create a Professor object
                Professor professor = new Professor(profId, profName, program);
                professorList.add(professor);
            }

            // Add the professor list to the request attributes
            request.setAttribute("professorList", professorList);

            // Forward the request to a JSP page for rendering
            RequestDispatcher dispatcher = request.getRequestDispatcher("professorList.jsp");
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