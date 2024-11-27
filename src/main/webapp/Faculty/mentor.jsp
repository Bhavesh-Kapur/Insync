<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, in.upes.projectmanagement.Faculty.mProject, jakarta.servlet.http.HttpServletRequest" %>
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
        a {
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
        }
        a:hover {
            color: #0056b3;
        }
        #fillMarksSection {
            display: none;
            margin-top: 20px;
            border: 1px solid #ddd;
            padding: 15px;
            background-color: #fff;
        }
        #fillMarksSection h2 {
            color: #007BFF;
        }
        .close-btn {
            color: red;
            cursor: pointer;
        }
    </style>
    <script>
        // Function to toggle visibility of the fill marks section
        function showFillMarks(projectId, projectName) {
            document.getElementById('fillMarksSection').style.display = 'block';
            document.getElementById('projectIdInput').value = projectId;
            document.getElementById('projectNameDisplay').innerText = projectName;
        }

        // Function to hide the fill marks section
        function closeFillMarks() {
            document.getElementById('fillMarksSection').style.display = 'none';
        }
    </script>
</head>
<body>
    <h1>Your Projects</h1>
    <%
        // Retrieve the list of projects from the request attribute
        List<mProject> mprojectList = (List<mProject>) request.getAttribute("mprojectList");
        if (mprojectList != null && !mprojectList.isEmpty()) {
    %>
    <table>
        <tr>
            <th>Project ID</th>
            <th>Project Name</th>
            <th>Semester</th>
            <th>Action</th>
        </tr>
        <%
            for (mProject mproject : mprojectList) {
        %>
        <tr>
            <td><%= mproject.getProjectId() %></td>
            <td><%= mproject.getProjectName() %></td>
            <td><%= mproject.getSemester() %></td>
            <td>
                <a href="javascript:void(0);" onclick="showFillMarks('<%= mproject.getProjectId() %>', '<%= mproject.getProjectName() %>')">Fill Marks</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        } else {
    %>
        <p>No projects assigned to you as a mentor.</p>
    <%
        }
    %>

    <!-- Hidden Section for Filling Marks -->
    <div id="fillMarksSection">
        <span class="close-btn" onclick="closeFillMarks()">&#x2716; Close</span>
        <h2>Fill Marks for <span id="projectNameDisplay"></span></h2>
        <form method="post" action="processMarks.jsp">
            <input type="hidden" id="projectIdInput" name="projectId" value="">
            <label for="synopsisMarks">Synopsis Marks:</label>
            <input type="number" id="synopsisMarks" name="synopsisMarks" min="0" max="100" required><br><br>
            <label for="midTermMarks">Mid-Term Marks:</label>
            <input type="number" id="midTermMarks" name="midTermMarks" min="0" max="100" required><br><br>
            <label for="endTermMarks">End-Term Marks:</label>
            <input type="number" id="endTermMarks" name="endTermMarks" min="0" max="100" required><br><br>
            <button type="submit">Submit Marks</button>
        </form>
    </div>
</body>
</html>