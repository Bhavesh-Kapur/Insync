package in.upes.projectmanagement.Faculty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class FillMarksServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectId = request.getParameter("projectId");
        String synopsisMarks = request.getParameter("synopsisMarks");
        String midtermMarks = request.getParameter("midtermMarks");
        String endtermMarks = request.getParameter("endtermMarks");

        try {
            // Database connection
            Connection con = databaseConnection.initializeDatabase();
            // SQL query to update marks
            String query = "UPDATE marks SET synopsis_marks = ?, midterm_marks = ?, endterm_marks = ? WHERE project_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, synopsisMarks);
            ps.setString(2, midtermMarks);
            ps.setString(3, endtermMarks);
            ps.setString(4, projectId);

            int result = ps.executeUpdate();
            con.close();

            if (result > 0) {
                response.sendRedirect("mentorProjectList.jsp?message=Marks updated successfully");
            } else {
                response.sendRedirect("fillMarks.jsp?projectId=" + projectId + "&error=Unable to update marks");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("fillMarks.jsp?projectId=" + projectId + "&error=An error occurred");
        }
    }
}