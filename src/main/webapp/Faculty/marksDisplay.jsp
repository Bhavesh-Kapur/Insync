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
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #eaf4fc;
            --text-color: #333333;
            --heading-color: #0a0a0a;
            --table-header-bg: #d6e9f8;
            --table-border: #b3d1f0;
            --table-row-hover: #f2f9ff;
            --box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            --border-radius: 8px;
        }

        body {
            font-family: "Poppins", sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--secondary-color);
            color: var(--text-color);
            line-height: 1.6;
        }

        h1 {
            text-align: center;
            color: #000; /* Black color for the title */
            font-weight: bold;
            font-size: 3em; /* Increased font size */
            margin-top: 30px;
        }

        h2 {
            text-align: center;
            color: var(--primary-color);
            font-weight: bold;
            font-size: 2em;
            margin: 40px 0 20px; /* Added more spacing for visibility */
        }

        table {
            width: 90%;
            margin: 30px auto; /* Increased margin for spacing */
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: var(--box-shadow);
            border-radius: var(--border-radius);
            overflow: hidden;
        }

        thead {
            background-color: var(--table-header-bg);
        }

        th, td {
            padding: 12px 20px;
            text-align: left;
            border: 1px solid var(--table-border);
        }

        th {
            color: var(--heading-color);
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9fcff;
        }

        tr:hover {
            background-color: var(--table-row-hover);
        }
    </style>
</head>
<body>
    <h1>Project Marks</h1>

    <!-- Mentor Marks Table -->
    <h2>Mentor Marks</h2>
    <table>
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
                if (mentorMarksList != null) {
                    for (MentorMarks mentorMarks : mentorMarksList) {
            %>
            <tr>
                <td><%= mentorMarks.getTeamId() %></td>
                <td><%= mentorMarks.getSynopsisMarks() %></td>
                <td><%= mentorMarks.getMidMarks() %></td>
                <td><%= mentorMarks.getEndMarks() %></td>
            </tr>
            <% 
                    }
                } else { 
            %>
            <tr>
                <td colspan="4">No Mentor Marks Available</td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <!-- Panel Marks Table -->
    <h2>Panel Marks</h2>
    <table>
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
                if (panelMarksList != null) {
                    for (PanelMarks panelMarks : panelMarksList) {
            %>
            <tr>
                <td><%= panelMarks.getTeamId() %></td>
                <td><%= panelMarks.getSynopsisMarks() %></td>
                <td><%= panelMarks.getMidMarks() %></td>
                <td><%= panelMarks.getEndMarks() %></td>
            </tr>
            <% 
                    }
                } else { 
            %>
            <tr>
                <td colspan="4">No Panel Marks Available</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
