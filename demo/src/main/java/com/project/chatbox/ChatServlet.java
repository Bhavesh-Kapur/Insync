package com.project.chatbox;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet {
    private final ChatDAO chatDAO = new ChatDAO(); // Make ChatDAO final

    @Override
    public void init() {
        // Additional initialization logic if needed
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve parameters from the request
        String userId = request.getParameter("userId");
        String teamId = request.getParameter("teamId");
        String message = request.getParameter("message");
        String host = "127.0.0.1"; // or obtain it dynamically as needed

        // Validate parameters
        if (userId == null || teamId == null || message == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Invalid input parameters.");
            return;
        }

        // Save the message to the database
        Message newMessage = new Message(userId, teamId, message);
        chatDAO.saveMessageToDB(newMessage);

        // Send the message using UDP
        chatDAO.sendMessageUDP(newMessage, host);

        // Send the message using TCP
        chatDAO.sendMessageTCP(newMessage, host);

        // Send the message using WebSocket
        try {
            chatDAO.sendMessageWebSocket(newMessage);
        } catch (IOException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Failed to send message via WebSocket.");
            return;
        }

        // Respond to the client
        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().write("Message saved and sent successfully.");
    }
}
