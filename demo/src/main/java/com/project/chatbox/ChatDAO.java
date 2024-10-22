package com.project.chatbox;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ChatDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/yourDatabaseName";  // Replace with your DB URL
    private String jdbcUsername = "root";  // Replace with your DB username
    private String jdbcPassword = "password";  // Replace with your DB password
    private NetworkHandler networkHandler;

    public ChatDAO() {
        try {
            // Initialize NetworkHandler for UDP communication
            networkHandler = new NetworkHandler();  // Using UDP
        } catch (IOException e) {
            System.err.println("Failed to initialize NetworkHandler: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Method to save a message to the database
    public void saveMessageToDB(Message message) {
        String INSERT_MESSAGE_SQL = "INSERT INTO ChatMessages (userId, teamId, message) VALUES (?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MESSAGE_SQL)) {

            preparedStatement.setString(1, message.getUserId());
            preparedStatement.setString(2, message.getTeamId());
            preparedStatement.setString(3, message.getMessage());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("SQL Exception while saving message to DB: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Method to send a message using UDP
    public void sendMessageUDP(Message message, String host) {
        try {
            String formattedMessage = String.format("UserID: %s, TeamID: %s, Message: %s",
                    message.getUserId(), message.getTeamId(), message.getMessage());
            networkHandler.sendUdpMessage(formattedMessage, host);
            // Save message to the database after sending it
            saveMessageToDB(message);
        } catch (IOException e) {
            System.err.println("Failed to send message via UDP: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Method to send a message using TCP
    public void sendMessageTCP(Message message, String host) {
        try {
            String formattedMessage = String.format("UserID: %s, TeamID: %s, Message: %s",
                    message.getUserId(), message.getTeamId(), message.getMessage());
            networkHandler.sendTcpMessage(formattedMessage);
            // Save message to the database after sending it
            saveMessageToDB(message);
        } catch (Exception e) {
            System.err.println("Failed to send message via TCP: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Method to send a message via WebSocket
    public void sendMessageWebSocket(Message message) throws IOException {
        String formattedMessage = String.format("UserID: %s, TeamID: %s, Message: %s",
                message.getUserId(), message.getTeamId(), message.getMessage());

        // Assuming you have a way to send the message to WebSocket clients
        // Create an instance of ChatWebSocket (consider using a singleton pattern)
        ChatWebSocket chatWebSocket = new ChatWebSocket();
        chatWebSocket.sendMessage(message.getMessage());
    }

    // Method to retrieve all messages for a given user and team from the database
    public List<Message> getMessages(String userId, String teamId) {
        List<Message> messages = new ArrayList<>();
        String SELECT_MESSAGES_SQL = "SELECT * FROM ChatMessages WHERE userId = ? AND teamId = ?";

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MESSAGES_SQL)) {

            preparedStatement.setString(1, userId);
            preparedStatement.setString(2, teamId);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Message message = new Message(
                        resultSet.getString("userId"),
                        resultSet.getString("teamId"),
                        resultSet.getString("message")
                );
                messages.add(message);
            }
        } catch (SQLException e) {
            System.err.println("SQL Exception while retrieving messages: " + e.getMessage());
            e.printStackTrace();
        }

        return messages;
    }
}
