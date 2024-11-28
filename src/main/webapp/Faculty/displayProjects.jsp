<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Assigned Projects</title>
</head>
<body>
    <h2>List of Projects Assigned to You</h2>

    <%
        List<Integer> projectIds = (List<Integer>) request.getAttribute("projectIds");

        if (projectIds != null && !projectIds.isEmpty()) {
            out.println("<ul>");
            for (Integer projectId : projectIds) {
                out.println("<li>Project ID: " + projectId + "</li>");
            }
            out.println("</ul>");
        } else {
            out.println("<p>You are not mentoring any projects.</p>");
        }
    %>
</body>
</html>