<%--
  Created by IntelliJ IDEA.
  User: kanst
  Date: 05.01.2020
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="styles/css/main.css" rel="stylesheet" type="text/css">
<html>
<head>
    <title>Registration</title>
</head>
<body>
<div class="message">${message}</div>
<form action="create" method="post">
    <p>Login:<label>
        <input name="login" required>
    </label>
    <p>Password:<label>
        <input type="password" name="password" required>
    </label>
    <p>Repeat Password:<label>
        <input type="password" name="repeat_password" required>
    </label>
    <p>Your name:<label>
        <input name="name"required>
    </label>
    <p>Your surname:<label>
        <input name="surname"required>
    </label>
    <p>Your e-mail:<label>
        <input name="mail" required>
    </label>
    <p><input type="submit" value="Регистрация">
        <button><a href="/">Отмена</a></button>
    </p>
</form>
</body>
</html>
<%session.removeAttribute("message");%>