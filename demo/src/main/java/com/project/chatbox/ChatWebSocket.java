package com.project.chatbox;

import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;

@ServerEndpoint("/chat")  // This defines the WebSocket URL for clients to connect to
public class ChatWebSocket {
    private Session session;
    private static final Set<ChatWebSocket> chatEndpoints = new CopyOnWriteArraySet<>(); // Made final

    // Called when a new WebSocket connection is established
    @OnOpen
    public void onOpen(Session session) {
        this.session = session;
        chatEndpoints.add(this);
        System.out.println("New connection opened: " + session.getId());
    }

    // Called when a WebSocket message is received
    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("Received message: " + message + " from session: " + session.getId());
        broadcast(message);
    }

    // Called when a WebSocket connection is closed
    @OnClose
    public void onClose(Session session) {
        chatEndpoints.remove(this);
        System.out.println("Connection closed: " + session.getId());
    }

    // Called when an error occurs on the WebSocket connection
    @OnError
    public void onError(Session session, Throwable throwable) {
        System.err.println("Error on session: " + session.getId() + " - " + throwable.getMessage());
        // Instead of printStackTrace, we can log the error with more context
        throwable.printStackTrace();
    }

    // Broadcast a message to all connected WebSocket clients
    private static void broadcast(String message) {
        for (ChatWebSocket endpoint : chatEndpoints) {
            synchronized (endpoint) {
                try {
                    endpoint.session.getBasicRemote().sendText(message);
                } catch (IOException e) {
                    System.err.println("Error sending message to session: " + endpoint.session.getId() + " - " + e.getMessage());
                    e.printStackTrace(); // You can keep this for more detailed logging
                }
            }
        }
    }

    // New sendMessage method to send message to this specific WebSocket session
    public void sendMessage(String message) {
        try {
            // Send message to this session
            this.session.getBasicRemote().sendText(message);
            System.out.println("Sent message: " + message + " to session: " + session.getId());
        } catch (IOException e) {
            System.err.println("Error sending message to session: " + session.getId() + " - " + e.getMessage());
            e.printStackTrace(); // You can keep this for more detailed logging
        }
    }
}
