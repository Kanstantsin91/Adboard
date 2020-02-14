<%--
  Created by IntelliJ IDEA.
  User: kanst
  Date: 27.01.2020
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="styles/css/main.css" rel="stylesheet" type="text/css">
<html>
<body>
<h2 class="nameOnMain">Hello, <a href="fullPage" class="username">${user.login}!</h2>
<div class="userInfo">
    <a href="logout" class="logout">Log out</a>
</div>
</body>
</html>
