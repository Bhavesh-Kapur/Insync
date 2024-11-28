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

        int projectId;
        int profid = (int) session.getAttribute("profid");
        int midtermMarks = 0, endtermMarks = 0, synopsisMarks = 0;

        // Validate and parse inputs
        try {
            projectId = Integer.parseInt(request.getParameter("selectedProjectId"));
            midtermMarks = Integer.parseInt(request.getParameter("midtermMarks"));
            endtermMarks = Integer.parseInt(request.getParameter("endtermMarks"));
            synopsisMarks = Integer.parseInt(request.getParameter("synopsisMarks"));
        } catch (NumberFormatException e) {
            session.setAttribute("popupMessage", "Invalid input. Ensure all marks are numeric.");
            response.sendRedirect("mentor.jsp");
            return;
        }

        try {
            conn = databaseConnection.initializeDatabase();
            int team_id = 0;
            String teamQuery = "SELECT team_id from project where project_id = ?";
            pstmt = conn.prepareStatement(teamQuery);
            pstmt.setInt(1, projectId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                team_id = rs.getInt("team_id");
            }

            // Check if an entry exists
            String selectQuery = "SELECT * FROM mentor_marks WHERE team_id = ? AND profid = ?";
            pstmt = conn.prepareStatement(selectQuery);
            pstmt.setInt(1, team_id);
            pstmt.setInt(2, profid);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Update existing entry
                String updateQuery = "UPDATE mentor_marks SET synopsis_marks = ?, mid_marks = ?, end_marks = ? WHERE team_id = ? AND profid = ?";
                pstmt = conn.prepareStatement(updateQuery);
                pstmt.setInt(1, synopsisMarks);
                pstmt.setInt(2, midtermMarks);
                pstmt.setInt(3, endtermMarks);
                pstmt.setInt(4, team_id);
                pstmt.setInt(5, profid);

                pstmt.executeUpdate();
                session.setAttribute("popupMessage", "Marks updated successfully.");
                response.sendRedirect("mentor.jsp");
                // response.sendRedirect("mentorProject");
            } else {
                // Insert new entry
                String insertQuery = "INSERT INTO mentor_marks (profid, team_id, synopsis_marks, mid_marks, end_marks) VALUES (?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(insertQuery);
                pstmt.setInt(1, profid);
                pstmt.setInt(2, team_id);
                pstmt.setInt(3, synopsisMarks);
                pstmt.setInt(4, midtermMarks);
                pstmt.setInt(5, endtermMarks);

                pstmt.executeUpdate();;
                session.setAttribute("popupMessage", "Marks updated successfully.");
                // response.sendRedirect("mentorProject");
                response.sendRedirect("mentor.jsp");
            }

            // response.sendRedirect("mentor.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            session.setAttribute("popupMessage", "An error occurred while processing marks. Please try again.");
            response.sendRedirect("mentor.jsp");
        }
    }
}