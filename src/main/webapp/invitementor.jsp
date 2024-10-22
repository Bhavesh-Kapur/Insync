<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invite Mentor</title>
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #d6e9f8;
            --accent-color: #ffffff;
            --background-gradient: linear-gradient(135deg, #d6e9f8, #ffffff);
            --heading-color: #0a0a0a;
            --text-color: #333333;
            --box-shadow: rgba(31, 38, 135, 0.2);
            --close-color: #f44336; /* Red color for close button */
        }

        body {
            font-family: "Poppins", sans-serif;
            background: var(--secondary-color);
            display: flex;
            height: 100vh;
            margin: 0;
            padding: 0;
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
            margin-left: 250px;
            padding: 50px;
            flex-grow: 1;
        }

        h1 {
            font-size: 3rem;
            color: var(--heading-color);
            margin-bottom: 30px; /* Increased bottom margin for spacing */
        }

        input {
            width: 50%;
            padding: 10px;
            font-size: 1rem;
            border: 2px solid var(--primary-color);
            border-radius: 12px;
            background: var(--accent-color);
            color: var(--text-color);
            cursor: text;
            margin-top: 10px;
        }

        button {
            padding: 12px 20px; /* Increased padding for better visibility */
            border: none;
            border-radius: 12px;
            background: var(--primary-color);
            color: white;
            cursor: pointer;
            margin-left: 10px;
            transition: all 0.3s ease;
            font-size: 1rem; /* Increased font size */
        }

        button:hover {
            background: #3b7cd3;
        }

        /* Dialog Box Styling */
        .dialog-box {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 50%;
            max-width: 500px;
            background-color: var(--accent-color);
            box-shadow: 0 10px 30px var(--box-shadow);
            border-radius: 20px;
            padding: 20px;
            display: none;
            text-align: center; /* Center text in the dialog box */
        }

        .dialog-box.active {
            display: block;
        }

        .dialog-box h2 {
            font-size: 2.5rem; /* Increased heading size */
            margin: 10px 0; /* Adjusted margin for spacing */
        }

        .dialog-box table {
            width: 100%; /* Full width for table */
            margin: 20px 0; /* Margin around the table */
            border-collapse: collapse; /* Remove space between cells */
        }

        .dialog-box th, .dialog-box td {
            padding: 10px; /* Padding inside cells */
            text-align: left; /* Align text to the left */
            font-size: 1.2rem; /* Font size for table */
        }

        .dialog-box th {
            font-weight: bold; /* Bold header text */
        }

        .dialog-buttons {
            display: flex;
            justify-content: center; /* Center buttons */
            margin-top: 20px; /* Add space above buttons */
        }

        .close-btn {
            background: var(--close-color); /* Set color for close button */
            margin-left: 10px; /* Add space between buttons */
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <div class="redirect-icon">
            <a href="dashboard.html">
                <img src="https://img.icons8.com/ios-glyphs/30/000000/home.png" alt="Dashboard Icon" title="Go to Dashboard">
            </a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h1>Invite Mentor</h1>

        <!-- Search input for Mentor by Name -->
        <input type="text" id="mentor-name-input" placeholder="Enter Mentor Name">
        <button onclick="searchMentor()">Search</button>
    </div>

    <!-- Dialog box for displaying mentor details -->
    <div id="mentorDialog" class="dialog-box">
        <h2>Mentor Details</h2>
        <table>
            <tr>
                <th>Name:</th>
                <td>Dr. John Doe</td>
            </tr>
            <tr>
                <th>Department:</th>
                <td>Computer Science</td>
            </tr>
            <tr>
                <th>Specialization:</th>
                <td>AI and Machine Learning</td>
            </tr>
            <tr>
                <th>Seating Area:</th>
                <td>Room 101, Block A</td>
            </tr>
            <tr>
                <th>Official Mail ID:</th>
                <td>john.doe@upes.ac.in</td>
            </tr>
        </table>
        <div class="dialog-buttons">
            <button class="invite-btn" onclick="inviteMentor()">Invite</button>
            <button class="close-btn" onclick="closeDialog()">Close</button>
        </div>
    </div>

    <script>
        function searchMentor() {
            // Simulate a search and show the dialog if a mentor is found
            document.getElementById('mentorDialog').classList.add('active');
        }

        function closeDialog() {
            document.getElementById('mentorDialog').classList.remove('active');
        }

        function inviteMentor() {
            alert("Mentor Invited!");
            closeDialog(); // Close dialog after inviting
        }
    </script>

</body>
</html>
