<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Download SRS and Synopsis Reports</title>
</head>
<body>
    <h2>Download Reports</h2>
    <form action="downloadFiles" method="get">
        <label for="student_id">Enter Student ID:</label>
        <input type="number" name="student_id" id="student_id" required>
        <button type="submit">View Documents</button>
    </form>
    <hr>
    <div id="file-links">
        <%-- File download links will be displayed here based on the student's ID --%>
    </div>
</body>
</html>
