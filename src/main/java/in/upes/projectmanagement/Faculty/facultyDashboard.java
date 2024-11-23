package in.upes.projectmanagement.Faculty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class facultyDashboard extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer profid = (Integer) session.getAttribute("profid");

        if (profid == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=2"); // Redirect if not logged in
            return;
        }

        try {
            Connection con = databaseConnection.initializeDatabase();
            String sql = "SELECT i.invite_id, i.team_id, t.team_name " +
            "FROM invites i " +
            "JOIN team t ON i.team_id = t.team_id " +
            "WHERE i.profid = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, profid);

            ResultSet rs = stmt.executeQuery();
            List<Invite> invites = new ArrayList<>();

            while (rs.next()) {
                Invite invite = new Invite();
                invite.setInviteId(rs.getInt("invite_id"));
                invite.setTeamId(rs.getInt("team_id"));
                invite.setTeamName(rs.getString("team_name"));
                invites.add(invite);
            }

            request.setAttribute("invites", invites); // Attach the list of invites to the request
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Faculty/facDashboard.jsp");
            dispatcher.forward(request, response); // Forward to JSP

            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=3"); // Redirect on error
        }
    }
}