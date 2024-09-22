package in.upes.projectmanagement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// @WebServlet("/SearchStudentServlet")
public class searchStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchQuery = request.getParameter("searchQuery");
        String searchType = request.getParameter("searchType"); // Either "sapid" or "name"

        ArrayList<Student> studentList = new ArrayList<>();

        if (searchQuery != null && !searchQuery.isEmpty()) {
            try {
                // Database credentials
                String dbURL = "jdbc:mysql://localhost:3306/your_database_name";
                String dbUser = "your_username";
                String dbPassword = "your_password";

                // Load MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                // SQL Query: Search by SAP ID or name
                String sql = "SELECT sapid, name, semester, program FROM students WHERE " +
                             (searchType.equals("sapid") ? "sapid LIKE ?" : "name LIKE ?");
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, "%" + searchQuery + "%");
                ResultSet rs = stmt.executeQuery();

                // Store the result in a list
                while (rs.next()) {
                    Student student = new Student();
                    student.setSapid(rs.getString("sapid"));
                    student.setName(rs.getString("name"));
                    student.setSemester(rs.getString("semester"));
                    student.setProgram(rs.getString("program"));
                    studentList.add(student);
                }

                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Attach the student list to the request object and forward it to the JSP page
        request.setAttribute("studentList", studentList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("createTeam.jsp");
        dispatcher.forward(request, response);
    }
}
