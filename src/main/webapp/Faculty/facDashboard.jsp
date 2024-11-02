<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.*, javax.servlet.http.*, javax.servlet.annotation.*" %>

<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Faculty Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 50px;
        }
        .dashboard-container {
            width: 80%;
            max-width: 600px;
            text-align: center;
        }
        .details-section {
            margin-bottom: 30px;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .details-section h2 {
            margin-top: 0;
        }
        .details-section p {
            font-size: 16px;
            color: #555;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
        }
        .button-container button {
            width: 30%;
            padding: 20px;
            font-size: 18px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .button-container button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <!-- Details Section -->
        <div class="details-section">
            <h2>Welcome, <%= session.getAttribute("name") %>!</h2>
            <p><strong>Program:</strong> <%= session.getAttribute("program") %></p>
            <p><strong>Professor ID:</strong> <%= session.getAttribute("profid") %></p>
        </div>
        
        <!-- Button Section -->
        <div class="button-container">
            <button onclick="location.href='mentor.jsp'">Mentor</button>
            <button onclick="location.href='panel.jsp'">Panel</button>
            <button onclick="location.href='activity.jsp'">Activity Coordination</button>
        </div>
          <%-- <form action="<%= request.getContextPath() %>/LogoutServlet" method="post">
            <button type="submit" class="logout-button">Logout</button>
        </form> --%>
        <a href="logout" class="logout-button">Logout</a>
    </div>
</body>
</html>
