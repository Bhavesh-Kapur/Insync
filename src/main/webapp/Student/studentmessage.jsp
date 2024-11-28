<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, in.upes.projectmanagement.Student.Message" %>
<html>
<head>
    <title>Messages for Project</title>
</head>
<body>
    <h2>Messages for Project</h2>

    <table border="1">
        <thead>
            <tr>
                <th>Professor ID</th>
                <th>Message</th>
                <th>Timestamp</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Message> messages = (List<Message>) request.getAttribute("messages");
                if (messages != null && !messages.isEmpty()) {
                    for (Message msg : messages) {
            %>
                <tr>
                    <td><%= msg.getProfId() %></td>
                    <td><%= msg.getMessage() %></td>
                    <td><%= msg.getTimestamp() %></td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="3">No messages available</td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>