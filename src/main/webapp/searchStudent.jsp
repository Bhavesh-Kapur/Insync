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
            --heading-color: #0a0a0a;
            --text-color: #333333;
        }

        body {
            font-family: "Poppins", sans-serif;
            background: linear-gradient(135deg, #d6e9f8, #ffffff);
            display: flex;
            height: 100vh;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .main-content {
            width: 100%;
            padding: 50px;
            flex-grow: 1;
        }

        .home-icon {
            position: absolute;
            top: 20px;
            right: 30px;
        }

        .home-icon img {
            width: 40px;
            cursor: pointer;
        }

        h1 {
            font-size: 3rem;
            color: var(--heading-color);
            margin-bottom: 20px;
            text-align: left;
        }

        form {
            margin-bottom: 20px;
        }

        label {
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--heading-color);
        }

        input {
            width: 50%;
            padding: 10px;
            font-size: 1rem;
            border: 2px solid var(--primary-color);
            border-radius: 12px;
            background: var(--accent-color);
            color: var(--text-color);
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

    
    <div class="main-content">
        <h1>Create Team</h1>

        
        <form action="searchStudent" method="post">
            <label for="sap-id-input">Enter SAP ID</label><br>
            <input type="text" id="sap-id-input" placeholder="Enter SAP ID" name="searchPrms">
            <button type="submit">Search by SAP ID</button>
        </form>
        <form action="searchStudent" method="post">
            <label for="name-input">Enter Student Name</label><br>
            <input type="text" id="name-input" placeholder="Enter Student Name" name="searchPrms">
            <button type="submit">Search by Name</button>
        </form>

        <table>
            <caption style="text-align:left; font-weight: bolder; margin-bottom:10px">
                Group Members
            </caption>
            <colgroup>
                <col style="width:25%">
                <col style="width:20%">
                <col style="width:25%">
                <col style="width:20%">
                <col style="width:10%"> 
            </colgroup>

            <thead>
                <tr style="background-color: antiquewhite;">
                    <th>Name</th>
                    <th>SAP ID</th>
                    <th>Program</th>
                    <th>Semester</th>
                    <th>Action</th> 
                </tr>
            </thead>
            <tbody>
                <%-- this if will handle if the user sapid is not found in the database --%>
                <%
                if (request.getAttribute("errorMessage") != null) {
                    out.println("<p style='color:red;'>" + request.getAttribute("errorMessage") + "</p>");
                }
                %>

                <%-- servlet mapping required for this page to work i.e invite servlet --%>
                <% 
                if (request.getAttribute("name") != null) { 
                %>
                <tr>
                    <td><%= request.getAttribute("name") %></td>
                    <td><%= request.getAttribute("sapid") %></td>
                    <td><%= request.getAttribute("program") %></td>
                    <td><%= request.getAttribute("semester") %></td>
                    <td>
                        <form action="inviteServlet" method="POST">     
                            <input type="hidden" name="sapid" value="<%= request.getAttribute("sapid") %>"> 
                            <input type="hidden" name="name" value="<%= request.getAttribute("name") %>"> 
                            <input type="hidden" name="semester" value="<%= request.getAttribute("semester") %>"> 
                            <input type="hidden" name="program" value="<%= request.getAttribute("program") %>"> 
                            <button type="submit">Invite</button>
                        </form>
                    </td>
                </tr>
                <% 
                } else { 
                %>
                <tr>
                    <td colspan="5">Please search.</td>
                </tr>
                <% 
                } 
                %>
            </tbody>
        </table>
    </div>

    <div class="home-icon">
        <a href="dashboard.jsp">
            <img src="https://img.icons8.com/ios-glyphs/30/000000/home.png" alt="Dashboard Icon" title="Go to Dashboard">
        </a>
    </div>

</body>
</html>
