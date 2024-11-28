<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="in.upes.projectmanagement.Faculty.Project" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Projects</title>
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #d6e9f8;
            --accent-color: #ffffff;
            --background-gradient: linear-gradient(135deg, #d6e9f8, #ffffff);
            --heading-color: #0a0a0a;
            --text-color: #333333;
            --border-color: #ccc;
            --hover-bg-color: #f1f1f1;
            --table-header-bg: #f4f4f4;
        }

        body {
            font-family: Arial, sans-serif;
            background: var(--background-gradient);
            margin: 0;
            padding: 20px;
            box-sizing: border-box;
        }

        h1 {
            text-align: center;
            color: var(--heading-color);
            font-size: 2.2rem;
            margin-bottom: 30px;
        }

        .main-content {
            max-width: 900px;
            margin: 0 auto;
            background-color: var(--accent-color);
            padding: 20px 30px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }

        table, th, td {
            border: 1px solid var(--border-color);
        }

        th, td {
            padding: 12px;
            text-align: left;
            font-size: 1rem;
        }

        th {
            background-color: var(--table-header-bg);
            color: var(--heading-color);
        }

        tr:hover {
            background-color: var(--hover-bg-color);
        }

        .no-projects {
            text-align: center;
            font-size: 1.1rem;
            color: var(--text-color);
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid var(--border-color);
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <h1>List of Projects</h1>
    <div class="main-content">
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
                    <td colspan="3" class="no-projects">No projects available</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
