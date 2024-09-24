

<!-- <%@page contentType="text/html" pageEncoding="UTF-8"%> -->
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
            padding-top: 80px;
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
            <h2>Invites Accepted:</h2>
            <div>List of accepted invites</div>
        </div>

        <!-- Invites Pending Section -->
        <div class="status-section">
            <h2>Invites Pending:</h2>
            <div>List of pending invites</div>
        </div>

        <!-- Invites Rejected Section -->
        <div class="status-section">
            <h2>Invites Rejected:</h2>
            <div>List of rejected invites</div>
        </div>
    </div>

</body>
</html>
