<%@ page import="com.softserve.itacademy.model.Task" %>
<%@ page import="com.softserve.itacademy.model.Priority" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit existing Task</title>

    <style>
        <%@include file="../styles/main.css"%>
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<%@include file="header.html" %>
<h2>Edit existing Task</h2>

<form action="/edit-task" id="myForm" method="post">

    <% Task task = (Task) request.getAttribute("task");%>
    <% String message = (String) request.getAttribute("message");%>

    <%
    if (message != null){
    %>
    <fieldset class="form-group">
        <label>Message:</label>
        <p><%=message%></p>
    </fieldset>
    <%}%>

    <fieldset class="form-group">
    <label>Id:</label> <input type="text" name="id" value="<%=task.getId()%>" readonly/>
    </fieldset>
    <fieldset class="form-group">
    <label>Name:</label> <input type="text" name="title" value="<%=task.getTitle()%>"/>
    </fieldset>
    <fieldset class="form-group">
        <label>Priority:</label>
        <select name="priority" class="form-select">

            <%
                for (Priority prio:
                     Priority.values()) {
            %>
            <option value="<%=prio.name()%>" <%=task.getPriority() == prio? "selected" : ""%>><%=prio.name()%></option>
            <%
                }
            %>

        </select><br/>
    </fieldset>
    </select>

    <input type="submit" class="btn btn-success" value="Update"/>
</form>
</body>
</html>
