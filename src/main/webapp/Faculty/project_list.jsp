<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="in.upes.projectmanagement.Faculty.Project" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .main-content {
            max-width: 800px;
            margin: 0 auto;
        }
        h1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="main-content">
        <h1>Project List</h1>
        <table>
            <thead>
                <tr>
                    <th>Project ID</th>
                    <th>Project Name</th>
                    <th>Semester</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Fetch the project list from the request attribute
                    List<Project> projectList = (List<Project>) request.getAttribute("projectList");
                    if (projectList != null && !projectList.isEmpty()) {
                        for (Project project : projectList) {
                %>
                <tr>
                    <td><%= project.getProjectId() %></td>
                    <td><%= project.getProjectName() %></td>
                    <td><%= project.getSemester() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="3">No projects available</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>