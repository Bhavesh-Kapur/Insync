<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<% 
    // Check if the session is valid
    if (session == null || session.getAttribute("sapid") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get the statusMap from the request
    HashMap<String, ArrayList<String>> statusMap = (HashMap<String, ArrayList<String>>) request.getAttribute("statusMap");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invite Status</title>
</head>
<body>
    <h1>Invite Status</h1>

    <!-- Check if the statusMap is not null -->
    <% if (statusMap != null) { %>

        <!-- Accepted Members -->
        <h2>Accepted Members</h2>
        <ul>
            <% 
                if (statusMap.get("accepted").isEmpty()) { 
            %>
                <li>No accepted invites.</li>
            <% 
                } else { 
                    for (String member : statusMap.get("accepted")) { 
            %>
                <li><%= member %></li>
            <% 
                    } 
                } 
            %>
        </ul>
        <!-- Pending Members -->
        <h2>Pending Members</h2>
        <ul>
            <% 
                if (statusMap.get("pending").isEmpty()) { 
            %>
                <li>No pending invites.</li>
            <% 
                } else { 
                    for (String member : statusMap.get("pending")) { 
            %>
                <li><%= member %></li>
            <% 
                    } 
                } 
            %>
        </ul>

        <!-- Rejected Members -->
        <h2>Rejected Members</h2>
        <ul>
            <% 
                if (statusMap.get("rejected").isEmpty()) { 
            %>
                <li>No rejected invites.</li>
            <% 
                } else { 
                    for (String member : statusMap.get("rejected")) { 
            %>
                <li><%= member %></li>
            <% 
                    } 
                } 
            %>
        </ul>

    <% } else { %>
        <p>No invite data available.</p>
    <% } %>

</body>
</html>