<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assigned Projects</title>
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #eaf4fc;
            --text-color: #333333;
            --heading-color: #0a0a0a;
            --box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            --border-radius: 8px;
        }

        body {
            font-family: "Poppins", sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--secondary-color);
            color: var(--text-color);
            line-height: 1.6;
        }

        h2 {
            text-align: center;
            color: var(--primary-color);
            font-weight: bold;
            font-size: 2em;
            margin-top: 30px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            width: 60%;
            margin: 20px auto;
            background-color: #ffffff;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }

        li {
            padding: 15px;
            font-size: 1.2em;
            color: var(--text-color);
            border-bottom: 1px solid #d6e9f8;
        }

        li:last-child {
            border-bottom: none;
        }

        p {
            text-align: center;
            font-size: 1.2em;
            color: var(--text-color);
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h2>List of Projects Assigned</h2>

    <%
        List<Integer> projectIds = (List<Integer>) request.getAttribute("projectIds");

        if (projectIds != null && !projectIds.isEmpty()) {
    %>
        <ul>
            <%
                for (Integer projectId : projectIds) {
            %>
            <li>Project ID: <%= projectId %></li>
            <%
                }
            %>
        </ul>
    <%
        } else {
    %>
        <p>You are not mentoring any projects.</p>
    <%
        }
    %>
</body>
</html>
