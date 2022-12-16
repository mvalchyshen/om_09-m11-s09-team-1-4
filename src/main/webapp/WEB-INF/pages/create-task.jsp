<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.softserve.itacademy.model.Priority" %>
<%@ page import="com.softserve.itacademy.model.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new Task</title>

    <style>
        <%@include file="../styles/main.css"%>
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<%@include file="header.html" %>
<h2>Create new Task</h2>

<form action="/create-task" id="myForm" method="post">
    <c:if test="${not empty message}">
        <fieldset class="form-group">
            <label>Message:</label>
            <p>${message}</p>
        </fieldset>
    </c:if>

    <fieldset class="form-group">
        <label>Name:</label> <input type="text" class="form-control"
                                    name="title" value="${not empty param.title ? param.title : ''}"/><br/>
    </fieldset>
    <fieldset class="form-group">
        <label>Priority:</label>
        <select name="priority" class="form-select">
            <c:forEach items="${Priority.values()}" var="prio">
                <option value="${prio.name()}" ${param.priority == prio.name() ? 'selected="selected"' : ''}>${prio.name()}</option>
            </c:forEach>
        </select><br/>
    </fieldset>

    <input type="submit" class="btn btn-success" value="Create"/>
    <input type="reset" class="btn btn-clear" value="Clear" onclick="document.getElementById('myForm').reset();"/>
</form>

</body>
</html>
