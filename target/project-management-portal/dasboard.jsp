<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #d6e9f8;
            --sidebar-bg: #f2f4f8; /* Lightest shade close to white */
            --sidebar-text: #333333;
            --text-color: #333333;
            --heading-color: #0a0a0a;
        }

        body {
            font-family: "Poppins", sans-serif;
            margin: 0;
            padding: 0;
            background: var(--secondary-color);
            color: var(--text-color);
            display: flex;
            height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            background-color: var(--sidebar-bg);
            width: 300px;
            padding: 40px 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            height: 100vh;
            box-sizing: border-box;
        }

        .sidebar h3 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        .student-details {
            list-style: none;
            padding: 0;
        }

        .student-details li {
            margin-bottom: 20px;
            font-size: 18px;
        }

        .student-details li span {
            font-weight: bold;
        }

        /* Main content */
        .content {
            flex-grow: 1;
            padding: 50px;
        }

        .content h1 {
            font-size: 36px;
            font-weight: bold;
            color: var(--heading-color);
            margin-bottom: 20px;
        }

        .content p {
            font-size: 18px;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h3>(Student Logo)</h3>
        <ul class="student-details">
            <li><span>Name:</span> Vibhav Khaneja</li>
            <li><span>SAP ID:</span> 500105662</li>
            <li><span>Program:</span> B.Tech CSE</li>
            <li><span>Specialization:</span> DevOps</li>
            <li><span>Semester:</span> 5th</li>
        </ul>
    </div>

    <!-- Main content -->
    <div class="content">
        <a href="TEAM FORMATION" style="text-decoration: none;"></a>
    </div>

</body>
</html>