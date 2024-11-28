package in.upes.projectmanagement.Faculty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class processMarks extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn;
        HttpSession session = request.getSession();
        String projectId = request.getParameter("selectedProjectId");
        int profid = (int) session.getAttribute("profid");
        int midtermMarks = 0, endtermMarks = 0, synopsisMarks = 0;
        System.out.println(projectId);  
        System.out.println(profid);

        // Validate and parse inputs
        try {
            midtermMarks = Integer.parseInt(request.getParameter("midtermMarks"));
            endtermMarks = Integer.parseInt(request.getParameter("endtermMarks"));
            synopsisMarks = Integer.parseInt(request.getParameter("synopsisMarks"));
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid input. Ensure all marks are numeric.");
            request.getRequestDispatcher("mentor.jsp").forward(request, response);
            return;
        }

        try {

                conn = databaseConnection.initializeDatabase();
            int team_id = 0;
            String teamQuery = "SELECT team_id from project where project_id = ?";
            pstmt = conn.prepareStatement(teamQuery);
            pstmt.setString(1, projectId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                team_id = rs.getInt("team_id");
            }

            System.out.println(team_id);

            // First, check if an entry for this project and professor exists
            String selectQuery = "SELECT * FROM mentor_marks WHERE team_id = ? AND profid = ?";
            pstmt = conn.prepareStatement(selectQuery);
            pstmt.setInt(1, team_id);
            pstmt.setInt(2, profid);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                // If the record exists, perform an update
                String updateQuery = "UPDATE mentor_marks SET synopsis_marks = ?, mid_marks = ?, end_marks = ? WHERE team_id = ? AND profid = ?";
                pstmt = conn.prepareStatement(updateQuery);
                pstmt.setInt(1, synopsisMarks);
                pstmt.setInt(2, midtermMarks);
                pstmt.setInt(3, endtermMarks);
                pstmt.setInt(4, team_id);
                pstmt.setInt(5, profid);

                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    request.setAttribute("successFlag", "Marks updated successfully.");
                } else {
                    request.setAttribute("errorMessage", "Failed to update marks. Project ID not found.");
                }
            } else {
                // If no record exists, perform an insert
                String insertQuery = "INSERT INTO mentor_marks (profid, team_id, synopsis_marks, mid_marks, end_marks) VALUES (?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(insertQuery);
                pstmt.setInt(1, profid);
                pstmt.setInt(2, team_id);
                pstmt.setInt(3, synopsisMarks);
                pstmt.setInt(4, midtermMarks);
                pstmt.setInt(5, endtermMarks);

                int rowsInserted = pstmt.executeUpdate();
                if (rowsInserted > 0) {
                    request.setAttribute("successFlag", "Marks inserted successfully.");
                } else {
                    request.setAttribute("errorMessage", "Failed to insert marks.");
                }
            }

            request.getRequestDispatcher("mentor.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing marks. Please try again.");
            request.getRequestDispatcher("mentor.jsp").forward(request, response);
        } catch (ClassNotFoundException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } finally {
        }
    }
}