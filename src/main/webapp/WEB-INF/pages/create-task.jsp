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

</head>
<body>
<%@include file="header.html" %>
<h2>Create new Task</h2>

<form action="${pageContext.request.contextPath}/create-task" method="post">
    <fieldset class="form-group">
        <label>Name:</label> <input type="text" class="form-control"
                                    name="title"/><br/>
        <label>Priority:</label>
        <select name="priority">
            <c:forEach items="${Priority.values()}" var="priority">
                <option value="${priority.name()}">${priority.name()}</option>
            </c:forEach>
        </select><br/>
    </fieldset>

    <input type="submit" class="btn btn-success" value="Create"/>
</form>

</body>
</html>
