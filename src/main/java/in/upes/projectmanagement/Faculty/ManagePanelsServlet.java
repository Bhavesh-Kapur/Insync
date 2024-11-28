// package in.upes.projectmanagement.Faculty;

// import java.io.IOException;
// import java.sql.Connection;
// import java.sql.PreparedStatement;
// import java.sql.ResultSet;
// import java.util.ArrayList;

// import jakarta.servlet.RequestDispatcher;
// import jakarta.servlet.ServletException;
// import jakarta.servlet.http.HttpServlet;
// import jakarta.servlet.http.HttpServletRequest;
// import jakarta.servlet.http.HttpServletResponse;
// import jakarta.servlet.http.HttpSession;

// public class ManagePanelsServlet extends HttpServlet {
//     private static final long serialVersionUID = 1L;

//     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         String action = request.getParameter("action");

//         switch (action) {
//             case "fetchProjects":
//                 fetchProjects(request, response);
//                 break;
//             case "fetchPanels":
//                 fetchPanels(request, response);
//                 break;
//             default:
//                 response.sendRedirect("error.jsp?message=Invalid action");
//         }
//     }

//     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         String action = request.getParameter("action");

//         if ("assignPanels".equals(action)) {
//             assignPanels(request, response);
//         } else {
//             response.sendRedirect("error.jsp?message=Invalid action");
//         }
//     }

//     private void fetchProjects(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         Connection conn = null;
//         PreparedStatement ps = null;
//         ResultSet rs = null;
//         HttpSession session = request.getSession();
//         int profId = (int) session.getAttribute("profid");

//         try {
//             conn = databaseConnection.initializeDatabase();
//             String query = "SELECT project_id, project_details, semester FROM project WHERE profid = ?";
//             ps = conn.prepareStatement(query);
//             ps.setInt(1, profId);
//             rs = ps.executeQuery();

//             ArrayList<Project> projectList = new ArrayList<>();
//             while (rs.next()) {
//                 int projectId = rs.getInt("project_id");
//                 String projectDetails = rs.getString("project_details");
//                 int semester = rs.getInt("semester");
//                 projectList.add(new Project(projectId, projectDetails, semester));
//             }

//             request.setAttribute("projectList", projectList);
//             RequestDispatcher dispatcher = request.getRequestDispatcher("assign_panels.jsp");
//             dispatcher.forward(request, response);

//         } catch (Exception e) {
//             e.printStackTrace();
//         } finally {
//             closeResources(conn, ps, rs);
//         }
//     }

//     private void fetchPanels(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         Connection conn = null;
//         PreparedStatement ps = null;
//         ResultSet rs = null;

//         try {
//             conn = databaseConnection.initializeDatabase();
//             HttpSession session = request.getSession();
//             int profId = (int) session.getAttribute("profid");
//             String query = "SELECT * from faculty where profid ! = ?";
//             ps = conn.prepareStatement(query);
//             ps.setInt(1, profId);
//             rs = ps.executeQuery();

//             ArrayList<Faculty> panelList = new ArrayList<>();
//             while (rs.next()) {
//                 profId = rs.getInt("profid");
//                 String name = rs.getString("name");
//                 panelList.add(new Faculty(profId, name));
//             }

//             request.setAttribute("panelList", panelList);
//             RequestDispatcher dispatcher = request.getRequestDispatcher("assign_panels.jsp");
//             dispatcher.forward(request, response);

//         } catch (Exception e) {
//             e.printStackTrace();
//         } finally {
//             closeResources(conn, ps, rs);
//         }
//     }

//     protected void assignPanels(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         Connection conn = null;
//         PreparedStatement psCheck = null;
//         PreparedStatement psInsertUpdate = null;
    
//         try {
//             conn = databaseConnection.initializeDatabase();
    
//             // Get parameters from the request
//             int projectId = Integer.parseInt(request.getParameter("projectId")); // Selected Project ID
//             int profId1 = Integer.parseInt(request.getParameter("profId1")); // First Panel Member
//             int profId2 = Integer.parseInt(request.getParameter("profId2")); // Second Panel Member
    
//             // Check if the project already exists in `panel_proj`
//             String checkQuery = "SELECT * FROM panel_proj WHERE projectid1 = ? OR projectid2 = ? OR projectid3 = ? OR projectid4 = ?";
//             psCheck = conn.prepareStatement(checkQuery);
//             psCheck.setInt(1, projectId);
//             psCheck.setInt(2, projectId);
//             psCheck.setInt(3, projectId);
//             psCheck.setInt(4, projectId);
//             ResultSet rs = psCheck.executeQuery();
    
//             if (rs.next()) {
//                 // If the project exists, update the profid1 and profid2
//                 String updateQuery = 
//                     "UPDATE panel_proj " +
//                     "SET profid1 = COALESCE(profid1, ?), " +
//                     "    profid2 = COALESCE(profid2, ?) " +
//                     "WHERE srno = ?";
//                 psInsertUpdate = conn.prepareStatement(updateQuery);
//                 psInsertUpdate.setInt(1, profId1);
//                 psInsertUpdate.setInt(2, profId2);
//                 psInsertUpdate.setInt(3, rs.getInt("srno")); // Use existing row
//             } else {
//                 // If the project does not exist, insert a new record
//                 String insertQuery = "INSERT INTO panel_proj (profid1, profid2, projectid1) VALUES (?, ?, ?)";
//                 psInsertUpdate = conn.prepareStatement(insertQuery);
//                 psInsertUpdate.setInt(1, profId1);
//                 psInsertUpdate.setInt(2, profId2);
//                 psInsertUpdate.setInt(3, projectId);
//             }
    
//             // Execute the update/insert statement
//             psInsertUpdate.executeUpdate();
    
//             // Redirect with a success message
//             response.sendRedirect("assignPanels.jsp?message=Panels assigned successfully");
//         } catch (Exception e) {
//             e.printStackTrace();
//             response.sendRedirect("assignPanels.jsp?error=Error assigning panels");
//         } finally {
//             try {
//                 if (psCheck != null) psCheck.close();
//                 if (psInsertUpdate != null) psInsertUpdate.close();
//                 if (conn != null) conn.close();
//             } catch (Exception ex) {
//                 ex.printStackTrace();
//             }
//         }
//     }
//     private void closeResources(Connection conn, PreparedStatement ps, ResultSet rs) {
//         try {
//             if (rs != null) rs.close();
//             if (ps != null) ps.close();
//             if (conn != null) conn.close();
//         } catch (Exception ex) {
//             ex.printStackTrace();
//         }
//     }
// }