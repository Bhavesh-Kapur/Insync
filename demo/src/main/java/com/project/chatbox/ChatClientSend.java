package com.project.chatbox;

import java.net.URI;
import java.util.Scanner;

import jakarta.websocket.ContainerProvider;
import jakarta.websocket.Session;
import jakarta.websocket.WebSocketContainer;

public class ChatClientSend {

    public static void main(String[] args) {
        WebSocketContainer container = ContainerProvider.getWebSocketContainer();
        String uri = "ws://localhost:8080/chat";
        try {
            Session session = container.connectToServer(ChatWebSocket.class, new URI(uri));
            Scanner scanner = new Scanner(System.in);

            System.out.println("You are connected to the chat. Type your message:");

            while (true) {
                String message = scanner.nextLine();
                session.getBasicRemote().sendText(message); // Send message to WebSocket
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
