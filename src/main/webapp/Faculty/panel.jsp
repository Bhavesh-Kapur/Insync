<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel Project Evaluation</title>
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
            max-width: 90%;
            margin: 50px auto;
            padding: 20px;
            background-color: var(--accent-color);
            border-radius: 8px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 2.5rem;
            color: var(--heading-color);
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: var(--accent-color);
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 15px;
            font-size: 1.1rem;
            text-align: center;
        }

        th {
            background-color: var(--secondary-color);
            font-weight: bold;
            color: var(--heading-color);
        }

        tr:hover {
            background-color: #f4f4f4;
        }

        form {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        input[type="number"] {
            padding: 8px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 60%;
            margin-right: 10px;
        }

        button {
            padding: 8px 15px;
            background-color: var(--primary-color);
            color: var(--accent-color);
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            font-size: 1rem;
        }

        button:hover {
            background-color: #3a78c1;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Panel Project Evaluation</h1>
        <table>
            <thead>
                <tr>
                    <th>Project Name</th>
                    <th>Team ID</th>
                    <th>Enter Synopsis Marks</th>
                    <th>Enter Mid-Term Marks</th>
                    <th>Enter End-Sem Marks</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="project" items="${projectList}">
                    <tr>
                        <td>${project.projectName}</td>
                        <td>${project.teamName}</td>
                        <td>
                            <form action="SynopsisMarksServlet" method="post">
                                <input type="hidden" name="projectId" value="${project.projectId}" />
                                <input type="number" name="synopsisMarks" min="0" max="100" placeholder="Enter marks" required />
                                <button type="submit">Save</button>
                            </form>
                        </td>
                        <td>
                            <form action="MidTermMarksServlet" method="post">
                                <input type="hidden" name="projectId" value="${project.projectId}" />
                                <input type="number" name="midTermMarks" min="0" max="100" placeholder="Enter marks" required />
                                <button type="submit">Save</button>
                            </form>
                        </td>
                        <td>
                            <form action="EndSemMarksServlet" method="post">
                                <input type="hidden" name="projectId" value="${project.projectId}" />
                                <input type="number" name="endSemMarks" min="0" max="100" placeholder="Enter marks" required />
                                <button type="submit">Save</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
