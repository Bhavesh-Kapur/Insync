// package in.upes.projectmanagement.Student;

// import java.io.IOException;
// import java.sql.Connection;
// import java.sql.PreparedStatement;

// import jakarta.servlet.RequestDispatcher;
// import jakarta.servlet.ServletException;
// import jakarta.servlet.http.HttpServlet;
// import jakarta.servlet.http.HttpServletRequest;
// import jakarta.servlet.http.HttpServletResponse;
// import jakarta.servlet.http.HttpSession;

// public class UpdateProjectDetailsServlet extends HttpServlet {
//     private static final long serialVersionUID = 1L;

//     protected void doPost(HttpServletRequest request, HttpServletResponse response)
//             throws ServletException, IOException {
//         String projectType = request.getParameter("projectType");
//         String teamName = request.getParameter("teamName");
//         String teamId = request.getParameter("teamId");
//         int semester = Integer.parseInt(request.getParameter("semester"));

//         Connection conn = null; // Assume this is your DB connection utility
//         try {
//             conn = databaseConnection.initializeDatabase(); // Replace with your DB connection method

//             // Update project table
//             String updateProjectSQL = "UPDATE project SET project_type = ? WHERE team_id = ?";
//             try (PreparedStatement ps = conn.prepareStatement(updateProjectSQL)) {
//                 ps.setString(1, projectType);
//                 ps.setString(2, teamId);
//                 ps.executeUpdate();
//             }

//             // Update team table
//             String updateTeamSQL = "UPDATE team SET team_name = ? WHERE team_id = ?";
//             try (PreparedStatement ps = conn.prepareStatement(updateTeamSQL)) {
//                 ps.setString(1, teamName);
//                 ps.setString(2, teamId);
//                 ps.executeUpdate();
//             }

//             response.sendRedirect("projectDetails.jsp?teamId=" + teamId);

//         } catch (Exception e) {
//             e.printStackTrace();
//             response.sendRedirect("errorPage.jsp");
//         } finally {
//             if (conn != null) {
//                 try {
//                     conn.close();
//                 } catch (Exception e) {
//                     e.printStackTrace();
//                 }
//             }
//         }
//     }
// }