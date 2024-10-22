<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project Details</title>
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
            margin: 0;
            padding: 20px;
            box-sizing: border-box;
        }

        /* Container for centering content */
        .container {
            max-width: 70%; /* 60-70% width */
            margin: 0 auto;  /* Center content horizontally */
        }

        /* Dashboard Icon CSS */
        .dashboard-icon {
            position: absolute;
            top: 20px;
            right: 20px;
            width: 40px;
            cursor: pointer;
        }

        h1 {
            font-size: 2.8rem;
            color: var(--heading-color);
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
        }

        .project-details {
            font-size: 1.4rem;
            line-height: 1.6;
            margin-bottom: 40px;
            text-align: left;
            padding: 10px 20px;
            background-color: var(--accent-color);
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .project-details p {
            margin: 15px 0;
            font-weight: 500;
            color: var(--text-color);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: var(--accent-color);
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        table, th, td {
            border: 1px solid #ddd;
            padding: 15px;
            font-size: 1.1rem;
        }

        th {
            background-color: var(--secondary-color);
            font-weight: bold;
            text-align: left;
        }

        td {
            text-align: center;
            color: var(--text-color);
        }

        /* Add extra space between sections */
        .status-section {
            margin-bottom: 30px;
        }

    </style>
</head>
<body>

    <!-- Dashboard redirect icon at the top-right corner -->
    <a href="dashboard.jsp">
        <img src="https://img.icons8.com/ios-glyphs/30/000000/home.png" alt="Dashboard Icon" class="dashboard-icon" title="Go to Dashboard">
    </a>

    <div class="container">
        <!-- Centered Title -->
        <h1>Project Details</h1>

        <!-- Display Project Information -->
        <div class="project-details">
            <p><strong>Project Type:</strong> 
                <% 
                // Logic for Project Type based on semester
                int semester = Integer.parseInt(request.getAttribute("semester").toString());
                String projectType = (semester == 5 || semester == 6) ? "Minor" : "Major";
                out.print(projectType); 
                %>
            </p>
            <p><strong>Semester:</strong> <%= request.getAttribute("semester") %></p>
            <p><strong>Team Title:</strong> <%= request.getAttribute("teamTitle") %></p>
            <p><strong>Mentor Allocated:</strong> <%= request.getAttribute("mentor") %></p>
            <p><strong>Team ID:</strong> <%= request.getAttribute("teamID") %></p>
        </div>

        <!-- Team Members Table -->
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>SAP ID</th>
                    <th>Semester</th>
                    <th>Program</th>
                    <th>Specialization</th>
                </tr>
            </thead>
            <tbody>
                <%-- Loop through student list dynamically --%>
                <% 
                List<Student> students = (List<Student>) request.getAttribute("students");
                for (Student student : students) {
                %>
                <tr>
                    <td><%= student.getName() %></td>
                    <td><%= student.getSapId() %></td>
                    <td><%= student.getSemester() %></td>
                    <td><%= student.getProgram() %></td>
                    <td><%= student.getSpecialization() %></td>
                </tr>
                <% 
                } 
                %>
            </tbody>
        </table>
    </div>

</body>
</html>
