package in.upes.projectmanagement.Student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.IOException;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sapId = request.getParameter("sapId");
        String password = request.getParameter("password");

        try {
            Connection con = databaseConnection.initializeDatabase();

            String sql = "SELECT * FROM student WHERE sapid = ? AND password = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, sapId);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                String program = rs.getString("program");
                int sapid = rs.getInt("sapid");
                int semester = rs.getInt("semester");
                // Login successful
                HttpSession session = request.getSession();
                session.setAttribute("name", name);
                session.setAttribute("program", program);
                session.setAttribute("sapid", sapid);
                session.setAttribute("semester", semester);
                response.sendRedirect("dashboard.jsp"); // Redirect to a welcome page
                
            } else {
                // Login failed
                response.sendRedirect("index.jsp?error=1"); // Redirect back to login with error
            }

            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=1"); // Redirect back to login with error
        }
    }
}
