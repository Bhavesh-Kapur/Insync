<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invite Mentor</title>
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
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
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
            font-size: 2.5rem;
            color: var(--heading-color);
            margin-bottom: 10px;
            text-align: center;
            padding-top: 10px;
        }

        h2 {
            font-size: 1.5rem;
            color: var(--heading-color);
            text-align: left;
            margin-top: 10px;
            margin-bottom: 15px;
        }

        .main-content {
            width: 100%;
            padding: 50px;
            max-width: 800px;
            background: var(--accent-color);
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 10px;
        }

        form {
            margin-bottom: 20px;
            text-align: left;
        }

        label {
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--heading-color);
        }

        input[type="text"] {
            padding: 10px;
            width: 50%;
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
            margin-top: 10px;
            border-collapse: collapse;
            text-align: left;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            font-size: 1rem;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
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

        .error {
            color: red;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
            padding: 10px;
            margin-top: 10px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <h1>Invite Mentor</h1>
    <div class="main-content">
        <form action="searchFaculty" method="post">
            <label for="name">Enter Mentor Name</label><br>
            <input type="text" id="name" placeholder="Enter Mentor Name" name="mentorName">
            <button type="submit">Search</button>
        </form>

        <div class="success">
            <%= request.getAttribute("successMessage") %>
        </div>

        <h2>Faculty List</h2>
        <table>
            <thead>
                <tr style="background-color: antiquewhite;">
                    <th>Faculty ID</th>
                    <th>Name</th>
                    <th>Program</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
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
