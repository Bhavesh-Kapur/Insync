package in.upes.projectmanagement.Student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.zip.DataFormatException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
public class inviteFaculty extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
                HttpSession session = request.getSession();
        String profid = request.getParameter("profid");
        // System.out.println(profid);
        int sapid = (int) session.getAttribute("sapid");

        // Establish connection to database
        try  {
            String teamId = "10";
            // System.out.println(sapid);
            Connection con = databaseConnection.initializeDatabase();
            String query = "SELECT team_id from team WHERE sapid1 = ? OR sapid2 = ? OR sapid3 = ? OR sapid4 = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, sapid);
            pstmt.setInt(2, sapid);
            pstmt.setInt(3, sapid);
            pstmt.setInt(4, sapid);

            ResultSet rs = null;
            rs = pstmt.executeQuery();
            while (rs.next()) {
                teamId = rs.getString("team_id");
            }
            System.out.println(teamId);
            query = "INSERT INTO mentor_invite (team_id, profid, status) VALUES (?, ?, ?)";
            pstmt=con.prepareStatement(query);
            pstmt.setString(1, teamId);
            pstmt.setString(2, profid);
            pstmt.setString(3, "Pending"); // Initial status

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                request.setAttribute("message", "Invitation sent successfully!");
            } else {
                request.setAttribute("message", "Failed to send invitation.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "An error occurred: " + e.getMessage());
        }

        // Redirect back to the same page with a message
        request.getRequestDispatcher("/Student/invitementor.jsp").forward(request, response);
    }
}