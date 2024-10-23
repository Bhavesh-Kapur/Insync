package com.project.chatbox;

import java.io.IOException;
import java.net.URI;

import jakarta.websocket.ClientEndpoint;
import jakarta.websocket.ContainerProvider;
import jakarta.websocket.DeploymentException;
import jakarta.websocket.OnMessage;
import jakarta.websocket.WebSocketContainer;

@ClientEndpoint
public class ChatClientReceive {

    public static void main(String[] args) {
        WebSocketContainer container = ContainerProvider.getWebSocketContainer();
        String uri = "ws://localhost:8080/chat";
        try {
            container.connectToServer(ChatClientReceive.class, new URI(uri));
            System.out.println("Connected to the chat. Waiting for messages...");
            // Keep the client running
            synchronized (ChatClientReceive.class) {
                ChatClientReceive.class.wait();
            }
        } catch (DeploymentException | IOException e) {
            // Handle specific exceptions separately
            System.err.println("Error during WebSocket connection: " + e.getMessage());
        } catch (InterruptedException e) {
            // Handle interruption gracefully
            Thread.currentThread().interrupt();
            System.err.println("Thread was interrupted: " + e.getMessage());
        } catch (Exception e) {
            // Catch any other unexpected exceptions
            System.err.println("An unexpected error occurred: " + e.getMessage());
        }
    }

    @OnMessage
    public void onMessage(String message) {
        System.out.println("New message: " + message);
    }
}
