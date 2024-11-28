<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="in.upes.projectmanagement.Faculty.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Students</title>
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

        .specialization {
            font-size: 1.1rem;
            font-weight: bold;
            margin-bottom: 20px;
            color: var(--text-color);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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

        .no-students {
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
    <h1>List of Students</h1>
    <div class="main-content">
        <div class="specialization">
            Specialization: DevOps
        </div>
        <table>
            <thead>
                <tr>
                    <th>SAP ID</th>
                    <th>Student Name</th>
                    <th>Semester</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Student> studentList = (List<Student>) request.getAttribute("studentList");
                    if (studentList != null && !studentList.isEmpty()) {
                        for (Student student : studentList) {
                %>
                <tr>
                    <td><%= student.getStudentId() %></td>
                    <td><%= student.getStudentName() %></td>
                    <td><%= student.getSemester() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="3" class="no-students">No students found</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>