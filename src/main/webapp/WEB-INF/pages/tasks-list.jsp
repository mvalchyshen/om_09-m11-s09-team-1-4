<%@ page import="com.softserve.itacademy.model.Task" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of Tasks</title>

    <style>
        <%@include file="../styles/main.css"%>
    </style>

</head>
<body>
    <%@include file="header.html"%>

    <div class="container">
        <p>You have the following tasks</p>
        <table class="table table-striped">
            <thead>
            </thead>
            <tbody>
            <th>Id</th>
            <th>Title</th>
            <th>Priority</th>
            </tbody>
            <c:forEach items="${tasks}" var="task">
                <tr>
                    <td>${task.i}</td>
                    <td>${task.title}</td>
                    <td>${task.priority}</td>
                    <td><a class="btn btn-danger"
                           href="/deleteTask?itemName=${task.id}">Delete
                    </a></td>
                </tr>
            </c:forEach>
        </table>

        <a class="btn btn-success" href="/create-task"> Add </a>

    </div>

</body>
</html>
