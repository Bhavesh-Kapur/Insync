<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.*, javax.servlet.http.*, javax.servlet.annotation.*" %>
<%@ page import="in.upes.projectmanagement.Faculty.PanelRequest" %>
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
        .invite-container {
            margin-top: 30px;
            text-align: left;
        }
        .invite-container h2 {
            color: #333;
        }
        .invite-container ul {
            list-style-type: none;
            padding: 0;
        }
        .invite-container li {
            padding: 10px;
            border: 1px solid #ddd;
            margin-bottom: 10px;
            background-color: #f4f4f4;
            border-radius: 5px;
        }
        .invite-container form {
            display: inline-block;
            margin-left: 10px;
        }
        .button-container button {
            padding: 10px 20px;
            font-size: 14px;
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
            <button ><a href="javascript:void(0);" onclick="mentor();">Mentor</a></button>
            <button onclick="location.href='panel.jsp'">Panel</button>
            <button onclick="location.href='activity.jsp'">Activity Coordination</button>
        </div>

        <form action="fetchPanelInvite" method="GET">
    <input type="hidden" name="profId" value="<%= session.getAttribute("profid") %>">
        <button type="submit">Fetch Requests</button>
    </form>
        <!-- Panel Invitations Section -->
        <div class="invite-container">
            <h2>Panel Invitations</h2>
            <%
                List<PanelRequest> panelInvites = (List<PanelRequest>) request.getAttribute("panelInvites");
                if (panelInvites != null && !panelInvites.isEmpty()) {
            %>
                <ul>
                    <% for (PanelRequest requestEntry : panelInvites) { %>
                        <li>
                            <strong>Invite ID:</strong> <%= requestEntry.getRequestId() %><br>
                            <strong>Sent By:</strong> <%= requestEntry.getTeamName() %><br>
                            <form action="handlePanelInvite" method="POST" style="display:inline;">
                                <input type="hidden" name="inviteId" value="<%= requestEntry.getRequestId() %>">
                                <button type="submit" name="action" value="accept">Accept</button>
                                <button type="submit" name="action" value="reject">Reject</button>
                            </form>
                        </li>
                    <% } %>
                </ul>
            <% 
                } else { 
            %>
                <p>No panel invites available.</p>
            <% } %>
        </div>

        <!-- Mentor Invitations Section -->
        <div class="invite-container">
            <h2>Mentor Invitations</h2>
            <%
                List<PanelRequest> mentorInvites = (List<PanelRequest>) request.getAttribute("mentorInvites");
                if (mentorInvites != null && !mentorInvites.isEmpty()) {
            %>
                <ul>
                    <% for (PanelRequest requestEntry : mentorInvites) { %>
                        <li>
                            <strong>Team Name:</strong> <%= requestEntry.getTeamName() %> 
                            (<strong>Team ID:</strong> <%= requestEntry.getTeamId() %>)<br>
                            <strong>Request ID:</strong> <%= requestEntry.getRequestId() %><br>
                            <form action="handleMentorInvite" method="POST" style="display:inline;">
                                <input type="hidden" name="inviteId" value="<%= requestEntry.getRequestId() %>">
                                <button type="submit" name="action" value="accept">Accept</button>
                                <button type="submit" name="action" value="reject">Reject</button>
                            </form>
                        </li>
                    <% } %>
                </ul>
            <% 
                } else { 
            %>
                <p>No mentor invites available.</p>
            <% } %>
        </div>

        <!-- Logout Section -->
        <a href="logout" class="logout-button">Logout</a>
    </div>


    <% 
    String message = request.getParameter("message");
    String error = request.getParameter("error");

    if (message != null) {
%>
        <div style="color: green; margin: 10px 0; font-weight: bold;">
            <%= message %>
        </div>
<% 
    } else if (error != null) { 
%>
        <div style="color: red; margin: 10px 0; font-weight: bold;">
            <%= error %>
        </div>
<% 
    } 
%>
</body>

<script>
function mentor() {
    const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 1)); // Gets your context path
    const url = contextPath + "/mentorProject";   
    window.location.href = url;
}
</script>
</html>