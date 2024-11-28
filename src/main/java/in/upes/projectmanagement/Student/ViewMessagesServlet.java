package in.upes.projectmanagement.Student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.google.protobuf.Timestamp;

import in.upes.projectmanagement.Faculty.sendMessage;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


    public class ViewMessagesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the project_id from the request
        HttpSession session = request.getSession();
        int sapid = (int)session.getAttribute("sapid");

        // Query to fetch messages for the given project_id
        List<Message> messages = new ArrayList<>();
        try {
            Connection conn = databaseConnection.initializeDatabase();
            String query = "SELECT * FROM project_messages ";
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    int profId = resultSet.getInt("prof_id");
                    System.out.println(profId);
                    String message = resultSet.getString("message");
                    java.sql.Timestamp timestamp = resultSet.getTimestamp("timestamp");
                    messages.add(new Message(profId, message, timestamp));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set messages as a request attribute and forward to the JSP
        request.setAttribute("messages", messages);
        RequestDispatcher dispatcher = request.getRequestDispatcher("studentmessage.jsp");
        dispatcher.forward(request, response);
    }

    // Inner class to represent the message
    
}

