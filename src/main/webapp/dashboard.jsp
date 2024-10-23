<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%
    if (session == null || session.getAttribute("sapid") == null) {
        response.sendRedirect("index.jsp"); // Redirect to login page if not logged in
        return; // Ensure the rest of the page is not processed
    }
    // int sapId = (int) session.getAttribute("sapid");
%>


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
            flex-wrap: wrap;
            gap: 30px;
            justify-content: space-between;
        }

        .team-box {
            background-color: white;
            padding: 20px;
            border: 2px solid var(--primary-color);
            border-radius: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
            width: calc(33.33% - 30px);
            height: 250px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            box-sizing: border-box;
        }

        .team-box:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .team-box a {
            text-decoration: none;
            color: var(--primary-color);
            font-size: 20px;
            font-weight: bold;
        }

        .team-box a:hover {
            text-decoration: underline;
        }
        .team-formation{
            
    background-image: url('https://www.shutterstock.com/image-vector/hand-charity-foundation-logo-260nw-774421195.jpg'); 
    background-size: cover; 
    background-position: center; 
    background-repeat: no-repeat; 
    color: white; 

        }
        form {
            margin-top: 10px;
        }

        form button {
            padding: 10px 20px;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
        }

        form button:hover {
            background-color: #357abd;
        }
        .a{
            margin-top: 300px;
            color: #0a0a0a;
        }
        .status{
            
            background-image: url('https://cdn-icons-png.flaticon.com/512/8767/8767583.png '); 
            background-size: cover; 
            background-position: center;
            background-repeat: no-repeat; 
            color: white; 
            background-size: 260px 220px;
            
        
                }

             .inbox{
            background-image: url('https://icon-library.com/images/inbox-icon-png/inbox-icon-png-15.jpg'); 
            background-size: cover; 
            background-position: center;
            background-repeat: no-repeat; 
            color: white;

                }
                .discussion{
            background-image: url('https://static.vecteezy.com/system/resources/previews/004/413/153/large_2x/outlined-icon-of-group-of-people-doing-discussion-suitable-for-design-element-of-teamwork-discussion-social-networking-and-business-forum-free-vector.jpg'); 
            background-size: cover; 
            background-position: center;
            background-repeat: no-repeat; 
            color: white;

                }
                .mentor{
            background-image: url('https://www.google.com/url?sa=i&url=https%3A%2F%2Fstock.adobe.com%2Fsearch%3Fk%3Dmentoring%2Blogo&psig=AOvVaw2REyhV3UGJZCTeC1vY4b28&ust=1729742539560000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCIjCpZ7Po4kDFQAAAAAdAAAAABAE'); 
            background-size: cover; 
            background-position: center;
            background-repeat: no-repeat; 
            color: white;
                }
                .details{
                   
            background-image: url('https://static.vecteezy.com/system/resources/previews/008/461/358/non_2x/team-project-filled-line-icon-linear-style-sign-for-mobile-concept-and-web-design-outline-icon-symbol-logo-illustration-graphic-free-vector.jpg'); 
            background-size: cover; 
            background-position: center;
            background-repeat: no-repeat; 
            color: white;

                }
                
                
                
    </style>
</head>
<body>

    <div class="sidebar">
        <img src="https://seecs.nust.edu.pk/wp-content/uploads/2020/06/studentconcern-icon.png">
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
        <div class="team-box team-formation">
            <div>
            <a href="searchStudent.jsp"></a>
            <div class="a">
                 <a href="searchStudent.jsp">Team Formation</a>
            </div>
            </div>
        </div>
        
        <div class="team-box status">
            <a href="javascript:void(0);" onclick="Status();"></a>
            <div class="a">
                <a href="javascript:void(0);" onclick="Status();">Team Status</a>
            </div>
        </div>
        <div class="team-box details">
            <a href="project_details.jsp"></a>
            <div class="a">
            <a href="javascript:void(0);" onclick="projDetails();">Project Details</a>
            </div>
        </div>
        <div class="team-box inbox">
            <a href="javascript:void(0);" onclick="fetchInvite();"></a>
            <div class="a">
                <a href="javascript:void(0);" onclick="fetchInvite();">Inbox</a>
            </div>
        </div>
        <div class="team-box discussion">
            <a href=""></a>
            <div class="a">
               <a href="">Team Discussion</a>
            </div>
        </div>
        <div class="team-box mentor">
            <a href="invitementor.jsp"></a>
            <div class="a">
                <a href="invitementor.jsp">Mentor Request</a>
            </div>
        </div>
    </div>

</body>
<script>
    function fetchInvite() {
        const url = "fetchInvite";   
        window.location.href = url;
    }

    function projDetails() {
        const url = "ProjDetails";   
        window.location.href = url;
    }
    function Status() {
        const url = "StatusServlet";
        window.location.href = url;
    }
</script>
</html>
