<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, in.upes.projectmanagement.Faculty.mProject" %>
<html>
<head>
    <title>Mentor Projects</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        a, button {
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
            background: none;
            border: none;
            cursor: pointer;
        }
        a:hover, button:hover {
            color: #0056b3;
        }
        .hidden {
            display: none;
        }
        .form-container {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            background-color: #ffffff;
        }
        .message {
            font-size: 16px;
            color: green;
        }
        .error {
            font-size: 16px;
            color: red;
        }
    </style>
    <script>
        function showForm(projectId, projectName) {
            document.getElementById("projectForm").classList.remove("hidden");
            document.getElementById("selectedProjectId").value = projectId;
            document.getElementById("selectedProjectName").innerText = projectName;
            document.getElementById("selectedProjectIdSpan").innerText = projectId;
        }
    </script>
</head>
<body>
    <h1>Your Assigned Projects</h1>

    <!-- Display success or error messages -->
    <%
        String successMessage = (String) request.getAttribute("successMessage");
        String errorMessage = (String) request.getAttribute("errorMessage");

        if (successMessage != null) {
    %>
        <p class="message"><%= successMessage %></p>
    <%
        }
        if (errorMessage != null) {
    %>
        <p class="error"><%= errorMessage %></p>
    <%
        }
    %>

    <!-- Display the list of projects -->
    <%
        List<mProject> mprojectList = (List<mProject>) request.getAttribute("mprojectList");
        if (mprojectList != null && !mprojectList.isEmpty()) {
    %>
    <table>
        <thead>
            <tr>
                <th>Project ID</th>
                <th>Project Name</th>
                <th>Semester</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (mProject mproject : mprojectList) {
        %>
            <tr>
                <td><%= mproject.getProjectId() %></td>
                <td><%= mproject.getProjectName() %></td>
                <td><%= mproject.getSemester() %></td>
                <td>
                    <!-- Button to show form for this project -->
                    <button onclick="showForm('<%= mproject.getProjectId() %>', '<%= mproject.getProjectName() %>')">
                        Fill Marks
                    </button>
                </td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <%
        } else {
    %>
        <p>No projects have been assigned to you as a mentor.</p>
    <%
        }
    %>

    <div id="projectForm" class="form-container hidden">
        <h2>Fill Marks for Project: <span id="selectedProjectName"></span><span id="selectedProjectIdSpan"></span></h2>
        <form method="post" action="processMarks">
            <input type="hidden" id="selectedProjectId" name="selectedProjectId" />

            <label for="midtermMarks">Midterm Marks:</label><br>
            <input type="number" id="midtermMarks" name="midtermMarks" required min="0" max="100"><br><br>

            <label for="endtermMarks">Endterm Marks:</label><br>
            <input type="number" id="endtermMarks" name="endtermMarks" required min="0" max="100"><br><br>

            <label for="synopsisMarks">Synopsis Marks:</label><br>
            <input type="number" id="synopsisMarks" name="synopsisMarks" required min="0" max="100"><br><br>

            <input type="submit" value="Submit Marks">
        </form>
    </div>

  <%
    // Show success message using session attribute
    String popupMessage = (String) session.getAttribute("popupMessage");
    if (popupMessage != null) {
        session.removeAttribute("popupMessage"); // Remove the attribute after reading
        out.println("<script>alert('" + popupMessage + "');</script>");
    }
%>

<form action="mentorProject" method="GET">
    <input type="hidden" name="profId" value="<%= session.getAttribute("profid") %>">
    <button type="submit">Fetch</button>
</form>

<script>
    // Show a popup only if a message is present in session and then remove it
    window.onload = function () {
        var popupMessage = '<%= popupMessage %>';
        if (popupMessage) {
            alert(popupMessage); // Display as a popup
        }
    };
</script>

</body>
</html>