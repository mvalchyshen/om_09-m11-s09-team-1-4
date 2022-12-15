<%@ page import="com.softserve.itacademy.model.Priority" %>
<%@ page import="com.softserve.itacademy.model.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new Task</title>

    <style>
        <%@include file="../styles/main.css"%>
    </style>
    
</head>
<body>
    <%@include file="header.html"%>
    <h2>Create new Task</h2>

    <form action="/create-task" method="post">
        <fieldset class="form-group">
            <label>Title</label> <input type="text" class="form-control"
                                              name="title" /><br />
        </fieldset>
        <fieldset class="form-group">
            <label>Priority</label> <input type="text" class="form-control"
                                           name="priority" /><br />
        </fieldset>
        <input type="submit" class="btn btn-success" value="Add"></input>
    </form>


</body>
</html>
