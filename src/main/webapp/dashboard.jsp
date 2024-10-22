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
            padding: 20px 20px; /* Reduced padding to bring content upwards */
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            height: 100vh;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
        }

        .sidebar img {
            width: 80%;
            display: block;
            margin: 0 auto 10px auto; /* Reduced margin-bottom */
        }

        .student-details {
            padding: 0;
            margin: 0;
            list-style: none;
        }

        /* Aligning name and output on the same line */
        .student-details li {
            margin-bottom: 15px; /* Slightly reduced margin to compact items */
            font-size: 16px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: nowrap; /* Preventing wrapping */
        }

        .student-details span:first-child {
            font-weight: bold;
            width: 100px; /* Fixed width for labels */
        }

        .student-details span:last-child {
            flex-grow: 1; /* Let the output take remaining space */
            text-align: right; /* Align outputs to the right */
        }

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
            margin-top: auto;
        }

        .logout-button:hover {
            background-color: #357ab8;
        }

        /* Main content */
        .content {
            flex-grow: 1;
            padding: 50px;
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: space-between;
        }

        .team-box {
            background-color: white;
            padding: 20px;
            border: 2px solid var(--primary-color);
            border-radius: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
            width: calc(33.33% - 30px);
            height: 250px;
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
            font-size: 20px;
            font-weight: bold;
        }

        .team-box a:hover {
            text-decoration: underline;
        }
        .team-formation{
            
    background-image: url('https://www.shutterstock.com/image-vector/hand-charity-foundation-logo-260nw-774421195.jpg'); /* Add the image path */
    background-size: cover; /* Scale the background to cover the entire box */
    background-position: center; /* Center the background image */
    background-repeat: no-repeat; /* Prevent the image from repeating */
    color: white; /* Optional: Change text color for better contrast */

        }
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
        .a{
            margin-top: 300px;
            color: #0a0a0a;
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <img src="src\main\webapp\WEB-INF\images\stulogo(1)(1).jpg">
        <ul class="student-details">
            <li><span>Name:</span> <span>${sessionScope.name}</span></li>
            <li><span>SAP ID:</span> <span>${sessionScope.sapid}</span></li>
            <li><span>Program:</span> <span>${sessionScope.program}</span></li>
            <li><span>Semester:</span> <span>${sessionScope.semester}</span></li>
        </ul>
        <a href="logout" class="logout-button">Logout</a>
    </div>

    <div class="content">
        <div class="team-box team-formation">
            <div>
            <a href="searchStudent.jsp"></a>
            <div class="a">
                
                <a href="searchStudent.jsp">Team Formation</a>
            </div>
            </div>
        </div>
        
        <div class="team-box">
            <a href="javascript:void(0);" onclick="Status();">Team Status</a>
        </div>
        <div class="team-box">
            <a href="details.jsp">Team Details</a>
        </div>
        <div class="team-box">
            <a href="javascript:void(0);" onclick="fetchInvite();">Inbox</a>
        </div>
        <div class="team-box">
            <a href="">Team Discussion</a>
        </div>
        <div class="team-box">
            <a href="invitementor.jsp">Mentor Request</a>
        </div>
    </div>

</body>
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
</html>
