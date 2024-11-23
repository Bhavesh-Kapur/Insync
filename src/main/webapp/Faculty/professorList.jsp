<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="in.upes.projectmanagement.Faculty.Professor" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send Invites</title>
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
        .invite-button {
            background-color: #007BFF;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .invite-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%
    String message = request.getParameter("message");
    String error = request.getParameter("error");
    if (message != null) {
%>
        <div class="message success">
            <%= message %>
        </div>
<%
    }
    if (error != null) {
%>
        <div class="message error">
            <%= error %>
        </div>
<%
    }
%>
    <div class="main-content">
        <h1>Send Invites to Professors</h1>
        <table>
            <thead>
                <tr>
                    <th>Professor ID</th>
                    <th>Professor Name</th>
                    <th>Program</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Professor> professorList = (List<Professor>) request.getAttribute("professorList");
                    if (professorList != null && !professorList.isEmpty()) {
                        for (Professor professor : professorList) {
                %>
                <tr>
                    <td><%= professor.getProfId() %></td>
                    <td><%= professor.getProfName() %></td>
                    <td><%= professor.getProgram() %></td>
                    <td>
                        <form action="panelInvite" method="post" style="display:inline;">
                            <input type="hidden" name="profId" value="<%= professor.getProfId() %>">
                            <button type="submit" class="invite-button">Send Invite</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="4">No professors found</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>