<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="styles/css/main.css" rel="stylesheet" type="text/css">
<%--
  Created by IntelliJ IDEA.
  User: kanst
  Date: 25.12.2019
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Доска объявлений</title>
</head>
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
<body>

<div class="container">
    <div class="header-funcs">
        <div class="messageSuccess">${messageSuccess}</div>
        <div class="message">${message}</div>
        <c:if test="${userId != null}">
            <div class="crateAdLink">
                <a href="toCreateAd" class="header-button">Новое объявление</a>
            </div>
            <c:if test="${hidden==false}">
                <div>
                    <a href="hideMyAds" class="header-button">Спрятать мои</a>
                </div>
            </c:if>
            <c:if test="${hidden==true}">
                <div>
                    <a href="showAll" class="header-button">Показать все</a>
                </div>
            </c:if>
        </c:if>
    </div>
    <div class="row">
        <div class="col-md-12">
            <c:forEach var="ad" items="${adList}">
                <div class="ad">
                    <div><img src="data:image/jpg; base64, ${ad.imageName}" width="350" height="350" alt="cat.jpg"/>
                    </div>
                    <div style="padding-left: 10px;">
                        <div><a href="/ads/${ad.adId}" class="ad-title"><c:out value="${ad.adTitle}"/></a></div>
                        <div><c:out value="${ad.adDescription}"/></div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<footer class="footer"></footer>
</body>
</html>
<%session.removeAttribute("message");%>
<%session.removeAttribute("messageSuccess");%>