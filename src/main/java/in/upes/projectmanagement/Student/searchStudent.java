package in.upes.projectmanagement.Student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class searchStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchPrms = request.getParameter("searchPrms");

        try {
            // Database connection
            Connection con = databaseConnection.initializeDatabase();
            PreparedStatement ps = null;
            System.out.println(searchPrms);
            // Prepare the SQL query to search for the student by SAP ID
            if (searchPrms.trim().matches("\\d+"))  {
                String sapId = searchPrms; 
                String query = "SELECT sapid, name, semester, program FROM student WHERE sapid = ?";
                ps = con.prepareStatement(query);
                ps.setString(1, sapId);
            }else{
                System.out.println(searchPrms);
                String name = searchPrms;
                String query = "SELECT sapid, name, semester, program FROM student WHERE name = ?";
                ps = con.prepareStatement(query);   
                ps.setString(1, name);
            }
            
            // Execute the query
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                // Retrieve the student details
                String name = rs.getString("name");
                String program = rs.getString("program");
                int semester = rs.getInt("semester");
                int sap = rs.getInt("sapid");

            //     String studentDetails =
            //     "<tbody >"+
            //     "<tr>"+
            //         "<th>1</th>"+
            //         "<th>"+ name + "</th>"+
            //         "<th>"+ program +"</th>"+
            //         "<th>"+ sap + "</th>"+
            //         "<th>"+ semester+ "</th>"+
            //     "</tr>"+
            //     // <!-- Student rows will be dynamically added here -->
            // "</tbody>";
                


            request.setAttribute("name", name);
            request.setAttribute("program", program);
            request.setAttribute("semester", semester);
            request.setAttribute("sapid", sap);



                // // Format the details into an HTML string
                // String studentDetails = 
                //     "<p><strong>Name:</strong> " + name + "</p>" +
                //     "<p><strong>Program:</strong> " + program + "</p>" +
                //     "<p><strong>SAPID:</strong> " + sap + "</p>" +
                //     "<p><strong>Semester:</strong> " + semester + "</p>";

                // Set the student details as an attribute for the JSP to display
                // request.setAttribute("studentDetails", studentDetails);


                RequestDispatcher dispatcher = request.getRequestDispatcher("searchStudent.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("errorMessage", "No student found with SAP ID: " + searchPrms);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while searching for the student.");
        }

        // Forward the request back to the JSP page to display the results
        request.getRequestDispatcher("searchStudent.jsp").forward(request, response);
    }
}