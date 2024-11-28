<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<!DOCTYPE html>
<html>
<head>
    <title>Assign Panels to Projects</title>
</head>
<body>
    <h1>Assign Panels to Projects</h1>
    <form action="ManagePanelsServlet" method="post">
    <input type="hidden" name="action" value="assignPanels">
    <label for="projectId">Select Project:</label>
    <select name="projectId" id="projectId" required>
        <c:forEach var="project" items="${projectList}">
            <option value="${project.projectId}">${project.projectDetails} (Semester: ${project.semester})</option>
        </c:forEach>
    </select>

    <label for="panel1Id">Select Panel 1:</label>
    <select name="panel1Id" id="panel1Id" required>
        <c:forEach var="panel" items="${panelList}">
            <option value="${panel.profId}">${panel.name}</option>
        </c:forEach>
    </select>

    <label for="panel2Id">Select Panel 2:</label>
    <select name="panel2Id" id="panel2Id" required>
        <c:forEach var="panel" items="${panelList}">
            <option value="${panel.profId}">${panel.name}</option>
        </c:forEach>
    </select>

    <button type="submit">Assign Panels</button>
</form>

    <c:if test="${not empty message}">
        <p style="color: green;">${message}</p>
    </c:if>
    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>
</body>
</html>