<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="../styles/css/main.css" rel="stylesheet" type="text/css">
<%--
  Created by IntelliJ IDEA.
  User: kanst
  Date: 07.02.2020
  Time: 0:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<header>
    <div class="main-header">
        <img src="/../images/adboard.png" width="314" height="125" alt="adBoard.png"/>
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
<body>
<div class="messageSuccess">${messageSuccess}</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="user-details">
                <br>
                <h3 style="margin-left: 15px; margin-bottom: 15px">Данные пользователя:</h3>
                <h4>Имя: ${user.name}</h4>
                <h4>Фамилия: ${user.surname}</h4>
                <h4>E-mail: ${user.mail}</h4>
                <a href="toUpdateUser" class="header-button-fullPage">Изменить</a>
                <a href="../" class="header-button-fullPage">На главную</a>
                <h3 style="margin-bottom:0; margin-left: 15px; margin-top: 15px">Мои объявления: </h3>
            </div>
            <c:forEach var="ad" items="${adList}">
                <div class="ad">
                    <div><img src="data:image/jpg; base64, ${ad.imageName}" width="350" height="350"
                              alt="cat.jpg"/>
                    </div>
                    <div style="padding-left: 10px;">
                        <div><a href="/ads/${ad.adId}" class="ad-title"><c:out value="${ad.adTitle}"/></a></div>
                        <div><c:out value="${ad.adDescription}"/></div>
                    </div>
                </div>
            </c:forEach>
            <div style="height: 20px; background-color: #F5F2FF"></div>
        </div>
    </div>
</div>
</body>
<footer class="footer">
</footer>
</html>
<%session.removeAttribute("messageSuccess");%>