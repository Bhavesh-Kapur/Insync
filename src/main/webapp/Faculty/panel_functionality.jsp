package in.upes.projectmanagement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PanelServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TeamDetails> teamList = new ArrayList<>();
        String facultyId = request.getSession().getAttribute("facultyId").toString();

        try (Connection con = databaseConnection.initializeDatabase()) {
            String sql = "SELECT t.teamId, t.teamName, m.mentorName " +
                         "FROM Teams t " +
                         "JOIN Mentors m ON t.mentorId = m.mentorId " +
                         "WHERE m.facultyId = ?";
            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setInt(1, Integer.parseInt(facultyId));
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        TeamDetails team = new TeamDetails(
                            rs.getInt("teamId"),
                            rs.getString("teamName"),
                            rs.getString("mentorName")
                        );
                        teamList.add(team);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return;
        }

        request.setAttribute("teamList", teamList);
        request.getRequestDispatcher("panel.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String teamId = request.getParameter("teamId");
        String notificationText = request.getParameter("notificationText");
        String meetingTime = request.getParameter("meetingTime");
        String facultyId = request.getSession().getAttribute("facultyId").toString();

        if (teamId != null && notificationText != null && meetingTime != null) {
            try (Connection con = databaseConnection.initializeDatabase()) {
                String sql = "INSERT INTO Notifications (teamId, facultyId, notificationText, meetingTime) VALUES (?, ?, ?, ?)";
                try (PreparedStatement stmt = con.prepareStatement(sql)) {
                    stmt.setInt(1, Integer.parseInt(teamId));
                    stmt.setInt(2, Integer.parseInt(facultyId));
                    stmt.setString(3, notificationText);
                    stmt.setString(4, meetingTime);
                    stmt.executeUpdate();
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
                return;
            }
        }

        request.setAttribute("message", "Notification sent successfully!");
        doGet(request, response);  // Reload team list and display success message
    }

    public static class TeamDetails {
        private int teamId;
        private String teamName;
        private String mentorName;

        public TeamDetails(int teamId, String teamName, String mentorName) {
            this.teamId = teamId;
            this.teamName = teamName;
            this.mentorName = mentorName;
        }

        public int getTeamId() {
            return teamId;
        }

        public String getTeamName() {
            return teamName;
        }

        public String getMentorName() {
            return mentorName;
        }
    }
}
