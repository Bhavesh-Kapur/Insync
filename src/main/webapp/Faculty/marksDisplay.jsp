<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="in.upes.projectmanagement.Faculty.PanelMarks" %>
<%@ page import="in.upes.projectmanagement.Faculty.MentorMarks" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Marks Display</title>
</head>
<body>
    <h1>Project Marks</h1>

    <!-- Mentor Marks Table -->
    <h2>Mentor Marks</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Team ID</th>
                <th>Synopsis Marks</th>
                <th>Mid Marks</th>
                <th>End Marks</th>
            </tr>
        </thead>
        <tbody>
            <%
                ArrayList<MentorMarks> mentorMarksList = (ArrayList<MentorMarks>) request.getAttribute("mentorMarksList");
                for (MentorMarks mentorMarks : mentorMarksList) {
            %>
            <tr>
                <td><%= mentorMarks.getTeamId() %></td>
                <td><%= mentorMarks.getSynopsisMarks() %></td>
                <td><%= mentorMarks.getMidMarks() %></td>
                <td><%= mentorMarks.getEndMarks() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <!-- Panel Marks Table -->
    <h2>Panel Marks</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Team ID</th>
                <th>Synopsis Marks</th>
                <th>Mid Marks</th>
                <th>End Marks</th>
            </tr>
        </thead>
        <tbody>
            <%
                ArrayList<PanelMarks> panelMarksList = (ArrayList<PanelMarks>) request.getAttribute("panelMarksList");
                for (PanelMarks panelMarks : panelMarksList) {
            %>
            <tr>
                <td><%= panelMarks.getTeamId() %></td>
                <td><%= panelMarks.getSynopsisMarks() %></td>
                <td><%= panelMarks.getMidMarks() %></td>
                <td><%= panelMarks.getEndMarks() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>