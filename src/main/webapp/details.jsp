<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Team</title>
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
            display: flex;
            height: 100vh;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .sidebar {
            width: 250px;
            position: fixed;
            height: 100%;
            background-color: var(--accent-color);
            padding-top: 30px;
            border-right: 1px solid #ddd;
        }

        .sidebar .redirect-icon {
            text-align: center;
            margin-top: 20px;
        }

        .sidebar .redirect-icon img {
            width: 40px;
            cursor: pointer;
        }

        .main-content {
            margin-left: 280px;
            padding-top: 10px;
        }

        .heading {
            padding-bottom: 20px;
        }

        .status-section {
            margin-bottom: 30px;
        }

        .status-section h2 {
            margin-bottom: 10px;
        }

        .status-section div {
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        table, th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        th {
            background-color: var(--secondary-color);
            color: var(--heading-color);
        }

        td {
            text-align: center;
            color: var(--text-color);
        }

    </style>
</head>
<body>

    <!-- Sidebar with redirect icon -->
    <div class="sidebar">
        <div class="redirect-icon">
            <a href="dashboard.jsp">
                <img src="https://img.icons8.com/ios-glyphs/30/000000/home.png" alt="Dashboard Icon" title="Go to Dashboard">
            </a>
        </div>
    </div>
   
    <div class="main-content">
        <div class="status-section">
            <h2>Team Details:</h2>
        </div>

        <!-- Invites Pending Section -->
        <div class="status-section">
            <div>Mentor Allocated : Dr. Sachi Chaudhary</div>
        </div>

        <div class="status-section">
            <div>Project Title: Insync</div>
            <div>Project I'd: Dev_12</div>
        </div>

        <!-- Team Members Section -->
        <div class="status-section">
            <h2>Team Members:</h2>

            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>SAP ID</th>
                        <th>Semester</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Kashish</td>
                        <td>500107137</td>
                        <td>5th</td>
                    </tr>
                    <tr>
                        <td>Vibhav</td>
                        <td>50005678</td>
                        <td>5th</td>
                    </tr>
                    <tr>
                        <td>Aryan</td>
                        <td>50009876</td>
                        <td>5th</td>
                    </tr>
                    <tr>
                        <td>Bhavesh</td>
                        <td>50004321</td>
                        <td>5th</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
