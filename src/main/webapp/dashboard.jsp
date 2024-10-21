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
        }

        .sidebar h3 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        .student-details {
            list-style: none;
            padding: 0;
        }

        .student-details li {
            margin-bottom: 20px;
            font-size: 18px;
        }

        .student-details li span {
            font-weight: bold;
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

        .content h1 {
            font-size: 36px;
            font-weight: bold;
            color: var(--heading-color);
            margin-bottom: 20px;
        }

        /* Team Formation box */
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
        <img src="src\main\webapp\WEB-INF\images\stulogo(1)(1).jpg">
        <ul class="student-details">
            <li><span>Name:</span>  ${sessionScope.name}</li>
            <li><span>SAP ID:</span>  ${sessionScope.sapid}</li>
            <li><span>Program:</span>  ${sessionScope.program}</li>
            <li><span>Semester:</span>  ${sessionScope.semester}</li>
        </ul>
        <a href="logout" class="logout-button">Logout</a>
    </div>

    <!-- Main content -->
    <div class="content">
        <div class="team-box">
            <a href="searchStudent.jsp">Team Formation</a>
        </div>
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

</body>
</html>
