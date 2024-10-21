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
            display: flex;
            flex-direction: column; /* Flexbox layout */
            justify-content: space-between; /* Space between content and bottom */
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
        .content {
            flex-grow: 1;
            padding: 50px;
            display: flex;
            flex-wrap: wrap; /* Allow content to wrap to the next line */
            gap: 30px; /* Increased space between boxes */
            justify-content: space-between; /* Distribute space between boxes */
        }

<<<<<<< HEAD
        .content h1 {
            font-size: 36px;
            font-weight: bold;
            color: var(--heading-color);
            margin-bottom: 20px;
        }

        /* Team Formation box */
=======
>>>>>>> 3f98f21f222199976995b8612e45b7130aa769c0
        .team-box {
            background-color: white;
            padding: 20px;
            border: 2px solid var(--primary-color);
            border-radius: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
            width: calc(33.33% - 30px); /* Ensure 3 boxes per row */
            height: 250px; /* Make it square */
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            box-sizing: border-box;
        }

        .team-box:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .team-box a {
            text-decoration: none;
            color: var(--primary-color);
            font-size: 20px; /* Increased font size */
            font-weight: bold;
            display: block;
        }

        .team-box a:hover {
            text-decoration: underline;
        }

        /* Adjust inbox form button */
        form {
            margin-top: 10px;
        }

        form button {
            padding: 10px 20px;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
        }

        form button:hover {
            background-color: #357abd;
        }

    </style>
</head>
<body>
    <script>
        function fetchInvite() {
            const url = "fetchInvite";   
            window.location.href = url;
        }
    
        function Status() {
            const url = "StatusServlet";
            window.location.href = url;
        }
        
    </script>
    <a href="javascript:void(0);" onclick="fetchInvite();">Inbox</a>
    <a href="javascript:void(0);" onclick="Status();">Team Status</a>d 
    <!-- Sidebar -->
    <div class="sidebar">
<<<<<<< HEAD
        <img src="src\main\webapp\WEB-INF\images\stulogo(1)(1).jpg">
        <ul class="student-details">
            <li><span>Name:</span>  ${sessionScope.name}</li>
            <li><span>SAP ID:</span>  ${sessionScope.sapid}</li>
            <li><span>Program:</span>  ${sessionScope.program}</li>
            <li><span>Semester:</span>  ${sessionScope.semester}</li>
        </ul>
=======
        <div>
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
        </div>

>>>>>>> 3f98f21f222199976995b8612e45b7130aa769c0
        <a href="logout" class="logout-button">Logout</a>
    </div>

    <!-- Main content -->
    <div class="content">
        <div class="team-box">
            <a href="searchStudent.jsp">Team Formation</a>
        </div>
<<<<<<< HEAD
        <div class="team-box">
            <a href="awaited.jsp">Team Status</a>
        </div>
        
        
        <div class="team-box">
            <a href="details.jsp">Team Details</a>
        </div>
        <div class="team-box">
            <a href="details.jsp">Inbox</a>
        </div>
        

        <div class="team-box">
            <a href="details.jsp">Team Discussion</a>
        </div>
        <div class="team-box">
            <a href="details.jsp">Mentor Request</a>
        </div>
    </div>

=======
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
    
>>>>>>> 3f98f21f222199976995b8612e45b7130aa769c0
</body>
</html>