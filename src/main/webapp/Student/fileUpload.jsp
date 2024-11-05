<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Upload SRS and Synopsis</title>
</head>
<body>
    <h2>Upload SRS and Synopsis Reports</h2>
    <form action="uploadDocuments" method="post" enctype="multipart/form-data">
        <input type="number" name="student_id" placeholder="Student ID" required><br><br>
        <input type="file" name="srs_report" accept="application/pdf" required><br><br>
        <input type="file" name="synopsis_report" accept="application/pdf" required><br><br>
        <button type="submit">Upload Files</button>
    </form>
</body>
</html>
