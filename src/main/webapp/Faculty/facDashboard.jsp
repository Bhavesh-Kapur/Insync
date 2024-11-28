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
            justify-content: flex-start;
            align-items: flex-start;
            padding: 20px;
        }
        .dashboard-container {
            display: flex;
            flex-direction: row;
            width: 100%;
        }
        .left-section {
            width: 30%;
            padding-right: 20px;
        }
        .details-section {
            margin-bottom: 20px;
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
            flex-direction: column;
            gap: 10px;
        }
        .button-container .square-div {
            width: 70%;
            height: 120px;
            display: flex;
            justify-content: center;
            align-items: center ;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            background-color: #87CEFA; 
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s;
            /* text-align: ; */
        }
        .button-container .square-div:hover {
            background-color: #5cacee; 
        }
        .right-section {
            flex: 1;
        }
        .fetch-request-button {
            width: 80%;
            padding: 15px;
            font-size: 16px;
            cursor: pointer;
            background-color: #87CEFA; 
            color: white;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s;
            margin-bottom: 20px;
        }
        .fetch-request-button:hover {
            background-color: #5cacee;
        }
        .invite-container {
            margin-bottom: 20px;
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
        .logout-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #ff6347; 
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .logout-button:hover {
            background-color: #e5533d;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">

        <div class="left-section">

            <div class="details-section">
                <h2>Welcome, <%= session.getAttribute("name") %>!</h2>
                <p><strong>Program:</strong> <%= session.getAttribute("program") %></p>
                <p><strong>Professor ID:</strong> <%= session.getAttribute("profid") %></p>
            </div>

            
            <div class="button-container">
                <!-- <div class="square-div" onclick="mentor()">Mentor</div> -->
                <div class="square-div" onclick="location.href='mentor_dashboard.jsp'">Mentor</div>
                <div class="square-div" onclick="location.href='panel_dashboard.jsp'">Panel</div>
                <div class="square-div" onclick="location.href='activity.jsp'">Activity Coordinator</div>
            </div>
        </div>

        
        <div class="right-section">
            
            <form action="fetchPanelInvite" method="GET">
                <input type="hidden" name="profId" value="<%= session.getAttribute("profid") %>">
                <button type="submit" class="fetch-request-button">Fetch Requests</button>
            </form>

            
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
                                <form action="HandleMentorInvite" method="POST" style="display:inline;">
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
        </div>
    </div>

    
    <a href="logout" class="logout-button">Logout</a>

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
<!-- <script>
function mentor() {
    const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 1)); 
    const url = contextPath + "/mentorProject";   
    window.location.href = url;
}
</script> -->
</body>
</html>
