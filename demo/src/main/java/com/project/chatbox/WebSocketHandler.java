package com.project.chatbox;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;

@ServerEndpoint("/chat")  // The endpoint URL for WebSocket connection
public class WebSocketHandler {
    // A set to hold all connected sessions (clients)
    private static final Set<Session> clientSessions = new HashSet<>();

    // This method is called when a new WebSocket connection is opened
    @OnOpen
    public void onOpen(Session session) {
        clientSessions.add(session);
        System.out.println("New connection: " + session.getId());
    }

    // This method is called when a message is received from a client
    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("Received message: " + message);
        
        // Broadcast the message to all connected clients
        for (Session client : clientSessions) {
            if (client.isOpen() && !client.equals(session)) {  // Don't send back to the sender
                try {
                    client.getBasicRemote().sendText(message);
                } catch (IOException e) {
                    System.err.println("Error sending message to client " + client.getId() + ": " + e.getMessage());
                    e.printStackTrace();
                }
            }
        }
    }

    // This method is called when a WebSocket connection is closed
    @OnClose
    public void onClose(Session session) {
        clientSessions.remove(session);
        System.out.println("Connection closed: " + session.getId());
    }
}
