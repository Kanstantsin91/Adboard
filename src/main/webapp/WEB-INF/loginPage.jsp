<%--
  Created by IntelliJ IDEA.
  User: kanst
  Date: 05.01.2020
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Login</title>
</head>
<body>
<form action="login" method="post">
    <div class="container">
        <div>
                <input type="text" placeholder="Enter Username" name="login">
        </div>
        <div>
                <input type="password" placeholder="Enter Password" name="password">
        </div>
        <p style="font-size: small">
            <c:if test="${userId == null}">
            <button type="submit">Вход</button>
            <button><a href="toCreate">Регистрация</a></button>
            </c:if>
            <c:if test="${userId != null}">
            <a href="logout" class="header-button">Log out</a>
            </c:if>
    </div>
</form>
</body>
</html>
