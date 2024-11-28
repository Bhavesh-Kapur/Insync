<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, in.upes.projectmanagement.Faculty.mProject" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentor Dashboard</title>
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
            padding: 20px;
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

        .teacher-details {
            padding: 0;
            margin: 0;
            list-style: none;
        }

        .teacher-details li {
            margin-bottom: 15px;
            font-size: 16px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: nowrap;
        }

        .teacher-details span:first-child {
            font-weight: bold;
            width: 100px;
        }

        .teacher-details span:last-child {
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
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 30px;
            padding: 50px;
            height: 100vh;
            overflow: hidden;
            box-sizing: border-box;
        }

        .activity-box {
            background-color: white;
            padding: 20px;
            border: 2px solid var(--primary-color);
            border-radius: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            box-sizing: border-box;
            width: 80%;
            height: 0;
            padding-top: 40%; /* Increased height */
        }

        .activity-box:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .activity-box a {
            text-decoration: none;
            color: var(--primary-color);
            font-size: 20px;
            font-weight: bold;
        }

        .activity-box a:hover {
            text-decoration: underline;
        }

        /* Specific activity styles */
        
        .activity-1 {
    background-image: url('https://cdn-icons-png.flaticon.com/512/12148/12148681.png');
    background-size: 200px 200px; /* Adjust the image size */
    background-position: center;
    background-repeat: no-repeat;
    color: white;
    width: 80%;   /* Use width to adjust the overall div if needed */
    height: 0;      /* Height will depend on the padding for aspect ratio */
    padding-top: 40%; /* Maintain aspect ratio as needed */
}



        .activity-2 {
            background-image: url('https://icon-library.com/images/students-icon/students-icon-7.jpg');
    background-size: 250px 220px; /* Adjust the image size */
    background-position: center;
    background-repeat: no-repeat;
    color: white;
    width: 80%;   /* Use width to adjust the overall div if needed */
    height: 0;      /* Height will depend on the padding for aspect ratio */
    padding-top: 40%; /* Maintain aspect ratio as needed */
           
        }

        .activity-3 {
            background-image: url('https://cdn2.iconfinder.com/data/icons/business-attitude/512/meeting-256.png');
            background-size: 250px 220px; /* Adjust the image size */
    background-position: center;
    background-repeat: no-repeat;
    color: white;
    width: 80%;   /* Use width to adjust the overall div if needed */
    height: 0;      /* Height will depend on the padding for aspect ratio */
    padding-top: 40%; 
        }

        .activity-4 {
            background-image: url('https://thumbs.dreamstime.com/b/check-list-linear-icon-clipboard-marks-setting-vector-illustration-236017995.jpg');
            background-size: 250px 220px; /* Adjust the image size */
    background-position: center;
    background-repeat: no-repeat;
    color: white;
    width: 80%;   /* Use width to adjust the overall div if needed */
    height: 0;      /* Height will depend on the padding for aspect ratio */
    padding-top: 40%; 
        }
        .a{
            margin-top: 110px;
        }

        /* Responsiveness */
        @media (max-width: 768px) {
            .content {
                grid-template-columns: 1fr;
                padding: 20px;
            }
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <img src="https://static.vecteezy.com/system/resources/previews/006/877/567/non_2x/work-character-solid-icon-illustration-office-workers-teachers-judges-police-artists-employees-free-vector.jpg" alt="Teacher Icon">
        <br>
        <!-- <ul class="teacher-details"> -->
            <p>Panel Member</p>
           <p>Name: Dr.Smith</p>
           <p>Sap I'd:400107137</p>
           <p>School: SOCS</p>
           <p>Sitting Area:9104</p>
        <a href="logout" class="logout-button">Logout</a>
    </div>

    <div class="content">
        <!-- First row: Two activity divs -->
        <div class="activity-box activity-1">
            <!-- No text here, just the image background -->
             <div class ='a'>
                <a href="">Project List</a>
             </div>
        </div>
        <div class="activity-box activity-2">
            <!-- No text here, just the image background -->
             <div class ='a'>
               
                <!-- <a href="javascript:void(0);" onclick="studentList();">Students List</a> -->4
                 <a href="panel.jsp">Give Marks</a>
             </div>
        </div>

        <!-- Second row: Two activity divs -->
        <div class="activity-box activity-3">
            <!-- No text here, just the image background -->
             <div class="a">
                <!-- <a href="javascript:void(0);" onclick="profList();">Panel List</a>  -->
                 <a href="">Mark Documents</a>
             </div>
        </div>
        <div class="activity-box activity-4">
            <!-- No text here, just the image background -->
             <div class="a">
                <a href="">Call Students</a>
             </div>
        </div>
    </div>

</body>
<!-- <script>
    function projList() {
        const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 1)); // Gets your context path
        const url = contextPath + "/projList";   
        window.location.href = url;
    }
    
    function studentList() {
        const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 1)); // Gets your context path
        const url = contextPath + "/studentList";   
        window.location.href = url;
    }
    
    function profList() {
        const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 1)); // Gets your context path
        const url = contextPath + "/profList";   
        window.location.href = url;
    }
    
    </script> -->
    </html>
    

