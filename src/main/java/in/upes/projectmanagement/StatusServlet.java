package in.upes.projectmanagement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class StatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        // Check if the user is logged in
        if (session == null || session.getAttribute("sapid") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String sapId = session.getAttribute("sapid").toString(); // Get logged-in user's SAP ID
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = databaseConnection.initializeDatabase();

            // Query to fetch invite statuses (pending, accepted, rejected) where the logged-in user is the inviter
            String query = "SELECT name, inviteStatus FROM invites WHERE invitedBy = ?";
            
            ps = con.prepareStatement(query);
            ps.setString(1, sapId);
            rs = ps.executeQuery();

            // Use HashMap to store invite statuses: 'accepted', 'pending', 'rejected'
            HashMap<String, ArrayList<String>> statusMap = new HashMap<>();
            statusMap.put("accepted", new ArrayList<>());
            statusMap.put("pending", new ArrayList<>());
            statusMap.put("rejected", new ArrayList<>());

            // Fetch the names and statuses of invitees
            while (rs.next()) {
                String studentName = rs.getString("name");
                String inviteStatus = rs.getString("inviteStatus");

                if (inviteStatus.equals("accepted")) {
                    statusMap.get("accepted").add(studentName);
                } else if (inviteStatus.equals("pending")) {
                    statusMap.get("pending").add(studentName);
                } else if (inviteStatus.equals("rejected")) {
                    statusMap.get("rejected").add(studentName);
                }
            }

            // Pass the statusMap to the JSP page for display
            request.setAttribute("statusMap", statusMap);
            RequestDispatcher dispatcher = request.getRequestDispatcher("status.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
    }
}