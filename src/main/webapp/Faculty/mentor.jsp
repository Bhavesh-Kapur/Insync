<%-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentor Project Evaluation</title>
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
            margin: 0;
            padding: 20px;
            box-sizing: border-box;
        }

        .container {
            max-width: 90%;
            margin: 50px auto;
            padding: 20px;
            background-color: var(--accent-color);
            border-radius: 8px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 2.5rem;
            color: var(--heading-color);
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: var(--accent-color);
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 15px;
            font-size: 1.1rem;
            text-align: center;
        }

        th {
            background-color: var(--secondary-color);
            font-weight: bold;
            color: var(--heading-color);
        }

        tr:hover {
            background-color: #f4f4f4;
        }

        form {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        input[type="number"] {
            padding: 8px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 60%;
            margin-right: 10px;
        }

        button {
            padding: 8px 15px;
            background-color: var(--primary-color);
            color: var(--accent-color);
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            font-size: 1rem;
        }

        button:hover {
            background-color: #3a78c1;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Mentor Project Evaluation</h1>
        <table>
            <thead>
                <tr>
                    <th>Project Name</th>
                    <th>Team ID</th>
                    <th>Enter Internal Marks</th>
                    <th>Enter Team Work Marks</th>
                    <th>Overall Project</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="project" items="${projectList}">
                    <tr>
                        <td>${project.projectName}</td>
                        <td>${project.teamId}</td>
                        <td>
                            <form action="InternalMarksServlet" method="post">
                                <input type="hidden" name="projectId" value="${project.projectId}" />
                                <input type="number" name="internalMarks" min="0" max="100" placeholder="Enter marks" required />
                                <button type="submit">Save</button>
                            </form>
                        </td>
                        <td>
                            <form action="TeamWorkMarksServlet" method="post">
                                <input type="hidden" name="projectId" value="${project.projectId}" />
                                <input type="number" name="teamWorkMarks" min="0" max="100" placeholder="Enter marks" required />
                                <button type="submit">Save</button>
                            </form>
                        </td>
                        <td>
                            <form action="OverallProjectServlet" method="post">
                                <input type="hidden" name="projectId" value="${project.projectId}" />
                                <input type="number" name="overallMarks" min="0" max="100" placeholder="Enter marks" required />
                                <button type="submit">Save</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>    
        </table>
    </div>
</body>
</html> --%>



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
        <c:forEach var="mproject" items="${mprojectList}">
            <tr>
                <td>${mproject.projectId}</td>
                <td>${mproject.projectName}</td>
                <td>${mproject.semester}</td>
                <td>
                    <button onclick="showForm('${mproject.projectId}', '${mproject.projectName}')">
                        Fill Marks
                    </button>
                </td>
            </tr>
        </c:forEach>
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

            <label for="midtermMarks">Internal Marks:</label><br>
            <input type="number" id="midtermMarks" name="midtermMarks" required min="0" max="100"><br><br>

            <label for="endtermMarks">Team Marks:</label><br>
            <input type="number" id="endtermMarks" name="endtermMarks" required min="0" max="100"><br><br>

            <label for="synopsisMarks">OverAll Marks:</label><br>
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