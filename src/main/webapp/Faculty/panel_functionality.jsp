<!DOCTYPE html>
<html>
<head>
    <title>Panel - Team Notifications</title>
    <style>
    </style>
</head>
<body>
    <h1 style="text-align: center;">Call Teams for Evaluation</h1>
    <c:if test="${not empty message}">
        <p style="color: green; text-align: center;">${message}</p>
    </c:if>
    <table>
        <thead>
            <tr>
                <th>Team Name</th>
                <th>Mentor Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty teamList}">
                    <c:forEach var="team" items="${teamList}">
                        <tr>
                            <td>${team.teamName}</td>
                            <td>${team.mentorName}</td>
                            <td>
                                <form action="PanelServlet" method="post">
                                    <input type="hidden" name="teamId" value="${team.teamId}" />
                                    <textarea name="notificationText" placeholder="Enter meeting details" required></textarea><br>
                                    <label for="meetingTime">Meeting Time:</label>
                                    <input type="datetime-local" name="meetingTime" required /><br>
                                    <button type="submit">Send Notification</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="3" style="text-align: center;">No teams assigned</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</body>
</html>
