<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Activity Coordination</title>
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #d6e9f8;
            --light-blue: #e3f2fd;
            --text-color: #333333;
        }

        body {
            font-family: "Poppins", sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--secondary-color);
            color: var(--text-color);
            display: flex;
            height: 100vh;
        }

        /* Left section */
        .left-section {
            background-color: var(--light-blue);
            width: 20%;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            box-sizing: border-box;
            text-align: center;
        }

        .pics img {
            width: 100px; /* Adjust size as needed */
            height: 100px; /* Match width to ensure it's a perfect circle */
            border-radius: 50%; /* Makes the image circular */
            object-fit: cover; /* Ensures the image fits within the circle */
            display: block; /* Ensures proper centering */
            margin: 0 auto; /* Centers the image horizontally */
            border: 2px solid var(--primary-color); /* Optional: Adds a border */
        }

        /* Main content */
        .main-content {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            overflow-y: auto;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .panel-group {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .panel {
            background-color: white;
            border: 1px solid var(--primary-color);
            border-radius: 10px;
            padding: 20px;
            width: 40%;
            box-sizing: border-box;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .panel:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .panel h3 {
            margin-bottom: 10px;
            font-size: 18px;
        }

        .panel a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: bold;
        }

        .panel a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <!-- Left Section -->
    <div class="left-section">
        <div class="pics">
            <img src="./WhatsApp Image 2024-11-10 at 22.43.03 (1).jpeg" alt="Logo">
        </div>
        <h3>Activity Coorionnnnacaacacnnn</h3>
        <p></p>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h1></h1>
        </div>

        <div class="panel-group">
            <!-- Example Panel -->
            <div class="panel">
                <h3>Project List</h3>
                <p>Details about the project...</p>
                <a href="javascript:void(0);" onclick="projList();">View Projects</a>
            </div>
            <div class="panel">
                <h3>Student List</h3>
                <p>Details about students...</p>
                <a href="#">View List</a>
            </div>
            <div class="panel">
                <h3>Panel Group</h3>
                <p>Other relevant info...</p>
                <a href="#">View More</a>
            </div>
        </div>
    </div>

</body>

<script>
function projList() {
    const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 1)); // Gets your context path
    const url = contextPath + "/projList";   
    window.location.href = url;
}
</script>
</html>
