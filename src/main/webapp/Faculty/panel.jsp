<!DOCTYPE html>
<html>
<head>
    <title>Project Evaluation</title>
    <style>
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
        form {
            margin: 0;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center;">Project Evaluation Panel</h1>
    <table>
        <thead>
            <tr>
                <th>Project Name</th>
                <th>Team Name</th>
                <th>Marks</th>
                <th>Mentor Name</th>
                <th>Update Marks</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="project" items="${projectList}">
                <tr>
                    <td>${project.projectName}</td>
                    <td>${project.teamName}</td>
                    <td>${project.marks}</td>
                    <td>${project.mentorName}</td>
                    <td>
                        <form action="PanelServlet" method="post">
                            <input type="hidden" name="projectId" value="${project.projectId}" />
                            <input type="number" name="marks" min="0" max="100" placeholder="Enter marks" required />
                            <button type="submit">Save</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>


frontend
