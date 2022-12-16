<%@ page import="com.softserve.itacademy.model.Task" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List of Tasks</title>

    <style>
        <%@include file="../styles/main.css"%>
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<%@include file="header.html" %>

<div class="container">
    <p>List of Tasks</p>
    <table class="table table-striped">
        <thead>
        </thead>
        <tbody>
        <th>Id</th>
        <th>Title</th>
        <th>Priority</th>
        <th></th>
        </tbody>
        <c:forEach items="${tasks}" var="task">
            <tr>
                <td>${task.id}</td>
                <td>${task.title}</td>
                <td>${task.priority}</td>
                <td><a class="btn btn-success"
                       href="/readTask?itemName=${task.id}">read
                </a></td>
                <td><a class="btn btn-success"
                       href="/updateTask?itemName=${task.id}">update

                </a></td>
                <td><a class="btn btn-danger"
                       href="/delete-task?id=${task.id}">delete

                </a></td>
            </tr>
        </c:forEach>
    </table>

</div>

</body>
</html>
