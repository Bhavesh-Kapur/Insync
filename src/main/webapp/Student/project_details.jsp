<%@ page import="java.util.ArrayList" %>
<%@ page import="in.upes.projectmanagement.Student.TeamMember" %>
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

        .container {
            max-width: 70%;
            margin: 0 auto;
        }

        .dashboard-icon {
            position: absolute;
            top: 20px;
            right: 30px;
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

        .project-details p {
            font-size: 1.4rem;
            line-height: 1.6;
            margin: 15px 0;
            font-weight: 500;
            color: var(--text-color);
            text-align: left;
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

        .status-section {
            margin-bottom: 30px;
        }
    </style>
</head>
<body>

    <a href="dashboard.jsp">
        <img src="https://img.icons8.com/ios-glyphs/30/000000/home.png" alt="Dashboard Icon" class="dashboard-icon" title="Go to Dashboard">
    </a>

    <div class="container">
        <h1>Project Details</h1>

        <div class="project-details">
            <button >Edit </button>`
            <p><strong>Project Type:</strong> 
                <%
                ArrayList<TeamMember> teamMembers = (ArrayList<TeamMember>) request.getAttribute("teamMembers");
                String projectType = "N/A";
                if (teamMembers != null && !teamMembers.isEmpty()) {
                    int semester = teamMembers.get(0).getSemester();
                    projectType = (semester == 5 || semester == 6) ? "Minor" : "Major";
                }
                out.print(projectType);
                %>
            </p>
            <p><strong>Semester:</strong> <%= teamMembers != null && !teamMembers.isEmpty() ? teamMembers.get(0).getSemester() : "N/A" %></p>
            <p><strong>Team Title:</strong> <%= request.getAttribute("teamName") %></p>
            <p><strong>Mentor Allocated:</strong> Dr. Sachi Chaudhary</p>
            <p><strong>Team ID:</strong> <%= request.getAttribute("teamId") %></p>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>SAP ID</th>
                    <th>Semester</th>
                    <th>Program</th>
                </tr>
            </thead>
            <tbody>
                <%
                if (teamMembers != null && !teamMembers.isEmpty()) {
                    for (TeamMember member : teamMembers) {
                %>
                <tr>
                    <td><%= member.getName() %></td>
                    <td><%= member.getSapId() %></td>
                    <td><%= member.getSemester() %></td>
                    <td><%= member.getProgram() %></td>
                </tr>
                <%
                    }
                }
                %>
            </tbody>
        </table>

    <a href="fileUpload.jsp">Upload files</a>
    <a href="downloadPdf.jsp">Download files</a>

    </div>

</body>
</html>