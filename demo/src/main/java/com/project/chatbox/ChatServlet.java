package com.project.chatbox;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// This servlet is mapped to the URL pattern /ChatServlet
@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet {
    private ChatDAO chatDAO;

    @Override
    public void init() {
        chatDAO = new ChatDAO();  // Ensure this line is uncommented if ChatDAO is needed
    }

    // Handle POST requests
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String userId = request.getParameter("userId");
        String teamId = request.getParameter("teamId");
        String message = request.getParameter("message");

        // Send the message using the NetworkHandler
        NetworkHandler networkHandler = new NetworkHandler();  // Ensure NetworkHandler is properly initialized
        networkHandler.sendUdpMessage(message, "127.0.0.1");  // Replace with actual host/IP if needed

        // Optionally, forward or redirect to a different page
        response.getWriter().write("Message sent successfully.");
    }
}
