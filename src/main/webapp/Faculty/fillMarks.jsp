<%@ page import="java.util.ArrayList" %>
<%@ page import="in.upes.projectmanagement.Faculty.mProject" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fill Marks</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            padding: 20px;
        }
        .form-container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-container h1 {
            margin-bottom: 20px;
        }
        .form-container input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .form-container button {
            padding: 10px 20px;
            border: none;
            background-color: #007BFF;
            color: white;
            cursor: pointer;
            border-radius: 5px;
        }
        .form-container button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Fill Marks for Project</h1>
        <form action="FillMarksServlet" method="post">
            <input type="hidden" name="projectId" value="<%= request.getParameter("mprojectId") %>" />
            <label for="synopsisMarks">Synopsis Marks:</label>
            <input type="text" id="synopsisMarks" name="synopsisMarks" required />

            <label for="midtermMarks">Mid-term Marks:</label>
            <input type="text" id="midtermMarks" name="midtermMarks" required />

            <label for="endtermMarks">End-term Marks:</label>
            <input type="text" id="endtermMarks" name="endtermMarks" required />

            <button type="submit">Submit Marks</button>
        </form>
    </div>
</body>
</html>