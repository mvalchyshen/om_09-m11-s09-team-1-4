<%@ page import="com.softserve.itacademy.model.Error" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>

    <style>
        <%@include file="../styles/main.css"%>
    </style>

</head>
<body>
<%@include file="header.html" %>

<% Error error = (Error) request.getAttribute("error");%>

<h2> <%=error.getDescription()%></h2>

</body>
</html>
