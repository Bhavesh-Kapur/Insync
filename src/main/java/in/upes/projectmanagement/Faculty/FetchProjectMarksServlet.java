package in.upes.projectmanagement.Faculty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class FetchProjectMarksServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProjectMarks> projectMarksList = new ArrayList<>();
        
        try {
            // Establish connection to the database
            Connection conn = databaseConnection.initializeDatabase();

            // Using PreparedStatement instead of Statement
            String sql = "SELECT project_id, project_name, midterm_marks, endterm_marks, synopsis_marks FROM project_marks";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            // Execute the query
            ResultSet rs = pstmt.executeQuery();
            
            // Process the result set
            while (rs.next()) {
                int projectId = rs.getInt("project_id");
                String projectName = rs.getString("project_name");
                int midtermMarks = rs.getInt("midterm_marks");
                int endtermMarks = rs.getInt("endterm_marks");
                int synopsisMarks = rs.getInt("synopsis_marks");
                
                // Create a ProjectMarks object and add it to the list
                ProjectMarks projectMarks = new ProjectMarks(projectId, projectName, midtermMarks, endtermMarks, synopsisMarks);
                projectMarksList.add(projectMarks);
            }
            
            // Close connections
            rs.close();
            pstmt.close();
            conn.close();
            
        }catch (Exception e) {
            e.printStackTrace();
        }
        
        // Set the project marks list as a request attribute to be accessed in the JSP
        request.setAttribute("projectMarksList", projectMarksList);
        
        // Forward the request to the JSP page for rendering
        RequestDispatcher dispatcher = request.getRequestDispatcher("/displayProjectMarks.jsp");
        dispatcher.forward(request, response);
    }
}