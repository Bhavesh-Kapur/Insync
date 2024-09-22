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
            margin-left: 250px;
            padding: 50px;
            flex-grow: 1;
        }

        h1 {
            font-size: 3rem;  /* Increased size for more appeal */
            color: var(--heading-color);
            margin-bottom: 20px;  /* Adjusted margin */
            text-align: left;  /* Left aligned */
        }

        .dropdown-container {
            margin-top: 20px;  /* Adjusted margin */
            text-align: left;  /* Left aligned */
        }

        select {
            width: 60%;  /* Reduced length of the dropdown */
            padding: 10px;
            font-size: 1rem;
            border: 2px solid var(--primary-color);
            border-radius: 12px;
            background: var(--accent-color);
            color: var(--text-color);
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px; /* Added margin for spacing */
        }

        input {
            width: 50%;  /* Match input width with dropdown */
            padding: 10px;
            font-size: 1rem;
            border: 2px solid var(--primary-color);
            border-radius: 12px;
            background: var(--accent-color);
            color: var(--text-color);
            cursor: text;
            transition: all 0.3s ease;
            margin-top: 10px; /* Added margin for spacing */
        }

        button {
            padding: 10px 15px;
            border: none;
            border-radius: 12px;
            background: var(--primary-color);
            color: white;
            cursor: pointer;
            margin-left: 10px;
            transition: all 0.3s ease;
            display: none;  /* Initially hidden */
        }

        button:hover {
            background: #3b7cd3;
        }

        select:focus, input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(74, 144, 226, 0.3);
        }
    </style>
</head>
<body>

    <!-- Sidebar with redirect icon -->
    <div class="sidebar">
        <div class="redirect-icon">
            <a href="dashboard.html">
                <img src="https://img.icons8.com/ios-glyphs/30/000000/home.png" alt="Dashboard Icon" title="Go to Dashboard">
            </a>
        </div>
    </div>

    <!-- Main Content Area -->
    <div class="main-content">
        <h1>Create Team</h1>

        <!-- Dropdown to select search type -->
        <div class="dropdown-container">
            <label for="search-type">Search By:</label>
            <select id="search-type" name="search-type" onchange="toggleInputField()">
                <option value="">-- Select --</option>
                <option value="name">Name</option>
                <option value="sap-id">SAP ID</option>
            </select>

            <!-- Input fields for typing either name or SAP ID -->
            <div id="name-container" style="display: none;">
                <input type="text" id="name-input" placeholder="Enter Name">
                <button id="search-name-button" onclick="searchStudent('name')" style="display: inline;">Search</button>
            </div>
            
            <div id="sap-container" style="display: none;">
                <input type="text" id="sap-id-input" placeholder="Enter SAP ID">
                <button id="search-sap-button" onclick="searchStudent('sap')" style="display: inline;">Search</button>
            </div>
        </div>

    </div>

    <script>
        function toggleInputField() {
            const searchType = document.getElementById("search-type").value;
            const nameContainer = document.getElementById("name-container");
            const sapContainer = document.getElementById("sap-container");

            if (searchType === "name") {
                nameContainer.style.display = "block";
                sapContainer.style.display = "none";
            } else if (searchType === "sap-id") {
                sapContainer.style.display = "block";
                nameContainer.style.display = "none";
            } else {
                nameContainer.style.display = "none";
                sapContainer.style.display = "none";
            }
        }

        function searchStudent(type) {
            if (type === 'name') {
                const name = document.getElementById("name-input").value;
                alert("Searching for Name: " + name);
                // Add functionality to search for the student based on the entered name here
            } else if (type === 'sap') {
                const sapId = document.getElementById("sap-id-input").value;
                alert("Searching for SAP ID: " + sapId);
                // Add functionality to search for the student based on the entered SAP ID here
            }
        }
    </script>

</body>
</html>