// package in.upes.projectmanagement;
// import java.io.IOException;
// import java.sql.Connection;
// import java.sql.PreparedStatement;
// import java.sql.ResultSet;
// import jakarta.servlet.ServletException;
// import jakarta.servlet.http.HttpServlet;
// import jakarta.servlet.http.HttpServletRequest;
// import jakarta.servlet.http.HttpServletResponse;
// import jakarta.servlet.http.HttpSession;

// public class handleInvite extends HttpServlet {
//     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         HttpSession session = request.getSession();
//         String invitedBy = request.getParameter("invitedBy");
//         String action = request.getParameter("action"); 
//         // String sapid = (String) session.getAttribute("sapId");



//         Connection connection = null;
//         try {

//             Connection con = databaseConnection.initializeDatabase();
//             String query;
//             if ("Accept".equals(action)) {
//                 query = "UPDATE invites SET inviteStatus = 'Accepted' WHERE invitedBy = ? AND inviteStatus = 'Pending'";
//             } else {
//                 query = "UPDATE invites SET inviteStatus = 'Rejected' WHERE invitedBy = ? AND inviteStatus = 'Pending'";
//             }

//             PreparedStatement stmt = con.prepareStatement(query);
//             stmt.setString(1, invitedBy);
//             stmt.executeUpdate();

//             response.sendRedirect("fetchInvite");

//         } catch (Exception e) {
//             e.printStackTrace();
//             response.sendRedirect("error.jsp");
//         } finally {
//             try {
//                 if (connection != null) connection.close();
//             } catch (Exception e) {
//                 e.printStackTrace();
//             }
//         }
//     }
// }







// package in.upes.projectmanagement;

// import java.io.IOException;
// import java.sql.Connection;
// import java.sql.PreparedStatement;
// import java.sql.ResultSet;
// import jakarta.servlet.ServletException;
// import jakarta.servlet.http.HttpServlet;
// import jakarta.servlet.http.HttpServletRequest;
// import jakarta.servlet.http.HttpServletResponse;
// import jakarta.servlet.http.HttpSession;

// public class handleInvite extends HttpServlet {
//     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         HttpSession session = request.getSession();
//         String invitedBy = request.getParameter("invitedBy");
//         String action = request.getParameter("action"); 
//         String sapId = (String) session.getAttribute("sapId"); // Assuming the invited person's SAP ID is stored in the session

//         Connection connection = null;
//         try {
//             Connection con = databaseConnection.initializeDatabase();
//             String query;

//             // Handle invite acceptance or rejection
//             if ("Accept".equals(action)) {
//                 // First, update the invite status to 'Accepted'
//                 query = "UPDATE invites SET inviteStatus = 'Accepted' WHERE invitedBy = ? AND inviteStatus = 'Pending'";
//                 PreparedStatement stmt = con.prepareStatement(query);
//                 stmt.setString(1, invitedBy);
//                 stmt.executeUpdate();
                
//                 // Now, insert the user into the team
//                 String getTeamQuery = "SELECT teamId FROM invites WHERE invitedBy = ? AND sapId = ? AND inviteStatus = 'Accepted'";
//                 PreparedStatement teamStmt = con.prepareStatement(getTeamQuery);
//                 teamStmt.setString(1, invitedBy);
//                 teamStmt.setString(2, sapId);
//                 ResultSet rs = teamStmt.executeQuery();

//                 if (rs.next()) {
//                     int teamId = rs.getInt("teamId");
                    
//                     // Add the invited user to the team
//                     String insertTeamMemberQuery = "INSERT INTO team_members (teamId, sapId) VALUES (?, ?)";
//                     PreparedStatement insertStmt = con.prepareStatement(insertTeamMemberQuery);
//                     insertStmt.setInt(1, teamId);
//                     insertStmt.setString(2, sapId);
//                     insertStmt.executeUpdate();
//                 }
                
//             } else {
//                 // Update the invite status to 'Rejected'
//                 query = "UPDATE invites SET inviteStatus = 'Rejected' WHERE invitedBy = ? AND inviteStatus = 'Pending'";
//                 PreparedStatement stmt = con.prepareStatement(query);
//                 stmt.setString(1, invitedBy);
//                 stmt.executeUpdate();
//             }

//             response.sendRedirect("fetchInvite");

//         } catch (Exception e) {
//             e.printStackTrace();
//             response.sendRedirect("error.jsp");
//         } finally {
//             try {
//                 if (connection != null) connection.close();
//             } catch (Exception e) {
//                 e.printStackTrace();
//             }
//         }
//     }
// }



package in.upes.projectmanagement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class handleInvite extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String invitedBy = request.getParameter("invitedBy");
        String action = request.getParameter("action");
        int sapId = (int) session.getAttribute("sapid"); // The SAP ID of the person accepting/rejecting the invite

        Connection con = null; // Initialize Connection
        try {
            con = databaseConnection.initializeDatabase(); // Ensure the connection is established
            if (con == null) {
                System.err.println("Failed to establish database connection.");
                response.sendRedirect("error.jsp");
                return; // Exit if the connection is null
            }

            String query;

            if ("Accept".equals(action)) {
                // First, update the invite status to 'Accepted'
                query = "UPDATE invites SET inviteStatus = 'Accepted' WHERE invitedBy = ? AND sapid = ? AND inviteStatus = 'Pending'";
                PreparedStatement stmt = con.prepareStatement(query);
                stmt.setString(1, invitedBy);
                stmt.setInt(2, sapId);
                int rowsUpdated = stmt.executeUpdate(); // Get the number of affected rows
                System.err.println("Updated invite status to Accepted for " + rowsUpdated + " rows.");
                System.out.println(sapId);
                System.out.println(invitedBy);

                query = "SELECT sapid from student where name = ?";
                PreparedStatement stmt1 = con.prepareStatement(query);
                stmt1.setString(1, invitedBy);
                ResultSet rs1 = stmt1.executeQuery();
            int sapBy = 0;
                if (rs1.next()) { // Check if there is a result
                    sapBy = rs1.getInt("sapid");
                    System.out.println(sapBy);
                } else {
                    System.out.println("No student found with the name: " + invitedBy);
                }
                System.out.println(sapBy);
                // Ensure the update was successful before proceeding
                if (rowsUpdated > 0) {
                    // First, get the team_id associated with the invitedBy user
                    String getTeamQuery = "SELECT team_id FROM team WHERE sapid1 = ? OR sapid2 = ? OR sapid3 = ? OR sapid4 = ?";
                    
                    PreparedStatement teamStmt = con.prepareStatement(getTeamQuery);
                    teamStmt.setInt(1, sapBy);
                    teamStmt.setInt(2, sapBy);
                    teamStmt.setInt(3, sapBy);
                    teamStmt.setInt(4, sapBy);
                    
                    ResultSet rs = teamStmt.executeQuery();
                
                    if (rs.next()) {
                        int teamId = rs.getInt("team_id");
                
                        // Now fetch the existing members of the team
                        String fetchTeamMembersQuery = "SELECT sapid1, sapid2, sapid3, sapid4 FROM team WHERE team_id = ?";
                        PreparedStatement memberStmt = con.prepareStatement(fetchTeamMembersQuery);
                        memberStmt.setInt(1, teamId);
                        ResultSet memberRs = memberStmt.executeQuery();
                
                        if (memberRs.next()) {
                            String sapid1 = memberRs.getString("sapid1");
                            String sapid2 = memberRs.getString("sapid2");
                            String sapid3 = memberRs.getString("sapid3");
                            String sapid4 = memberRs.getString("sapid4");
                
                            String updateTeamQuery = null;
                
                            // Check available spots in the team and update the team table accordingly
                            if (sapId > 0) {
                                if (sapid1 == null || sapid1.isEmpty()) {
                                    updateTeamQuery = "UPDATE team SET sapid1 = ? WHERE team_id = ?";
                                } else if (sapid2 == null || sapid2.isEmpty()) {
                                    updateTeamQuery = "UPDATE team SET sapid2 = ? WHERE team_id = ?";
                                } else if (sapid3 == null || sapid3.isEmpty()) {
                                    updateTeamQuery = "UPDATE team SET sapid3 = ? WHERE team_id = ?";
                                } else if (sapid4 == null || sapid4.isEmpty()) {
                                    updateTeamQuery = "UPDATE team SET sapid4 = ? WHERE team_id = ?";
                                }
                
                                if (updateTeamQuery != null) {
                                    PreparedStatement updateStmt = con.prepareStatement(updateTeamQuery);
                                    updateStmt.setInt(1, sapId);
                                    updateStmt.setInt(2, teamId);
                                    updateStmt.executeUpdate();
                                }
                        }
                        }
                        createProject(con, teamId, 5, sapBy);
                    }else {
                        // No team exists, create a new team
                        int teamId;
                        String createTeamQuery = "INSERT INTO team (sapid1, sapid2) VALUES (?, ?)";
                        try (PreparedStatement createTeamStmt = con.prepareStatement(createTeamQuery, Statement.RETURN_GENERATED_KEYS)) {
                            createTeamStmt.setInt(1, sapBy); // SAP ID of the inviter
                            createTeamStmt.setInt(2, sapId); // SAP ID of the invited person
                            createTeamStmt.executeUpdate();
                
                            // Optionally, retrieve the generated team ID if needed
                            ResultSet generatedKeys = createTeamStmt.getGeneratedKeys();
                            if (generatedKeys.next()) {
                                 teamId  = generatedKeys.getInt(1);
                                System.out.println("New team created with ID: " + teamId);
                                createProject(con, teamId, 5, sapBy);
                            }
                            System.out.println("Invited person added to the newly created team.");
                        }
                    }
                }
            } else {
                // Update the invite status to 'Rejected'
                query = "UPDATE invites SET inviteStatus = 'Rejected' WHERE invitedBy = ? AND sapid = ? AND inviteStatus = 'Pending'";
                PreparedStatement stmt = con.prepareStatement(query);
                stmt.setString(1, invitedBy);
                stmt.setInt(2, sapId);
                stmt.executeUpdate();
            }

            response.sendRedirect("fetchInvite");

        } catch (Exception e) {
            e.printStackTrace(); // Log the exception for debugging
            response.sendRedirect("error.jsp");
        } finally {
            try {
                if (con != null) con.close(); // Close connection if it's not null
            } catch (Exception e) {
                e.printStackTrace(); // Log any exception during closing
            }
        }
    }
    private void createProject(Connection con, int teamId, int semester, int professorId) throws Exception {
        String createProjectQuery = "INSERT INTO project (team_id, project_details, semester, profid) VALUES (?, ?, ?, ?)";
        try (PreparedStatement projectStmt = con.prepareStatement(createProjectQuery)) {
            projectStmt.setInt(1, teamId); // team_id
            projectStmt.setString(2, "Project Title"); // Replace with actual project details
            projectStmt.setInt(3, semester); // Semester
            projectStmt.setInt(4, professorId); // Professor ID
            
            projectStmt.executeUpdate(); // Execute the project insertion
            System.out.println("Project created for team ID: " + teamId);
        }
}
}






