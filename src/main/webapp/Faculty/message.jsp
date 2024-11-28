<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Send Message to Students</title>
</head>
<body>
    <h2>Send a Message to Students</h2>

    <form action="sendMessage" method="post">
        <label for="prof_id">Professor ID:</label>
        <input type="number" name="prof_id" required><br>

        <label for="project_id">Project ID:</label>
        <input type="number" name="project_id" required><br>

        <label for="message">Message:</label><br>
        <textarea name="message" rows="5" cols="40" required></textarea><br><br>

        <input type="submit" value="Send Message">
    </form>

    <c:if test="${param.status == 'success'}">
        <p style="color: green;">Message sent successfully!</p>
    </c:if>

</body>
</html>