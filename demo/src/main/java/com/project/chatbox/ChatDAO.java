package com.project.chatbox;

import java.io.IOException;

public class ChatDAO {
    private NetworkHandler networkHandler;

    public ChatDAO() {
        try {
            networkHandler = new NetworkHandler();  // Using UDP
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Method to send a message using UDP
    public void sendMessageUDP(Message message, String host) {
        try {
            String formattedMessage = String.format("UserID: %s, TeamID: %s, Message: %s",
                    message.getUserId(), message.getTeamId(), message.getMessage());
            networkHandler.sendUdpMessage(formattedMessage, host);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Method to send a message using TCP
    public void sendMessageTCP(Message message, String host) {
        try {
            String formattedMessage = String.format("UserID: %s, TeamID: %s, Message: %s",
                    message.getUserId(), message.getTeamId(), message.getMessage());
            networkHandler.sendTcpMessage(formattedMessage);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Other database-related methods can stay here
}
