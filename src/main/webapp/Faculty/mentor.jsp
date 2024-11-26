<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        a {
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
        }
        a:hover {
            color: #0056b3;
        }
    </style>
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
                <a href="fillMarks.jsp?projectId=<%= mproject.getProjectId() %>">Fill Marks</a>
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
</body>
</html> --%>





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
    </style>
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
                <a href="fillMarks.jsp?projectId=<%= mproject.getProjectId() %>">Fill Marks</a>
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
</body>
</html>