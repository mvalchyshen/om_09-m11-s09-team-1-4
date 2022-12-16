<%@ page import="com.softserve.itacademy.model.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Read existing Task</title>

    <style>
        <%@include file="../styles/main.css"%>
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
