// package in.upes.projectmanagement;

// import java.io.IOException;
// import java.sql.Connection;
// import java.sql.PreparedStatement;
// import java.sql.ResultSet;
// import java.util.ArrayList;
// import java.util.List;
// import jakarta.servlet.ServletException;
// import jakarta.servlet.http.HttpServlet;
// import jakarta.servlet.http.HttpServletRequest;
// import jakarta.servlet.http.HttpServletResponse;

// public class TeamNotificationServlet extends HttpServlet {
//     private static final long serialVersionUID = 1L;

//     @Override
//     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         String teamId = (String) request.getSession().getAttribute("teamId");  // Assumes teamId is stored in session
//         if (teamId == null) {
//             response.sendRedirect("login.jsp");
//             return;
//         }

//         List<Notification> notifications = new ArrayList<>();

//         try (Connection con = databaseConnection.initializeDatabase()) {
//             String sql = "SELECT notificationText, meetingTime, facultyId " +
//                          "FROM Notifications " +
//                          "WHERE teamId = ? " +
//                          "ORDER BY meetingTime DESC";
//             try (PreparedStatement stmt = con.prepareStatement(sql)) {
//                 stmt.setInt(1, Integer.parseInt(teamId));
//                 try (ResultSet rs = stmt.executeQuery()) {
//                     while (rs.next()) {
//                         Notification notification = new Notification(
//                             rs.getString("notificationText"),
//                             rs.getString("meetingTime"),
//                             rs.getInt("facultyId")
//                         );
//                         notifications.add(notification);
//                     }
//                 }
//             }
//         } catch (Exception e) {
//             e.printStackTrace();
//             response.sendRedirect("error.jsp");
//             return;
//         }

//         request.setAttribute("notifications", notifications);
//         request.getRequestDispatcher("teamNotifications.jsp").forward(request, response);
//     }

//     public static class Notification {
//         private String notificationText;
//         private String meetingTime;
//         private int facultyId;

//         public Notification(String notificationText, String meetingTime, int facultyId) {
//             this.notificationText = notificationText;
//             this.meetingTime = meetingTime;
//             this.facultyId = facultyId;
//         }

//         public String getNotificationText() {
//             return notificationText;
//         }

//         public String getMeetingTime() {
//             return meetingTime;
//         }

//         public int getFacultyId() {
//             return facultyId;
//         }
//     }
// }
