<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kanst
  Date: 01.02.2020
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="styles/css/main.css" rel="stylesheet" type="text/css">
<html>
<head>
    <title>Обновление данных пользователя:</title>
</head>
<body>
<header>
    <div class="main-header">
        <img src="../images/adboard.png" width="314" height="125" alt="adBoard.png"/>
        <div class="login">
            <c:if test="${userId == null}">
                <jsp:include page="loginPage.jsp"/>
            </c:if>
            <c:if test="${userId != null}">
                <jsp:include page="userInfo.jsp"/>
            </c:if>
        </div>
    </div>
</header>
<div class="container">
    <div class="create-ad-page">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <h2 class="create-ad-page-title">Обновление данных пользователя:</h2>
                <div class="message">${message}</div>
                <form action="updateUserInfo" method="post">
                    <table width="100%" cellspacing="0" cellpadding="4">
                        <tr>
                            <td align="right" width="100">Имя пользователя:</td>
                            <td><label>
                                <input name="login" value="${user.login}">
                            </label></td>
                        </tr>
                        <tr>
                            <td align="right" width="100">Пароль:</td>
                            <td><label>
                                <input type="password" name="password" value="${user.password}">
                            </label></td>
                        </tr>
                        <tr>
                            <td align="right" width="100">Повторите пароль:</td>
                            <td><label>
                                <input type="password" name="repeat_password" value="${user.password}">
                            </label></td>
                        </tr>
                        <tr>
                            <td align="right" width="100">Ваше имя:</td>
                            <td><label>
                                <input name="name" value="${user.name}">
                            </label></td>
                        </tr>
                        <tr>
                            <td align="right" width="100">Ваша фамилия:</td>
                            <td><label>
                                <input name="surname" value="${user.surname}">
                            </label></td>
                        </tr>
                        <tr>
                            <td align="right" width="100">E-mail:</td>
                            <td><label>
                                <input name="mail" value="${user.mail}">
                            </label></td>
                        </tr>
                        <tr>
                            <td align="right"><input class="header-button-fullPage" type="submit" value="Обновить">
                            </td>
                            <td>
                                <button class="header-button-fullPage"><a href="../"
                                                                          style="color: #333333">Отмена</a>
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

<%--<form action="updateUserInfo" method="post">--%>
<%--    <p>Login:<label>--%>
<%--        <input name="login" value="${user.login}">--%>
<%--    </label>--%>
<%--    <p>Password:<label>--%>
<%--        <input type="password" name="password" value="${user.password}">--%>
<%--    </label>--%>
<%--    <p>Repeat Password:<label>--%>
<%--        <input type="password" name="repeat_password" value="${user.password}">--%>
<%--    </label>--%>
<%--    <p>Your name:<label>--%>
<%--        <input name="name" value="${user.name}">--%>
<%--    </label>--%>
<%--    <p>Your surname:<label>--%>
<%--        <input name="surname" value="${user.surname}">--%>
<%--    </label>--%>
<%--    <p>Your e-mail:<label>--%>
<%--        <input name="mail" value="${user.mail}">--%>
<%--    </label>--%>
<%--    <p><input type="submit">--%>
<%--        <button><a href="fullPage">Cancel</a></button>--%>
<%--    </p>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>
<%session.removeAttribute("message");%>