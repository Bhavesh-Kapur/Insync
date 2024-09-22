<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Form</title>
    <style>
        .container {
            border: 2px solid black;
            width: 40%;
            padding: 10px;
        }
        body {
            margin: 200px;
            margin-left: 300px;
        }
        .a {
            display: grid;
            place-items: center;
        }
        .b {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="a">
        <div class="container">
            <div class="b">
                <p><b>Login   </b></p>
            </div>
            <% if (request.getParameter("error") != null) { %>
                <div class="error">Invalid SAP ID or Password. Please try again.</div>
            <% } %>
            <form action="login" method="post"> 
                <p><b>SAP ID:</b>
                    <input type="number" placeholder="Enter SAP ID" name="sapId" required> 
                </p>
                <p><b>Password:</b>
                    <input type="password" placeholder="Enter password" name="password" required> 
                </p> 
                <br>
                <button type="submit">Submit</button>
            </form>
        </div>
    </div>
</body>
</html>
