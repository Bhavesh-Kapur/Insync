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
            --sidebar-bg: #f2f4f8;
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
            padding: 20px 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            height: 100vh;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
        }

        .sidebar img {
            width: 80%;
            display: block;
            margin: 0 auto 10px auto;
        }

        .student-details {
            padding: 0;
            margin: 0;
            list-style: none;
        }

        .student-details li {
            margin-bottom: 15px;
            font-size: 16px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: nowrap;
        }

        .student-details span:first-child {
            font-weight: bold;
            width: 100px;
        }

        .student-details span:last-child {
            flex-grow: 1;
            text-align: right;
        }

        .logout-button {
            display: block;
            padding: 10px 20px;
            text-align: center;
            font-size: 16px;
            color: white;
            background-color: var(--primary-color);
            border-radius: 8px;
            text-decoration: none;
            transition: background-color 0.3s ease;
            margin-top: auto;
        }

        .logout-button:hover {
            background-color: #357ab8;
        }

        /* Main content */
        .content {
            flex-grow: 1;
            padding: 50px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
        }

        .content h1 {
            font-size: 32px;
            color: var(--heading-color);
            margin-bottom: 30px;
        }

        .form-group {
            width: 60%;
            margin-bottom: 20px;
        }

        .form-group label {
            font-size: 18px;
            font-weight: bold;
            color: var(--heading-color);
            margin-bottom: 10px;
            display: block;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group textarea {
            resize: vertical;
            height: 150px;
        }

        .submit-btn {
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            background-color: var(--primary-color);
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #357ab8;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <img src="https://static.vecteezy.com/system/resources/previews/006/877/567/non_2x/work-character-solid-icon-illustration-office-workers-teachers-judges-police-artists-employees-free-vector.jpg">
        <br>
        <ul class="student-details">
            <li><span>Name:</span> <span>${sessionScope.name}</span></li>
            <li><span>SAP ID:</span> <span>${sessionScope.sapid}</span></li>
            <li><span>Program:</span> <span>${sessionScope.program}</span></li>
            <li><span>Semester:</span> <span>${sessionScope.semester}</span></li>
        </ul>
        <a href="logout" class="logout-button">Logout</a>
    </div>

    <div class="content">
        <h1>Feedback</h1>
        <div class="form-group">
            <label for="groupId">Enter Group ID:</label>
            <input type="text" id="groupId" name="groupId" placeholder="Enter Group ID">
        </div>
        <div class="form-group">
            <label for="feedback">Enter Feedback:</label>
            <textarea id="feedback" name="feedback" placeholder="Write your feedback here"></textarea>
        </div>
        <button class="submit-btn">Submit</button>
    </div>
</body>
</html>
