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

public class FetchMarksServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement psMentor = null, psPanel = null;
        ResultSet rsMentor = null, rsPanel = null;
        HttpSession session = request.getSession();
        Integer profid = (Integer) session.getAttribute("profid");

        try {
            conn = databaseConnection.initializeDatabase();

            // Query to fetch mentor marks for all teams
            String mentorMarksQuery = "SELECT * from mentor_marks;";
            psMentor = conn.prepareStatement(mentorMarksQuery);
            rsMentor = psMentor.executeQuery();

            ArrayList<MentorMarks> mentorMarksList = new ArrayList<>();
            while (rsMentor.next()) {
                int teamId = rsMentor.getInt("team_id");
                int synopsisMarks = rsMentor.getInt("synopsis_marks");
                int midMarks = rsMentor.getInt("mid_marks");
                int endMarks = rsMentor.getInt("end_marks");

                MentorMarks mentorMarks = new MentorMarks(teamId, synopsisMarks, midMarks, endMarks);
                mentorMarksList.add(mentorMarks);
            }

            // Query to fetch panel marks for all teams
            String panelMarksQuery = "SELECT * from panel_marks";
            psPanel = conn.prepareStatement(panelMarksQuery);
            rsPanel = psPanel.executeQuery();

            ArrayList<PanelMarks> panelMarksList = new ArrayList<>();
            while (rsPanel.next()) {
                int teamId = rsPanel.getInt("team_id");
                int synopsisMarks = rsPanel.getInt("synopsis_marks");
                int midMarks = rsPanel.getInt("mid_marks");
                int endMarks = rsPanel.getInt("end_marks");

                PanelMarks panelMarks = new PanelMarks(teamId, synopsisMarks, midMarks, endMarks);
                panelMarksList.add(panelMarks);
            }

            // Set the fetched data in the request attributes
            request.setAttribute("mentorMarksList", mentorMarksList);
            request.setAttribute("panelMarksList", panelMarksList);

            // Forward to JSP for rendering
            RequestDispatcher dispatcher = request.getRequestDispatcher("marksDisplay.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rsMentor != null) rsMentor.close();
                if (rsPanel != null) rsPanel.close();
                if (psMentor != null) psMentor.close();
                if (psPanel != null) psPanel.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}