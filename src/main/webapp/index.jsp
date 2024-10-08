<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal Login</title>
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #d6e9f8;
            --accent-color: #ffffff;
            --background-gradient: linear-gradient(135deg, #d6e9f8, #ffffff);
            --heading-color: #0a0a0a;
            --text-color: #333333;
            --glass-bg: rgba(255, 255, 255, 0.85);
            --glass-border: rgba(255, 255, 255, 0.3);
        }
        
        body {
            font-family: "Poppins", sans-serif;
            background: var(--background-gradient);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 20px;
            box-sizing: border-box;
            color: var(--text-color);
            position: relative;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('https://smartcampuses.com/wp-content/uploads/revslider/web-agency-home-content/Slide-2-Background.jpg');
            background-size: cover;
            background-position: center;
            z-index: -1;
            filter: blur(2px);
            opacity: 0.7555;
        }

        .container {
            background: var(--glass-bg);
            border-radius: 20px;
            border: 1px solid var(--glass-border);
            padding: 30px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 10px 30px rgba(31, 38, 135, 0.2);
            z-index: 1;
        }

        h2 {
            text-align: center;
            font-size: 2rem;
            font-weight: 700;
            color: var(--heading-color);
            margin: 10px 0 20px;
            letter-spacing: 1px;
        }

        .input-group {
            margin-bottom: 15px;
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--text-color);
        }

        input {
            width: calc(100% - 30px);
            padding: 0.75rem;
            border: 2px solid var(--primary-color);
            border-radius: 12px;
            background: var(--accent-color);
            color: var(--text-color);
            font-size: 1rem;
            transition: all 0.3s ease;
            margin-left: 0;
        }

        input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(97, 162, 238, 0.3);
        }

        button {
            width: 100%;
            padding: 0.9rem;
            background: var(--primary-color);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 20px;
            text-transform: uppercase;
        }

        button:hover {
            background: #3b7cd3;
            transform: translateY(-3px);
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
        }

        button:active {
            transform: translateY(0);
        }

        .error {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: #f44336;
            border: 1px solid #c62828;
            color: #ffffff;
            padding: 10px;
            border-radius: 5px;
            width: 300px;
            z-index: 10;
            transition: opacity 0.5s;
            opacity: 1;
            line-height: 1.2;
            max-height: 60px;
            overflow: hidden;
        }

        .error.hidden {
            opacity: 0;
            visibility: hidden;
        }

        @keyframes fadeOut {
            0% {
                opacity: 1;
            }
            80% {
                opacity: 1;
            }
            100% {
                opacity: 0;
                visibility: hidden;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form action="login" method="post">
            <div class="input-group">
                <label for="uname">SAP ID</label>
                <input type="number" id="uname" placeholder="Enter SAP ID" name="sapId" required>
            </div>
            <div class="input-group">
                <label for="psw">Password</label>
                <input type="password" id="psw" placeholder="Enter Password" name="password" required>
            </div>
            <button type="submit">Login</button>
        </form>
    </div>

    <div id="errorBox" class=error <%= request.getParameter("error") != null ? "" : "hidden" %>">
        Invalid SAP ID or Password. Please try again.
    </div>
</body>
</html>

    <% if (request.getParameter("error") != null) { %>
        <style>
            #errorBox {
                animation: fadeOut 3s forwards;
            }
        </style>
    <% } %>

