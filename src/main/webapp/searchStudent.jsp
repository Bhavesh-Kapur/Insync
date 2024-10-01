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
    <title>Create Team</title>
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #d6e9f8;
            --accent-color: #ffffff;
            --background-gradient: linear-gradient(135deg, #d6e9f8, #ffffff);
            --heading-color: #0a0a0a;
            --text-color: #333333;
        }

        body {
            font-family: "Poppins", sans-serif;
            background: var(--background-gradient);
            display: flex;
            height: 100vh;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .sidebar {
            width: 250px;
            position: fixed;
            height: 100%;
            background-color: var(--accent-color);
            padding-top: 30px;
            border-right: 1px solid #ddd;
        }

        .sidebar .redirect-icon {
            text-align: center;
            margin-top: 20px;
        }

        .sidebar .redirect-icon img {
            width: 40px;
            cursor: pointer;
        }

        .main-content {
            margin-left: 250px;
            padding: 50px;
            flex-grow: 1;
        }

        h1 {
            font-size: 3rem;
            color: var(--heading-color);
            margin-bottom: 20px;
            text-align: left;
        }

        input {
            width: 50%;
            padding: 10px;
            font-size: 1rem;
            border: 2px solid var(--primary-color);
            border-radius: 12px;
            background: var(--accent-color);
            color: var(--text-color);
            cursor: text;
            margin-top: 10px;
        }

        button {
            padding: 10px 15px;
            border: none;
            border-radius: 12px;
            background: var(--primary-color);
            color: white;
            cursor: pointer;
            margin-left: 10px;
            transition: all 0.3s ease;
        }

        button:hover {
            background: #3b7cd3;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            text-align: left;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            font-size: 1rem;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        tfoot {
            font-weight: bold;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <div class="redirect-icon">
            <a href="dashboard.jsp">
                <img src="https://img.icons8.com/ios-glyphs/30/000000/home.png" alt="Dashboard Icon" title="Go to Dashboard">
            </a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h1>Create Team</h1>

        <!-- Search input for SAP ID -->
        <form action="searchStudent" method="post">
        <input type="text" id="sap-id-input" placeholder="Enter SAP ID" name="sapId">
        <button type="submit">Search</button>
        </form>


     <table>
            <caption style="text-align:left; font-weight: bolder; margin-bottom:10px">
                Group Members
            </caption>
            <colgroup>
                <col style="width:10%">
                <col style="width:25%">
                <col style="width:20%">
                <col style="width:25%">
                <col style="width:20%">
            </colgroup>

            <thead>
                <tr style="background-color: antiquewhite;">
                    <th>S.No</th>
                    <th>Name</th>
                    <th>SAP ID</th>
                    <th>Program</th>
                    <th>Semester</th>
                </tr>
            </thead>
            </team>



        <%-- <!-- Table to display selected students -->
        <table>
            <caption style="text-align:left; font-weight: bolder; margin-bottom:10px">
                Group Members
            </caption>
            <colgroup>
                <col style="width:10%">
                <col style="width:25%">
                <col style="width:20%">
                <col style="width:25%">
                <col style="width:20%">
            </colgroup>

            <thead>
                <tr style="background-color: antiquewhite;">
                    <th>S.No</th>
                    <th>Name</th>
                    <th>SAP ID</th>
                    <th>Program</th>
                    <th>Semester</th>
                </tr>
            </thead>
            <tbody id="student-table-body">
             <tr style="background-color: antiquewhite;">
                    <th>S.No</th>
                    <th>${sessionScope.name}</th>
                    <th>${sessionScope.sapid}</th>
                    <th>${sessionScope.program}</th>
                    <th>${sessionScope.sem}</th>
                </tr>
                <!-- Student rows will be dynamically added here -->
            </tbody>
            
        </table> --%>


    <div id="student-details">
        <%
            String studentDetails = (String) request.getAttribute("studentDetails");
            if (studentDetails != null) {
                out.println("<h3>Student Details:</h3>");
                out.println(studentDetails);
                out.println("<button class='invite-button'>Invite</button>");
            } else if (request.getAttribute("errorMessage") != null) {
                out.println("<p style='color:red;'>" + request.getAttribute("errorMessage") + "</p>");
            }
        %>
    </div>
    </div>



</body>
</html>