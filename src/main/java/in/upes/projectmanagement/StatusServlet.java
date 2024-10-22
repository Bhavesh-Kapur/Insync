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

// public class StatusServlet extends HttpServlet {
//     private static final long serialVersionUID = 1L;

//     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         HttpSession session = request.getSession(false);
        
//         // Check if the user is logged in
//         if (session == null || session.getAttribute("sapid") == null) {
//             response.sendRedirect("login.jsp");
//             return;
//         }

//         // String sapId = (String) session.getAttribute("sapid");
//         int sapId = (int) session.getAttribute("sapid");// Get logged-in user's SAP ID
//         Connection con = null;
//         PreparedStatement ps = null;
//         ResultSet rs = null;

//         try {
//             con = databaseConnection.initializeDatabase();
//             String query1 = "SELECT name FROM student WHERE sapid = ?";
//             ps = con.prepareStatement(query1);
//             ps.setInt(1, sapId);
//             String name ="";
//             rs = ps.executeQuery();
//             if(rs.next()){
//                 name = rs.getString("name");
//                 System.out.println("name is "+name);
//             }else{
//                 System.out.println("error here");
//             }
//             // Query to fetch invite statuses (pending, accepted, rejected) where the logged-in user is the inviter
//             String query = "SELECT name, inviteStatus FROM invites WHERE invitedBy = ?";
//             ps = con.prepareStatement(query);
//             ps.setString(1, name);
//             rs = ps.executeQuery();

//             // Use HashMap to store invite statuses: 'accepted', 'pending', 'rejected'
//             HashMap<String, ArrayList<String>> statusMap = new HashMap<>();
//             statusMap.put("accepted", new ArrayList<>());
//             statusMap.put("pending", new ArrayList<>());
//             statusMap.put("rejected", new ArrayList<>());

//             // Fetch the names and statuses of invitees
//             while (rs.next()) {
//                 String studentName = rs.getString("name");
//                 String inviteStatus = rs.getString("inviteStatus");

//                 if (inviteStatus.equals("Accepted")) {
//                     statusMap.get("accepted").add(studentName);
//                 } else if (inviteStatus.equals("Pending")) {
//                     statusMap.get("pending").add(studentName);
//                 } else if (inviteStatus.equals("Rejected")) {
//                     statusMap.get("rejected").add(studentName);
//                 }
//             }

//             // Pass the statusMap to the JSP page for display
//             request.setAttribute("statusMap", statusMap);
//             RequestDispatcher dispatcher = request.getRequestDispatcher("status.jsp");
//             dispatcher.forward(request, response);

//         } catch (Exception e) {
//             e.printStackTrace();
//             response.sendRedirect("error.jsp");
//         } finally {
//             try { if (rs != null) rs.close(); } catch (Exception ignored) {}
//             try { if (ps != null) ps.close(); } catch (Exception ignored) {}
//             try { if (con != null) con.close(); } catch (Exception ignored) {}
//         }
//     }
// }



public class StatusServlet extends HttpServlet {
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession(false);
    
    // Check if the user is logged in
    if (session == null || session.getAttribute("sapid") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int sapId = (int) session.getAttribute("sapid"); // Get logged-in user's SAP ID
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        con = databaseConnection.initializeDatabase();
        if (con == null) {
            throw new Exception("Failed to establish database connection.");
        }

        String query1 = "SELECT name FROM student WHERE sapid = ?";
        ps = con.prepareStatement(query1);
        ps.setInt(1, sapId);
        rs = ps.executeQuery();

        String name = "";
        if (rs.next()) {
            name = rs.getString("name");
            System.out.println("User name is: " + name);
        } else {
            System.out.println("Error: No user found with SAP ID: " + sapId);
            response.sendRedirect("error.jsp");
            return; // Prevent proceeding if user is not found
        }

        // Query to fetch invite statuses (pending, accepted, rejected) where the logged-in user is the inviter
        String query = "SELECT name, inviteStatus FROM invites WHERE invitedBy = ?";
        ps = con.prepareStatement(query);
        ps.setString(1, name);
        rs = ps.executeQuery();
        if(rs.next()){
        System.out.println(rs.getString("inviteStatus"));
        }
        HashMap<String, ArrayList<String>> statusMap = new HashMap<>();
        statusMap.put("accepted", new ArrayList<>());
        statusMap.put("pending", new ArrayList<>());
        statusMap.put("rejected", new ArrayList<>());

        // Fetch the names and statuses of invitees
        while (rs.next()) {
            String studentName = rs.getString("name");
            String inviteStatus = rs.getString("inviteStatus");

            if (inviteStatus.equals("accepted")) {
                System.out.println("accepted done");
                statusMap.get("accepted").add(studentName);
            } else if (inviteStatus.equals("pending")) {
                System.out.println("pending done");
                statusMap.get("pending").add(studentName);
            } else if (inviteStatus.equals("rejected")) {
                System.out.println("rejected done");
                statusMap.get("rejected").add(studentName);
            }
        }

        // Log the size of each status category for debugging
        System.out.println("Accepted Invites: " + statusMap.get("accepted").size());
        System.out.println("Pending Invites: " + statusMap.get("pending").size());
        System.out.println("Rejected Invites: " + statusMap.get("rejected").size());

        // Pass the statusMap to the JSP page for display
        request.setAttribute("statusMap", statusMap);
        RequestDispatcher dispatcher = request.getRequestDispatcher("status.jsp");
        dispatcher.forward(request, response);

    } catch (Exception e) {
        e.printStackTrace(); // Log the exception
        response.sendRedirect("error.jsp");
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception ignored) {}
        try { if (ps != null) ps.close(); } catch (Exception ignored) {}
        try { if (con != null) con.close(); } catch (Exception ignored) {}
    }
}
}