<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send Message to Students</title>
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #eaf4fc;
            --text-color: #333333;
            --heading-color: #0a0a0a;
            --form-bg-color: #ffffff;
            --box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            --border-radius: 8px;
        }

        body {
            font-family: "Poppins", sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--secondary-color);
            color: var(--text-color);
        }

        h2 {
            text-align: center;
            color: var(--primary-color);
            font-weight: bold;
            margin-top: 30px;
            font-size: 2em;
        }

        form {
            width: 60%;
            margin: 20px auto;
            background-color: var(--form-bg-color);
            padding: 20px;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
            color: var(--text-color);
        }

        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 20px;
            border: 1px solid #d6e9f8;
            border-radius: var(--border-radius);
            font-size: 1em;
        }

        textarea {
            resize: none;
        }

        input[type="submit"] {
            display: block;
            background-color: var(--primary-color);
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: var(--border-radius);
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin: 0 auto;
        }

        input[type="submit"]:hover {
            background-color: #3a7dc1;
        }

        p {
            text-align: center;
            font-size: 1.2em;
        }

        p[style*="color: green;"] {
            margin-top: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h2>Send a Message to Students</h2>

    <form action="sendMessage" method="post">
        <label for="prof_id">Professor ID:</label>
        <input type="number" name="prof_id" required>

        <label for="project_id">Project ID:</label>
        <input type="number" name="project_id" required>

        <label for="message">Message:</label>
        <textarea name="message" rows="5" cols="40" required></textarea>

        <input type="submit" value="Send Message">
    </form>

    <!-- <c:if test="${param.status == 'success'}">
        <p style="color: green;">Message sent successfully!</p>
    </c:if> -->
</body>
</html>