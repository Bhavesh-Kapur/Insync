<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        .status-section {
            margin-bottom: 30px;
        }

        .status-section h2 {
            margin-bottom: 10px;
        }

        .status-section div {
            margin-top: 20px;
        }

        .invite-list {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .invite-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .invite-item div {
            font-size: 1.1rem;
        }

        .invite-item .actions {
            display: flex;
            gap: 10px;
        }

        .invite-item button {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.9rem;
        }

        .invite-item .accept {
            background-color: #28a745;
            color: white;
        }

        .invite-item .reject {
            background-color: #dc3545;
            color: white;
        }

        .invite-item button:hover {
            opacity: 0.8;
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
            <h2>Invites Received</h2>
            <div>You have invite requests from the following people:</div>
            <ol class="invite-list">
                <li class="invite-item">
                    <div>Bhavesh Sanjiv Kapur</div>
                    <div class="actions">
                        <button class="accept">Accept</button>
                        <button class="reject">Reject</button>
                    </div>
                </li>
                <li class="invite-item">
                    <div>Kashish</div>
                    <div class="actions">
                        <button class="accept">Accept</button>
                        <button class="reject">Reject</button>
                    </div>
                </li>
            </ol>
        </div>
    </div>

</body>
</html>
 



