<%--
  Created by IntelliJ IDEA.
  User: kanst
  Date: 01.02.2020
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="styles/css/main.css" rel="stylesheet" type="text/css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="message">${message}</div>
<form action="updateUserInfo" method="post">
    <p>Login:<label>
        <input name="login" value="${user.login}">
    </label>
    <p>Password:<label>
        <input type="password" name="password" value="${user.password}">
    </label>
    <p>Repeat Password:<label>
        <input type="password" name="repeat_password" value="${user.password}">
    </label>
    <p>Your name:<label>
        <input name="name" value="${user.name}">
    </label>
    <p>Your surname:<label>
        <input name="surname" value="${user.surname}">
    </label>
    <p>Your e-mail:<label>
        <input name="mail" value="${user.mail}">
    </label>
    <p><input type="submit">
        <button><a href="fullPage">Cancel</a></button>
    </p>
</form>
</body>
</html>
<%session.removeAttribute("message");%>