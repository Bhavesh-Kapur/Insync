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

// public class PanelServlet extends HttpServlet {
//     private static final long serialVersionUID = 1L;

//     @Override
//     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         List<ProjectDetails> projectList = new ArrayList<>();

//         try (Connection con = databaseConnection.initializeDatabase()) {
//             String sql = "SELECT p.projectId, p.projectName, t.teamName, p.marks, m.mentorName " +
//                          "FROM Projects p " +
//                          "JOIN Teams t ON p.teamId = t.teamId " +
//                          "JOIN Mentors m ON t.mentorId = m.mentorId";

//             try (PreparedStatement stmt = con.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
//                 while (rs.next()) {
//                     ProjectDetails project = new ProjectDetails(
//                         rs.getInt("projectId"),
//                         rs.getString("projectName"),
//                         rs.getString("teamName"),
//                         rs.getInt("marks"),
//                         rs.getString("mentorName")
//                     );
//                     projectList.add(project);
//                 }
//             }
//         } catch (Exception e) {
//             e.printStackTrace();
//             response.sendRedirect("error.jsp");
//             return;
//         }

//         request.setAttribute("projectList", projectList);
//         request.getRequestDispatcher("panel.jsp").forward(request, response);
//     }

//     @Override
//     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         String projectId = request.getParameter("projectId");
//         String marks = request.getParameter("marks");

//         if (projectId != null && marks != null) {
//             try (Connection con = databaseConnection.initializeDatabase()) {
//                 String sql = "UPDATE Projects SET marks = ? WHERE projectId = ?";
//                 try (PreparedStatement stmt = con.prepareStatement(sql)) {
//                     stmt.setInt(1, Integer.parseInt(marks));
//                     stmt.setInt(2, Integer.parseInt(projectId));
//                     stmt.executeUpdate();
//                 }
//             } catch (Exception e) {
//                 e.printStackTrace();
//                 response.sendRedirect("error.jsp");
//                 return;
//             }
//         }
        
//         response.sendRedirect("PanelServlet");
//     }

//     public static class ProjectDetails {
//         private int projectId;
//         private String projectName;
//         private String teamName;
//         private int marks;
//         private String mentorName;

//         public ProjectDetails(int projectId, String projectName, String teamName, int marks, String mentorName) {
//             this.projectId = projectId;
//             this.projectName = projectName;
//             this.teamName = teamName;
//             this.marks = marks;
//             this.mentorName = mentorName;
//         }

//         public int getProjectId() {
//             return projectId;
//         }

//         public String getProjectName() {
//             return projectName;
//         }

//         public String getTeamName() {
//             return teamName;
//         }

//         public int getMarks() {
//             return marks;
//         }

//         public String getMentorName() {
//             return mentorName;
//         }
//     }
// }


