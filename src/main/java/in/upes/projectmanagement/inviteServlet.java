// package in.upes.projectmanagement;
// import java.io.IOException;
// import java.sql.Connection;
// import java.sql.DriverManager;
// import java.sql.PreparedStatement;
// import java.sql.ResultSet;
// import java.util.ArrayList;
// import jakarta.servlet.ServletException;
// import jakarta.servlet.http.HttpServlet;
// import jakarta.servlet.http.HttpServletRequest;
// import jakarta.servlet.http.HttpServletResponse;


// // @WebServlet("/InviteServlet")    // needed servlet mapping 
// public class inviteServlet extends HttpServlet {


//     // db connections 
//     private static final String DB_URL = "jdbc:mysql://localhost:3306/insync";
//     private static final String DB_USER = "root";     //enter your username 
//     private static final String DB_PASSWORD = "rootbhavesh"; 


//     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         String inviterSapId = request.getParameter("inviter_sap_id");
//         String inviteeSapId = request.getParameter("invitee_sap_id");
        
//         // Save invite to database
//         try {
//             // Connection con = DatabaseConnection.initializeDatabase(); // Assume you have this method
//             Class.forName("com.mysql.cj.jdbc.Driver");
//             Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
//             // String query = "INSERT INTO invites (inviter_sap_id, invitee_sap_id, invite_status) VALUES (?, ?, 'Pending')";     

//             //table needs to be created 


//             PreparedStatement ps = conn.prepareStatement(query);
//             ps.setString(1, inviterSapId);
//             ps.setString(2, inviteeSapId);
//             ps.executeUpdate();
//             // ps.close();
//             // conn.close();
            
//             // request.getSession().setAttribute("message", "Invite sent successfully to SAP ID: " + inviteeSapId);
//             response.sendRedirect("dashboard.jsp");
//         } catch (Exception e) {
//             e.printStackTrace();
//         }
//     }
// }
