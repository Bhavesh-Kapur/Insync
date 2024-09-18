<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> Login Form</title>
<style>
   
      
.container
{
    border: 2px solid black;
    width: 40%;
    padding: 10px;
    
    
}
body{
   margin: 200px;
   margin-left: 300px;
   
}
.a{
    display: grid;
    place-items: center;
}
.b{
    text-align: center;
}

</style>
</head>
<body>
<form >
    <div class="a">
        <div class="container">
            <form action="" method="post">
                <div class="b">
                <p><B>Login</B></p>
                </div>
            <p><B>SAP ID: </B>
                <input type="number" placeholder="Enter Sap Id" name="uname"></p>
            <p><b>Password:</b><input type="password" placeholder="Enter password" name="psw"></p> 
                
            <br>
            <button type="submit"> Submit</button>

            </form>
</body>
</html>