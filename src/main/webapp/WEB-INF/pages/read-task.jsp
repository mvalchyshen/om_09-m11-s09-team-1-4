<%@ page import="com.softserve.itacademy.model.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Read existing Task</title>

    <style>
        <%@include file="../styles/main.css"%>
    </style>

</head>
<body>
<%@include file="header.html" %>
<h2>Read existing Task</h2>
<%
    Task task = (Task) request.getAttribute("task");
%>
Id: <strong><%=task.getId()%></strong>
</p>
<p>Title: <strong><%=task.getTitle()%></strong>
</p>
<p>Priority: <strong><%=task.getPriority()%></strong>
</p>


</body>
</html>
