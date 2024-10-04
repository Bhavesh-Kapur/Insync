package com.project.chatbox;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.Socket;
import java.net.SocketException;

public class NetworkHandler {
    private DatagramSocket udpSocket;
    private Socket tcpSocket;
    private BufferedReader input;
    private PrintWriter output;
    private static final int PORT = 12345;  // Change to desired port

    // Constructor for UDP
    public NetworkHandler() throws SocketException {
        udpSocket = new DatagramSocket(PORT);
    }

    // Constructor for TCP
    public NetworkHandler(String host) throws IOException {
        tcpSocket = new Socket(host, PORT);
        input = new BufferedReader(new InputStreamReader(tcpSocket.getInputStream()));
        output = new PrintWriter(tcpSocket.getOutputStream(), true);
    }

    // Method to send message via UDP
    public void sendUdpMessage(String message, String host) throws IOException {
        byte[] buffer = message.getBytes();
        InetAddress address = InetAddress.getByName(host);
        DatagramPacket packet = new DatagramPacket(buffer, buffer.length, address, PORT);
        udpSocket.send(packet);
    }

    // Method to receive message via UDP
    public String receiveUdpMessage() throws IOException {
        byte[] buffer = new byte[1024];
        DatagramPacket packet = new DatagramPacket(buffer, buffer.length);
        udpSocket.receive(packet);
        return new String(packet.getData(), 0, packet.getLength());
    }

    // Method to send message via TCP
    public void sendTcpMessage(String message) {
        output.println(message);
    }

    // Method to receive message via TCP
    public String receiveTcpMessage() throws IOException {
        return input.readLine();
    }

    // Close the UDP/TCP socket
    public void close() throws IOException {
        if (udpSocket != null && !udpSocket.isClosed()) {
            udpSocket.close();
        }
        if (tcpSocket != null && !tcpSocket.isClosed()) {
            tcpSocket.close();
        }
    }
}
