package in.upes.projectmanagement.Faculty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class sendMessage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int profId = (int)session.getAttribute("profid");
        int projectId = Integer.parseInt(request.getParameter("project_id"));
        String message = request.getParameter("message");

        // Establish a connection to the database
        try {
            Connection conn = databaseConnection.initializeDatabase();
            String query = "INSERT INTO project_messages (prof_id, project_id, message) VALUES (?, ?, ?)";
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setInt(1, profId);
                statement.setInt(2, projectId);
                statement.setString(3, message);
                statement.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect back to the same page or a confirmation page
        response.sendRedirect("message.jsp?status=success");
    }
}

