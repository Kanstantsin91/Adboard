<%--
  Created by IntelliJ IDEA.
  User: kanst
  Date: 05.01.2020
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="styles/css/main.css" rel="stylesheet" type="text/css">
<html>
<head>
    <title>Registration</title>
</head>
<header>
    <div class="main-header">
        <img src="../images/adboard.png" width="314" height="125" alt="adBoard.png"/>
    </div>
</header>
<body>
<div class="container">
    <div class="create-ad-page">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <h2 class="create-ad-page-title">Регистрация нового пользователя:</h2>
                <div class="message">${message}</div>
                <form action="create" method="post">
                    <table width="100%" cellspacing="0" cellpadding="4">
                        <tr>
                            <td align="right" width="100">Имя пользователя:</td>
                            <td><label>
                                <input name="login" required>
                            </label></td>
                        </tr>
                        <tr>
                            <td align="right" width="100">Пароль:</td>
                            <td><label>
                                <input type="password" name="password" required>
                            </label></td>
                        </tr>
                        <tr>
                            <td align="right" width="100">Повторите пароль:</td>
                            <td><label>
                                <input type="password" name="repeat_password" required>
                            </label></td>
                        </tr>
                        <tr>
                            <td align="right" width="100">Ваше имя:</td>
                            <td><label>
                                <input name="name" required>
                            </label></td>
                        </tr>
                        <tr>
                            <td align="right" width="100">Ваша фамилия:</td>
                            <td><label>
                                <input name="surname" required>
                            </label></td>
                        </tr>
                        <tr>
                            <td align="right" width="100">E-mail:</td>
                            <td><label>
                                <input name="mail" required>
                            </label></td>
                        </tr>
                        <tr>
                            <td align="right"><input class="header-button-fullPage" type="submit" value="Регистрация">
                            </td>
                            <td>
                                <button class="header-button-fullPage"><a href="../"
                                                                          style="color: #333333">Cancel</a>
                                </button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</div>
</body>
<footer class="footer"></footer>
</html>
<%session.removeAttribute("message");%>