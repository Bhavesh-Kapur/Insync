<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%
    if (session == null || session.getAttribute("sapid") == null) {
        response.sendRedirect("index.jsp"); // Redirect to login page if not logged in
        return; // Ensure the rest of the page is not processed
    }
    // int sapId = (int) session.getAttribute("sapid");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #d6e9f8;
            --sidebar-bg: #f2f4f8;
            --sidebar-text: #333333;
            --text-color: #333333;
            --heading-color: #0a0a0a;
        }

        body {
            font-family: "Poppins", sans-serif;
            margin: 0;
            padding: 0;
            background: var(--secondary-color);
            color: var(--text-color);
            display: flex;
            height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            background-color: var(--sidebar-bg);
            width: 300px;
            padding: 40px 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            height: 100vh;
            box-sizing: border-box;
            overflow: hidden; /* Ensures content stays inside */
        }

        .sidebar img {
            width: 80%;
            display: block;
            margin: 0 auto 20px auto;
        }

        /* Table for student details */
        table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed; /* Ensures table respects sidebar width */
        }

        table td {
            padding: 10px;
            font-size: 16px;
            word-wrap: break-word; /* Prevents long text from overflowing */
        }

        table td:first-child {
            font-weight: bold;
            width: 40%;
            text-align: left;
        }

        table td:last-child {
            text-align: right;
            width: 60%;
        }

        /* Logout button */
        .logout-button {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            text-align: center;
            font-size: 16px;
            color: white;
            background-color: var(--primary-color);
            border-radius: 8px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .logout-button:hover {
            background-color: #357ab8;
        }

        /* Main content */
        .content , .content2 {
            flex-grow: 1;
            padding: 50px;
        }

        .team-box {
            background-color: white;
            padding: 20px;
            border: 2px solid var(--primary-color);
            border-radius: 10px;
            display: inline-block;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .team-box:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .team-box a {
            text-decoration: none;
            color: var(--primary-color);
            font-size: 20px;
            font-weight: bold;
        }

        .team-box a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <img src="C:\Users\DELL\OneDrive\Desktop\Insync\src\main\webapp\images\stulogo(1)(1).jpg" alt="Student Logo">
        
        <!-- Student details in a table -->
        <table>
            <tr>
                <td>Name:</td>
                <td>${sessionScope.name}</td>
            </tr>
            <tr>
                <td>SAP ID:</td>
                <td>${sessionScope.sapid}</td>
            </tr>
            <tr>
                <td>Program:</td>
                <td>${sessionScope.program}</td>
            </tr>
            <tr>
                <td>Semester:</td>
                <td>${sessionScope.semester}</td>
            </tr>
        </table>

        <a href="logout" class="logout-button">Logout</a>
    </div>

    <!-- Main content -->
    <div class="content">
        <div class="team-box">
            <a href="searchStudent.jsp">Team Formation</a>
        </div>
    </div>

    <div class="content">
        <div class="team-box">
            <a href="awaited.jsp">Team Status</a>
        </div>
    </div>

    <div class="content">
        <div class="team-box">
            <form action="fetchInvite" method="GET">
                <button type="submit">Inbox</button>
            </form>
        </div>
    </div>

    <div class="content2">
        <div class="team-box">
            <a href="details.jsp">Team Details</a>
        </div>
    </div>
    
</body>
</html>
