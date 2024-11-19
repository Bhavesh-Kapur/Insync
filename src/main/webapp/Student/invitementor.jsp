<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="in.upes.projectmanagement.Student.Faculty" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invite Mentor</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #DAE8F6;
            margin: 20px;
        }
        .main-content {
            max-width: 800px;
            margin: auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1, h2 {
            text-align: center;
            color: #333;
        }
        form {
            margin-bottom: 20px;
            text-align: center;
        }
        input[type="text"] {
            padding: 8px;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 10px;
        }
        button {
            padding: 8px 12px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        .invite-btn {
            background-color: #28a745;
            color: white;
            padding: 6px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .invite-btn:hover {
            background-color: #218838;
        }
        .no-records {
            text-align: center;
            font-weight: bold;
            color: #ff0000;
        }
    </style>
</head>
<body>
    <div class="main-content">
        <h1>Invite Mentor</h1>
        <form action="searchFaculty" method="post">
            <label for="name">Enter Name</label><br>
            <input type="text" id="name" placeholder="Enter Name" name="mentorName">
            <button type="submit">Search</button>
        </form>

        <h2>Faculty List</h2>
        <table>
            <tr>
                <th>Faculty ID</th>
                <th>Name</th>
                <th>Program</th>
                <th>Action</th>
            </tr>
            <%
                List<Faculty> facultyList = (List<Faculty>) request.getAttribute("facultyList");
                if (facultyList != null && !facultyList.isEmpty()) {
                    for (Faculty faculty : facultyList) {
            %>
            <tr>
                <td><%= faculty.getProfid() %></td>
                <td><%= faculty.getName() %></td>
                <td><%= faculty.getProgram() %></td>
                <td>
                    <form action="inviteFaculty" method="post" style="display:inline;">
                        <input type="hidden" name="profid" value="<%= faculty.getProfid() %>">
                        <button type="submit" class="invite-btn">Invite</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="4" class="no-records">No records found</td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>