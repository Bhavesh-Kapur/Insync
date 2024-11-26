<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, in.upes.projectmanagement.Faculty.mProject" %>
<html>
<head>
    <title>Mentor Projects</title>
</head>
<body>
    <h1>Your Projects</h1>
    <%
        // Retrieve the list of projects from the request attribute
        List<mProject> mprojectList = (List<mProject>) request.getAttribute("mprojectList");
        if (mprojectList != null && !mprojectList.isEmpty()) {
    %>
    <table border="1">
        <tr>
            <th>Project ID</th>
            <th>Project Name</th>
            <th>Semester</th>
        </tr>
        <%
            for (mProject mproject : mprojectList) {
        %>
        <tr>
            <td><%= mproject.getProjectId() %></td>
            <td><%= mproject.getProjectName() %></td>
            <td><%= mproject.getSemester() %></td>
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