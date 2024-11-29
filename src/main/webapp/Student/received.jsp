<%@page contentType="text/html" pageEncoding="UTF-8"  import ="in.upes.projectmanagement.Student.Invite" import ="java.util.List" import ="java.util.ArrayList"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invite Management</title>
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #d6e9f8;
            --accent-color: #ffffff;
            --background-gradient: linear-gradient(135deg, #d6e9f8, #ffffff);
            --heading-color: #0a0a0a;
            --text-color: #333333;
        }

        body {
            font-family: "Poppins", sans-serif;
            background: var(--background-gradient);
            display: flex;
            height: 100vh;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .sidebar {
            width: 250px;
            position: fixed;
            height: 100%;
            background-color: var(--accent-color);
            border-right: 1px solid #ddd;
            display: flex;
            flex-direction: column;
            justify-content: flex-start; /* Align items at the top */
            align-items: center; /* Center horizontally */
            padding-top: 20px; /* Add spacing at the top */
        }

        .sidebar .redirect-icon {
            margin-bottom: 353px;
          
        }

        .sidebar .message-button {
            margin-top: 76px;
            margin-left: 402px;/* Add space between the icon and button */
        }

        .sidebar .message-button button {
            padding: 10px 20px;
            font-size: 1rem;
            border: none;
            border-radius: 5px;
            background-color: var(--primary-color);
            color: white;
            cursor: pointer;
        }

        .sidebar .message-button button:hover {
            opacity: 0.9;
        }

        .main-content {
            margin-left: 280px;
            padding-top: 80px;
        }

        .status-section {
            margin-bottom: 30px;
        }

        .status-section h2 {
            margin-bottom: 10px;
        }

        .status-section div {
            margin-top: 20px;
        }

        .invite-list {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .invite-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .invite-item div {
            font-size: 1.1rem;
        }

        .invite-item .actions {
            display: flex;
            gap: 10px;
        }

        .invite-item button {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.9rem;
        }

        .invite-item .accept {
            background-color: #28a745;
            color: white;
        }

        .invite-item .reject {
            background-color: #dc3545;
            color: white;
        }

        .invite-item button:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>

    <!-- Sidebar with redirect icon -->
    <div class="sidebar">
        <div class="redirect-icon">
            <a href="dashboard.jsp">
                <img src="https://img.icons8.com/ios-glyphs/30/000000/home.png" alt="Dashboard Icon" title="Go to Dashboard">
            </a>
        </div>

        <!-- Messages button -->
        <div class="message-button">
            <form action="ViewMessagesServlet" method="GET">
                <button type="submit">Messages</button>
            </form>
        </div>
    </div>
   
    <div class="main-content">
        <div class="status-section">
            <h2>Invites Received</h2>
            <div>You have invite requests from the following people:</div>
            <ol class="invite-list">
<%
                List<String> pendingInvitations = (List<String>) request.getAttribute("pendingInvitations");
                if (pendingInvitations != null && !pendingInvitations.isEmpty()) {
                    for (String invitedBy : pendingInvitations) {
            %>
                <li class="invite-item">
                    <div><%= invitedBy %></div>
                    <div class="actions">
                        <form action="handleInvite" method="POST">
                            <input type="hidden" name="invitedBy" value="<%= invitedBy %>">
                            <button type="submit" name="action" value="Accept" class="accept">Accept</button>
                            <button type="submit" name="action" value="Reject" class="reject">Reject</button>
                        </form>
                    </div>
                </li>
            <%
                    }
                } else {
            %>
                <div>No pending invitations at this time.</div>
            <%
                }
            %>
            </ol>
        </div>
    </div>
</body>
</html>